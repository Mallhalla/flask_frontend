import os
from flask import Flask, render_template, request
from threading import Thread

app = Flask('')

# Sample product catalog
products = [
    {"id": 1, "name": "Product A", "price": 10.99, "description": "A great product A"},
    {"id": 2, "name": "Product B", "price": 15.49, "description": "A great product B"},
    {"id": 3, "name": "Product C", "price": 8.99, "description": "A great product C"},
]

@app.route('/')
def home():
    return render_template('shop.html', products=products)

@app.route('/cart', methods=['POST'])
def cart():
    product_id = request.form.get('product_id')
    selected_product = next((p for p in products if str(p["id"]) == product_id), None)
    if selected_product:
        return f"You added {selected_product['name']} to the cart!"
    return "Product not found", 404

def run():
    app.run(host='0.0.0.0', port=3000)

def keep_alive():
    t = Thread(target=run)
    t.start()

