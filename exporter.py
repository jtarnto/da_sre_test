from prometheus_client import start_http_server, Gauge
import requests
import time

# Function to fetch Bitcoin price from Coindesk API
def get_bitcoin_price():
    url = 'https://api.coindesk.com/v1/bpi/currentprice/BTC.json'
    response = requests.get(url)
    data = response.json()
    return float(data['bpi']['USD']['rate'].replace(',', ''))

# Create a Prometheus Gauge to store Bitcoin price
bitcoin_price_gauge = Gauge('bitcoin_price', 'Current price of Bitcoin in USD')

# Function to update Bitcoin price gauge
def update_bitcoin_price():
    bitcoin_price = get_bitcoin_price()
    bitcoin_price_gauge.set(bitcoin_price)

if __name__ == '__main__':
    # Start an HTTP server to expose metrics
    # path http://localhost:8000/metrics
    start_http_server(8000)
    
    # Update Bitcoin price every 600 seconds
    while True:
        update_bitcoin_price()
        time.sleep(600)

