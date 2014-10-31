require 'bundler'
Bundler.require

Dir.glob('./{helpers,models,controllers}/*.rb').each do |file|
  require file
  puts "required #{file}"
end


map('/parties'){ run PartiesController }
map('/sessions'){ run SessionsController }
map('/foods'){ run FoodsController }
map('/users'){ run UsersController }
map('/'){ run ApplicationController }