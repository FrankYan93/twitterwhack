require File.dirname(__FILE__) + '/../connectionToTwitter.rb'
require 'rspec'
require 'rack/test'
require 'oauth'
require 'json'

describe 'test class ConnTwitter' do
  include Rack::Test::Methods

  def app
      Sinatra::Application
  end

  it 'should return a hash and a integer' do
    conn=ConnTwitter.new
    s="fantasy"
    count=100
    hash_return,integer_return=conn.search_tweets(s,count)
    hash_return.is_a?(Hash).should == true
    integer_return.is_a?(Integer).should == true
  end

end
