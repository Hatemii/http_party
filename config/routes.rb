Rails.application.routes.draw do
  get '/test', to: 'res#index'
  get '/test/all_names', to: 'res#all_names'
  get '/currencies', to: 'crypto_currency#get_all_currencies'
  get '/read_files', to: 'excel_file#read'
  get '/write_files', to: 'excel_file#write'
end
