class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get "/bakeries/:id" do 
  bakery =Bakery.find(params[:id])
  bakery.to_json(include: :baked_goods)
  end

  get "/baked_goods/by_price" do
    BakedGood.by_price.to_json
  end

  
  get "/baked_goods/most_expensive" do
    BakedGood.by_price.first.to_json
  end
end
