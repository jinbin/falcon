require 'data_mapper'
require 'sinatra'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Info
  include DataMapper::Resource
  property :id,           Serial
  property :type,         String, :required => true
  property :detail,       String
  property :createtime,   DateTime
end

DataMapper.finalize

get '/' do 
  @infos = Info.all.sort_by {|i| -i.id}
  @time = Time.new
  slim :index
end

delete '/info/:id' do
  Info.get(params[:id]).destroy
  redirect '/'
end

post '/info/new' do 
  Info.create type: params[:type], detail: params[:detail], createtime: Time.new if params[:type]
end

get '/styles.css' do 
  scss :styles
end
