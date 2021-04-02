extends Node

signal success
signal failure(message)


export var matchmaking_url := "wss://localhost:2093"
var socket_client := WebSocketClient.new()

const NO_MATCH := 4000



func _ready() -> void:
	enable_tls(false)
	socket_client.connect("data_received", self, "receive_token")
	socket_client.connect("connection_error", self, "connection_error")
	socket_client.connect("connection_closed", self, "connection_closed")
	socket_client.connect("server_close_request", self, "close_requested")

func _process(_delta: float) -> void:
	# 'poll' sender ikke noget over netværket
	socket_client.poll()



func enable_tls(verify_with_ca: bool) -> void:
	socket_client.set_verify_ssl_enabled(verify_with_ca)
	var certificate := load("res://TLS/matchmaking_cert.crt")
	socket_client.set_trusted_ssl_certificate(certificate)


func request_token() -> void:
	var error := socket_client.connect_to_url(matchmaking_url)
	if error != OK:
		emit_signal("failure", "Cannot create connection to matchmaking server.")


func receive_token() -> void:
	var token := socket_client.get_peer(1).get_packet()
	print(token.hex_encode())
	emit_signal("success")



func connection_error() -> void:
	emit_signal("failure", "Matchmaking server could not be reached.")

func close_requested(code: int, _reason: String) -> void:
	if code == NO_MATCH:
		emit_signal("failure", "Not enough players to start game. Please try again.")

func connection_closed(clean_close: bool) -> void:
	if not clean_close:
		emit_signal("failure", "Connection to matchmaking server ended abruptly.")
