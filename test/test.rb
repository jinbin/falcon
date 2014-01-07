require 'faraday'

url = "http://10.232.39.126:3000"
conn = Faraday.new(:url => url)

respond = conn.post '/info/new', {:type => 'cmd', :detail => 'cmd execute error'} 

puts respond.body
