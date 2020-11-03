#!usr/bin/env ruby

require "net/http"
require'json'


header = {'Content-Type': 'text/json'}
id = '1234'

http = Net::HTTP.new('localhost', 3000)
request = Net::HTTP::Post.new('http://localhost:3000', header)
request.body = id.to_json

response = http.request(request)
if (JSON.parse(response.body) == 'true')
	puts "Registrat "

else 
	puts "No registrat "
end

