from http.server import BaseHTTPRequestHandler, HTTPServer


class ServiceBHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/healthz":
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"ok")
            return

        if self.path != "/api/sb":
            self.send_error(404, "Not Found")
            return

        body = b"Hello from Service B!"
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, format, *args):
        print(f"Service B: {format % args}")


if __name__ == "__main__":
    HTTPServer(("0.0.0.0", 8080), ServiceBHandler).serve_forever()
