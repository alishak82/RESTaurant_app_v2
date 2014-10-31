class FoodsController < ApplicationController

get '/' do
  @foods = Food.all
  erb :'foods/index'
end

get '/new' do
  erb :'foods/new'
end

get '/:id' do
  @food = Food.find(params[:id])
  @foods_show_parties = @food.parties
  erb :'foods/show'
end

post '/' do
  food = Food.create(params[:food])
  if food.valid?
    redirect '/foods'
  else @errors = food.errors.full_messages
  erb :'foods/new'
  end
end

get '/:id/edit' do
  @food = Food.find(params[:id])
  erb :'foods/edit'
end

patch '/:id' do
  food = Food.find(params[:id])
  food.update(params[:food])
  redirect "/foods/#{food.id}"
end

delete '/:id' do
  Food.delete(params[:id])
  redirect '/foods'
end

end