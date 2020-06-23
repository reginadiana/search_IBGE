require 'rest-client'
require 'json'
 
url = 'https://viacep.com.br/ws'
id_state = 'SP'
state = 'sao%20paulo'

def read_input
  gets.chomp
end

puts "Digite um logradouro"
logradouro = read_input
 
resp = RestClient.get "#{url}/#{id_state}/#{state}/#{logradouro}/json"

puts resp
