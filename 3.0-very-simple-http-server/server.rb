require 'socket' # A library built into Ruby - provides the TCPServer class

host = 'localhost'
port = 8080

$stdout.sync = 1  # Line-buffer output to STDOUT.
listener = TCPServer.open(host, port)
loop do
  socket = listener.accept  # Wait til a client connects, then open a socket.
  puts "FROM THE CLIENT: "
  txt = socket.recv(10000)
  puts txt
  socket.puts("Hello, world")
  puts "SERVER: Sent 'Hello, world' message to client"
  socket.close
end
puts "SERVER: now I'm exiting"