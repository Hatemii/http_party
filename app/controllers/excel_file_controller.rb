class ExcelFileController < ApplicationController

  def write
    CSV.open(path, "w", encoding: 'UTF-8') do |csv|
      currencies.each do |currency|
        csv << [{
          id: currency.id,
          name: currency.name,
          symbol: currency.symbol,
          price: currency.price.round(0),
          created_at: currency.created_at.to_date
        }]
      end
    end

    render json: ":p"
  end

  def read
    arr = []
    CSV.foreach(path, encoding: 'UTF-8') do |row|
      arr << row
    end
    
    render json: arr.flatten
  end

  def path
    "/home/user/Desktop/http_party/app/controllers/sample.csv"
  end

  def currencies
    CryptoCurrency.all
  end
end
