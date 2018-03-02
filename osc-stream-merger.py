from pythonosc import dispatcher
from pythonosc import osc_server
from pythonosc import udp_client

input_host = "localhost"
input_port = 6448

output_host = "localhost"
output_port = 9001

client = udp_client.SimpleUDPClient(output_host, output_port)

most_recent_a = None
most_recent_b = None

def send_a_and_b():
	global most_recent_a, most_recent_b
	if (most_recent_a is None) or (most_recent_b is None):
		return
	else:
		combined = most_recent_a + most_recent_b
		print("Sending /AB: " + str(combined))
		client.send_message("/AB", combined[0], combined[1], combined[2], combined[3], combined[4], combined[5])

def got_a(addr, arg1, arg2, arg3):
	try:
		global most_recent_a
		most_recent_a = [arg1, arg2, arg3]
		print("Received /A: " + str(arg1) + " " + str(arg2) + " " + str(arg3))
	except:
		print(addr)

def got_b(addr, arg1, arg2, arg3):
	try:
		global most_recent_b
		most_recent_b = [arg1, arg2, arg3]
		print("Received /B: " + str(arg1) + " " + str(arg2) + " " + str(arg3))
	except:
		print(addr)

dispatcher = dispatcher.Dispatcher()
dispatcher.map("/wek/inputs/a", got_a)
dispatcher.map("/wek/inputs/b", got_b)
# dispatcher.map("/AB", send_a_and_b)

server = osc_server.ThreadingOSCUDPServer((input_host, input_port), dispatcher)
print("Serving on {}".format(server.server_address))
# while True:
# 	send_a_and_b()
server.serve_forever()
