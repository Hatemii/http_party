class CryptoCurrencyController < ApplicationController

  def get_all_currencies
    render json: custom_hash_response
  end

  private
  
    def custom_hash_response
      return render json: "data: []" unless currencies.any?

      currencies.map{ |currency|
        {
          id: currency.id,
          name: currency.name,
          symbol: currency.symbol,
          price: currency.price.round(0),
          created_at: currency.created_at.to_date
        }
      }
    end

    def currencies
      CryptoCurrency.all
    end
end
