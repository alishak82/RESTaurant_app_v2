class PartiesController < ApplicationController

get '/' do
  @parties = Party.all
  erb :'parties/index'
end

get '/new' do
  erb :'parties/new'
end

get '/:id' do
  @foods = Food.all
  @party = Party.find(params[:id])
  @orders = @party.orders
  erb :'parties/show'
end

post '/' do
  party = Party.create(params[:party])
  redirect '/parties'
end

get '/:id/edit' do
  @party = Party.find(params[:id])
  erb :'parties/edit'
end

patch '/:id' do
  party = Party.find(params[:id])
  party.update(params[:party])
  if party.has_paid == true
    @error_has_paid = "This party has already paid and can no longer order additional food items."
    erb :'parties/show'
  else
  redirect "/parties/#{party.id}"
end
end

delete '/:id' do
  Party.destroy(params[:id])
  redirect '/parties'
end

post '/:id/orders' do
  food = Food.find(params[:food_id])
  @party = Party.find(params[:id])
  @foods = Food.all
  @orders = @party.orders
  order = Order.create({food: food, party: @party})
  if order.valid? == false
    begin
      raise "This party has already paid"
    rescue
      @errors = order.errors.full_messages
    end
    erb :'parties/show'
  else
    redirect "/parties/#{@party.id}"
  end
end

delete '/:party_id/orders/:id' do
  Order.destroy(params[:id])
  redirect "/parties/#{params['party_id']}"
end

get '/:id/receipt' do
    @party = Party.find(params[:id])
  @food = Food.find(params[:id])
  @party.foods

  erb :'parties/receipt'
end

patch '/:id/checkout' do
  party = Party.find(params[:id])
  party.has_paid = true
  party.save
  redirect "/parties/#{party.id}"
end

end