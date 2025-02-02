import psycopg2
from flask import Flask, request, jsonify, render_template
from datetime import datetime, date
from psycopg2.extras import RealDictCursor
from flask_cors import CORS

# Database connection settings
DB_HOST = 'localhost'
DB_NAME = 'mydb'
DB_USER = 'postgres'
DB_PASSWORD = '310803'

# Initialize the Flask app
app = Flask(__name__)
CORS(app)


@app.route('/')
def home():
    
    return render_template('index.html')  # Loads the webpage instead of text
    return "Welcome to Expiry Scanner API"
def get_db_connection():
    """Establish a connection to the PostgreSQL database."""
    return psycopg2.connect(
        host=DB_HOST,
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )

def calculate_expiry(expiry_date_str):
    """Ensure expiry date is correctly formatted before processing."""
    if isinstance(expiry_date_str, date):  # Now correctly checks for 'date' type
        expiry_date_str = expiry_date_str.strftime('%Y-%m-%d')  # Convert date to string

    expiry_date = datetime.strptime(expiry_date_str, '%Y-%m-%d')  # Now safely convert
    now = datetime.now()
    time_remaining = expiry_date - now

    return {
        "days": time_remaining.days,
        "hours": time_remaining.seconds // 3600,
        "minutes": (time_remaining.seconds % 3600) // 60
    }


@app.route('/add_product', methods=['POST'])
def add_product():
    data = request.get_json()
    name = data.get('name')
    barcode = data.get('barcode')
    expiry_date = data.get('expiry_date')

    if not all([name, barcode, expiry_date]):
        return jsonify({"error": "Missing required fields"}), 400

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute("SELECT id FROM products WHERE barcode = %s;", (barcode,))
    if cursor.fetchone():
        cursor.close()
        conn.close()
        return jsonify({"error": "Product with this barcode already exists"}), 400

    cursor.execute(
        "INSERT INTO products (name, barcode, expiry_date) VALUES (%s, %s, %s) RETURNING id;",
        (name, barcode, expiry_date)
    )
    new_product_id = cursor.fetchone()[0]
    conn.commit()

    cursor.close()
    conn.close()

    return jsonify({
        "id": new_product_id,
        "name": name,
        "barcode": barcode,
        "expiry_date": expiry_date
    }), 201

@app.route('/products/expiring_soon', methods=['GET'])
def get_expiring_soon():
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=RealDictCursor)

    cursor.execute("SELECT * FROM products;")
    products = cursor.fetchall()

    expiring_soon = [
        {"id": p["id"], "name": p["name"], "expiry_date": p["expiry_date"], "time_till_expiry": calculate_expiry(p["expiry_date"])}
        for p in products
    ]

    # Sort by expiry date in ascending order (earliest expiry first)
    expiring_soon.sort(key=lambda x: x["expiry_date"])

    cursor.close()
    conn.close()
    return jsonify(expiring_soon)

@app.route('/scan/<barcode>', methods=['GET'])
def scan_product(barcode):
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=RealDictCursor)

    cursor.execute("SELECT * FROM products WHERE barcode = %s;", (barcode,))
    product = cursor.fetchone()

    cursor.close()
    conn.close()

    if product:
        return jsonify({
            "id": product["id"],
            "name": product["name"],
            "expiry_date": product["expiry_date"],
            "time_till_expiry": calculate_expiry(product["expiry_date"])
        })
    return jsonify({"error": "Product not found"}), 404

if __name__ == "__main__":
    app.run(debug=True)
