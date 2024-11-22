import requests
import csv
import os
import json
import time

CONFIG_PATH = 'config/alpha_vantage_config.json'


def load_config():
    """Load API configuration from a JSON file."""
    with open(CONFIG_PATH, 'r') as config_file:
        config = json.load(config_file)
    return config


config = load_config()
API_URL = config['base_url']
API_KEY = config['api_key']

# List of stock symbols to fetch data for
stock_symbols = ['AAPL', 'GOOG', 'MSFT', 'AMZN', 'TSLA', 'NFLX', 'NVDA']


def fetch_data(symbol):
    """Fetch daily time series data for a given stock symbol."""
    params = {
        'function': 'TIME_SERIES_DAILY',  # Changed to TIME_SERIES_DAILY
        'symbol': symbol,
        'apikey': API_KEY
    }

    try:
        response = requests.get(API_URL, params=params)
        response.raise_for_status()
        data = response.json()

        # Debugging: Print the full API response if no data is found
        if "Time Series (Daily)" not in data:
            print(f"[Debug] Full response for {symbol}: {data}")

        # Check if data is available
        if "Time Series (Daily)" in data:
            return data["Time Series (Daily)"]
        else:
            print(f"[Error] No data found for symbol: {symbol}")
            return None

    except requests.exceptions.RequestException as e:
        print(f"[Error] Failed to fetch data for {symbol}: {e}")
        return None


def fetch_and_save_data():
    """Fetch data for multiple stocks and save it to a CSV file."""
    output_dir = 'data/raw'
    os.makedirs(output_dir, exist_ok=True)
    csv_file_path = os.path.join(output_dir, 'raw_financial_data.csv')

    with open(csv_file_path, 'w', newline='') as csvfile:
        fieldnames = ['Symbol', 'Date', 'Open',
                      'High', 'Low', 'Close', 'Volume']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()

        for symbol in stock_symbols:
            print(f"Fetching data for {symbol}...")
            data = fetch_data(symbol)
            if data:
                for date, stock_data in data.items():
                    writer.writerow({
                        'Symbol': symbol,
                        'Date': date,
                        'Open': stock_data.get('1. open'),
                        'High': stock_data.get('2. high'),
                        'Low': stock_data.get('3. low'),
                        'Close': stock_data.get('4. close'),
                        'Volume': stock_data.get('5. volume')
                    })
            # Add a short delay to avoid hitting rate limits
            time.sleep(15)

    print(f"Data saved to {csv_file_path}")


if __name__ == '__main__':
    fetch_and_save_data()
