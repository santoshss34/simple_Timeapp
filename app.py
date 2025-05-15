from flask import Flask, request, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route("/", methods=["GET"])
def index():
    return jsonify({
        "timestamp": datetime.utcnow().isoformat(),
        "ip": request.remote_addr
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
