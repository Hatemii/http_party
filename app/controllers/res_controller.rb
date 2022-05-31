class ResController < ApplicationController

  def index
    response = HTTParty.get(url)
    render json: response.body 
  end

  def all_names
    response = HTTParty.get(url_names)
    result = JSON.parse(response.body)

    array = result["data"].map{ |data|
      {
        id: data["id"].to_i, 
        name: data["name"], 
        symbol: data["symbol"], 
        price: data["metrics"]["market_data"]["price_usd"].round(0)
      }
    }

    case params[:order_by]
    when "desc"
      render json: order_result(array)
    else
      render json: array
    end
  end

  def order_result(array)
    array.sort{|a,b| b[:price] <=> a[:price]}
  end

  def url
    "https://data.messari.io/api/v1/assets?fields=id,name,slug,symbol,metrics/market_data/price_usd"
  end

  def url_names
    "https://data.messari.io/api/v1/assets?fields=id,name,symbol,metrics/market_data/price_usd"
  end
end
