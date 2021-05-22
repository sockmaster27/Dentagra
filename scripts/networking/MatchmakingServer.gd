extends Node

signal success(address, token)
signal failure(message)


export var matchmaking_address := "212.10.99.83"
export var matchmaking_port := 2093
var matchmaking_url := "wss://%s:%s" % [matchmaking_address, matchmaking_port]
var socket_client := WebSocketClient.new()

const NO_MATCH := 4000
const NO_SERVER := 4001

const token_length := 64


func _ready() -> void:
	enable_tls(false)
	socket_client.connect("data_received", self, "receive_packet")
	socket_client.connect("connection_error", self, "connection_error")
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


func receive_packet() -> void:
	var packet := socket_client.get_peer(1).get_packet()
	
	var token := packet.subarray(0, token_length + 4 - 1)
	
	var address_bytes := packet.subarray(token_length + 4, -1)
	var address := address_bytes.get_string_from_utf8()
	
	emit_signal("success", address, token)



func connection_error() -> void:
	emit_signal("failure", "Matchmaking server could not be reached.")

func close_requested(code: int, _reason: String) -> void:
	if code == NO_MATCH:
		emit_signal("failure", "Not enough players to start game. Please try again.")
	elif code == NO_SERVER:
		emit_signal("failure", "No game servers available. Please try again later.")



func cancel_connection() -> void:
	socket_client.disconnect_from_host(1000)
