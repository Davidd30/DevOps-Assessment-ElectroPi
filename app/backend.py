from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return "Hello, World!"

@app.route("/health")
def health():
    return "Service is healthy!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)