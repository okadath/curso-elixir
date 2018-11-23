import SimpleHTTPServer
import SocketServer

PORT = 8000

Handler = SimpleHTTPServer.SimpleHTTPRequestHandler

httpd = SocketServer.TCPServer(("", PORT), Handler)

print "serving at port", PORT
httpd.serve_forever()
#python -m SimpleHTTPServer 8000
#agregamos la variable y con la ventana abierta lo abrimos en otra ventana
#luego lo corremos y copiamos la direccion en la que se despliega
#aqui es http://node18.codenvy.io:56841/ no se si cambie, sospecho que si
