pip3() {
	if [ -n "$VIRTUAL_ENV" ]; then
		command pip3 "$@"
	else
		confirmation=; vared -p "%B%F{yellow}Do you want to execute pip outside venv (y/n)? %f%b" confirmation
		if [ "$confirmation" = "y" ]; then
			command pip3 "$@"
		else
			echo "Aborted."
		fi
	fi
}

vact() {
	if [ -d venv ]; then
		. venv/bin/activate
	else
		virtualenv venv && . venv/bin/activate
	fi
}

pyserve() {
	python3 -c "
from http.server import BaseHTTPRequestHandler, HTTPServer

class Handler(BaseHTTPRequestHandler):
	def do_GET(self):
		self.log_request_details()
		self.send_response(200)
		self.end_headers()

	def do_POST(self):
		self.log_request_details()
		content_length = int(self.headers.get('Content-Length', 0))
		body = self.rfile.read(content_length).decode()
		print(f'Body: {body}')
		self.send_response(200)
		self.end_headers()

	def log_request_details(self):
		print(f'URL: {self.path}\nHeaders:\n{self.headers}')

HTTPServer(('0.0.0.0', 8000), Handler).serve_forever()
	"
}
