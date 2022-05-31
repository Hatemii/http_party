require 'json'

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
        price: data["metrics"]["market_data"]["price_usd"].round(0)
      }
    }

    case params.try(:order_by)
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
    "https://data.messari.io/api/v1/assets?fields=id,name,metrics/market_data/price_usd"
  end
end

# {"status"=>{"elapsed"=>167, "timestamp"=>"2022-05-31T14:18:17.343314902Z"}, "data"=>[
#   {"id"=>"1e31218a-e44e-4285-820c-8282ee222035", "name"=>"Bitcoin", "metrics"=>{"market_data"=>{"price_usd"=>31560.61900546943}}}, 
#   {"id"=>"21c795f5-1bfd-40c3-858e-e9d7e820c6d0", "name"=>"Ethereum", "metrics"=>{"market_data"=>{"price_usd"=>1951.5885845007606}}}, 
#   {"id"=>"51f8ea5e-f426-4f40-939a-db7e05495374", "name"=>"Tether", "metrics"=>{"market_data"=>{"price_usd"=>0.9993396051224978}}}, 
#   {"id"=>"4515ba15-2719-4183-b0ca-b9255d55b67e", "name"=>"USD Coin", "metrics"=>{"market_data"=>{"price_usd"=>1.0001573202395808}}}, 
#   {"id"=>"7dc551ba-cfed-4437-a027-386044415e3e", "name"=>"BNB", "metrics"=>{"market_data"=>{"price_usd"=>316.7655338603185}}}, 
#   {"id"=>"362f0140-ecdd-4205-b8a0-36f0fd5d8167", "name"=>"Cardano", "metrics"=>{"market_data"=>{"price_usd"=>0.6250989662806113}}}, 
#   {"id"=>"97775be0-2608-4720-b7af-f85b24c7eb2d", "name"=>"XRP", "metrics"=>{"market_data"=>{"price_usd"=>0.4106886475733565}}}, 
#   {"id"=>"5da7bde4-61e9-4a6f-9fc3-7ed66effb198", "name"=>"Binance USD", "metrics"=>{"market_data"=>{"price_usd"=>1.000108115191146}}}, 
#   {"id"=>"b3d5d66c-26a2-404c-9325-91dc714a722b", "name"=>"Solana", "metrics"=>{"market_data"=>{"price_usd"=>45.56513657322927}}}, 
#   {"id"=>"7d793fa7-5fc6-432a-b26b-d1b10769d42e", "name"=>"Dogecoin", "metrics"=>{"market_data"=>{"price_usd"=>0.08408110718839187}}}, 
#   {"id"=>"da6a0575-ec95-4c47-855d-5fc6a3e22ada", "name"=>"Polkadot", "metrics"=>{"market_data"=>{"price_usd"=>10.141617018968601}}}, 
#   {"id"=>"81bbf507-29d5-4458-8d42-b81d7c197996", "name"=>"Wrapped Bitcoin", "metrics"=>{"market_data"=>{"price_usd"=>31552.307925914367}}}, 
#   {"id"=>"1c077d6e-99c7-491c-b24d-1d359011cd81", "name"=>"TRON", "metrics"=>{"market_data"=>{"price_usd"=>0.08034472540098989}}}, 
#   {"id"=>"2db6b38a-681a-4514-9d67-691e319597ee", "name"=>"Avalanche", "metrics"=>{"market_data"=>{"price_usd"=>26.21090655627054}}}, 
#   {"id"=>"a3b64831-4288-48bd-a3e7-eb4f77f6f740", "name"=>"Dai", "metrics"=>{"market_data"=>{"price_usd"=>0.9999061463823451}}}, 
#   {"id"=>"8c4f84a7-6484-4074-8c17-fe363a243e7f", "name"=>"Shiba Inu", "metrics"=>{"market_data"=>{"price_usd"=>1.1667507733404113e-05}}}, 
#   {"id"=>"4b474270-99ba-4a18-869d-11cd3fc0201a", "name"=>"Polygon", "metrics"=>{"market_data"=>{"price_usd"=>0.6544436851642377}}}, 
#   {"id"=>"28681c70-d3a1-4139-942e-c4bdcc49ad64", "name"=>"Unus Sed Leo", "metrics"=>{"market_data"=>{"price_usd"=>5.316288804083392}}}, 
#   {"id"=>"c7c3697d-1b9c-42bf-9664-a366634ce2b3", "name"=>"Litecoin", "metrics"=>{"market_data"=>{"price_usd"=>67.57256691983136}}}, 
#   {"id"=>"de533c50-6a57-4975-bb83-62862fb9af09", "name"=>"Cronos", "metrics"=>{"market_data"=>{"price_usd"=>0.18603127117013823}}}
# ]}