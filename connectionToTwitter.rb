require 'rubygems'
require 'oauth'
require 'json'

baseurl = "https://api.twitter.com"
path    = "/1.1/search/tweets.json"
query   = URI.encode_www_form(
    "" => "",
    "" => ,
)
address = URI("#{baseurl}#{path}?#{query}")
request = Net::HTTP::Get.new address.request_uri

consumer_key = OAuth::Consumer.new(
    "SsgCvkYeforV8SEjPUlDDOe5D",
    "re873vthzSWuVH1RYL2IIptGVm55oC5ahG3hUxxQJZChgqOh8W")
access_token = OAuth::Token.new(
    "750495694624927744-CPeAx8l1ztFw896nILhE9mMk5KxvC1X",
    "cou0PDegxFK1kRbwdcU57h5HLesS58hM6NWHhj1QnMFdQ")

request.oauth! http, consumer_key, access_token
http.start
response = http.request request

tweets=JSON.parse response.body
