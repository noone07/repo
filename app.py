from flask import Flask, render_template, jsonify
import random
import datetime

app = Flask(__name__)

def generate_lotto():
    return sorted(random.sample(range(1, 53), 6))

def generate_powerball():
    return {
        "numbers": sorted(random.sample(range(1, 51), 5)),
        "powerball": random.randint(1, 20)
    }

def generate_daily_lotto():
    return sorted(random.sample(range(1, 37), 5))

def generate_lotto_plus():
    return sorted(random.sample(range(1, 53), 6))

def forecast_numbers(lotto_type):
    if lotto_type == 'lotto':
        return generate_lotto()
    elif lotto_type == 'powerball':
        return generate_powerball()
    elif lotto_type == 'daily_lotto':
        return generate_daily_lotto()
    elif lotto_type == 'lotto_plus':
        return generate_lotto_plus()
    else:
        return None

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/generate/<lotto_type>')
def generate_lotto_numbers(lotto_type):
    print(f"Received request for {lotto_type}")  # Log request

    if lotto_type not in ['lotto', 'powerball', 'daily_lotto', 'lotto_plus']:
        return jsonify({"error": "Invalid lotto type"}), 400

    numbers = forecast_numbers(lotto_type)
    if numbers is None:
        return jsonify({"error": "Error generating numbers"}), 500

    today = datetime.date.today()
    tomorrow = today + datetime.timedelta(days=1)

    return jsonify({
        "lotto_type": lotto_type.capitalize(),
        "projected_date": tomorrow.strftime('%Y-%m-%d'),
        "numbers": numbers
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

