from flask import Flask, request

app = Flask(__name__)

@app.route('/', methods=['POST'])
def receive_message():
    message = request.data.decode('utf-8')
    print('Received message:', message)
    return 'Message received'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
