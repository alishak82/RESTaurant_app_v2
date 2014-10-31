require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'
require 'pg'

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'restaurant'
})

# conn = PG::Connection.open()
# conn.exec('DROP DATABASE IF EXISTS restaurant;')
# conn.exec('CREATE DATABASE restaurant;')
# conn.close

# conn = PG::Connection.open(dbname: 'restaurant')
# conn.exec('CREATE TABLE foods (id SERIAL PRIMARY KEY, name VARCHAR(100), cuisine VARCHAR(100), price INTEGER, description VARCHAR(255), allergens VARCHAR(100));')
# conn.exec('CREATE TABLE parties (id SERIAL PRIMARY KEY, name VARCHAR(50), size INTEGER, table_number INTEGER, has_paid boolean);')
# conn.exec('CREATE TABLE orders (id SERIAL PRIMARY KEY, party_id INTEGER, food_id INTEGER);')
# conn.close

namespace :db do
  desc "create restaurant database"
  task :create_db do
    conn = PG::Connection.open()
    conn.exec('CREATE DATABASE restaurant;')
    conn.close
  end

  desc "drop restaurant database"
  task :drop_db do
    conn = PG::Connection.open()
    conn.exec('DROP DATABASE restaurant;')
    conn.close
  end
end