extends Node

signal success
signal failure(message)


export var matchmaking_url := "wss://localhost:2093"
var socket_client := WebSocketClient.new()

const NO_MATCH := 4000



func _process(_delta: float) -> void:
	# 'poll' sender ikke noget over netværket
	socket_client.poll()



func enable_tls(verify_certificate: bool) -> void:
	socket_client.set_verify_ssl_enabled(verify_certificate)
	var certificate := load("res://TLS/tls_certificate.crt")
	socket_client.set_trusted_ssl_certificate(certificate)


func request_token() -> void:
	enable_tls(false)
	
	socket_client.connect("data_received", self, "receive_token")
	socket_client.connect("connection_error", self, "connection_error")
	socket_client.connect("connection_closed", self, "connection_closed")
	socket_client.connect("server_close_request", self, "close_requested")
	
	var error := socket_client.connect_to_url(matchmaking_url)
	if error != OK:
		print("No internet connection.")
		emit_signal("failure")


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
