require 'bundler'
Bundler.require

set :root, File.expand_path(".")
set :views, settings.root + "/views"

Dir.glob "./main.rb" do |f|
  require f
end
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
