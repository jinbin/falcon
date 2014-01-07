
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
  slim :index
end

delete '/info/:id' do
  Info.get(params[:id]).destroy
  redirect '/'
end
