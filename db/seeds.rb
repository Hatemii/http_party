# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

crypto_data = [
    {
        "name": "Bitcoin",
        "symbol": "BTC",
        "price": 31644
    },
    {
        "name": "Ethereum",
        "symbol": "ETH",
        "price": 1938
    },
    {
        "name": "Tether",
        "symbol": "USDT",
        "price": 1
    },
    {
        "name": "USD Coin",
        "symbol": "USDC",
        "price": 1
    },
    {
        "name": "BNB",
        "symbol": "BNB",
        "price": 319
    },
    {
        "name": "Cardano",
        "symbol": "ADA",
        "price": 1
    },
    {
        "name": "XRP",
        "symbol": "XRP",
        "price": 0
    },
    {
        "name": "Binance USD",
        "symbol": "BUSD",
        "price": 1
    },
    {
        "name": "Solana",
        "symbol": "SOL",
        "price": 46
    },
    {
        "name": "Dogecoin",
        "symbol": "DOGE",
        "price": 0
    },
    {
        "name": "Polkadot",
        "symbol": "DOT",
        "price": 10
    },
    {
        "name": "Wrapped Bitcoin",
        "symbol": "WBTC",
        "price": 31663
    },
    {
        "name": "TRON",
        "symbol": "TRX",
        "price": 0
    },
    {
        "name": "Avalanche",
        "symbol": "AVAX",
        "price": 26
    },
    {
        "name": "Dai",
        "symbol": "DAI",
        "price": 1
    },
    {
        "name": "Shiba Inu",
        "symbol": "SHIB",
        "price": 0
    },
    {
        "name": "Polygon",
        "symbol": "MATIC",
        "price": 1
    },
    {
        "name": "Unus Sed Leo",
        "symbol": "LEO",
        "price": 5
    },
    {
        "name": "Litecoin",
        "symbol": "LTC",
        "price": 68
    },
    {
        "name": "Cronos",
        "symbol": "CRO",
        "price": 0
    }
]

CryptoCurrency.insert_all!(crypto_data)