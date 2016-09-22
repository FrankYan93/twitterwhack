require 'sinatra'
require 'rubygems'
require 'oauth'
require 'json'
require_relative './connectionToTwitter.rb'

get '/' do
    erb :index
end

post '/result' do
    s1 = params['search1']
    s2 = params['search2']
    @word1=s1
    @word2=s2
    count=100
    @tweets=[]
    @scores=[0,0,0]
    @searchs=["","",""]
    @searchs[0]="\"#{s1}\" -\"#{s2}\""
    @searchs[1]="\"#{s2}\" -\"#{s1}\""
    @searchs[2]="\"#{s1}\" \"#{s2}\""
    connTwitter=ConnTwitter.new
    @tweets[0],@scores[0]=connTwitter.search_tweets(@searchs[0],count)
    @tweets[1],@scores[1]=connTwitter.search_tweets(@searchs[1],count)
    @tweets[2],@scores[2]=connTwitter.search_tweets(@searchs[2],count)
    @comment=""
    if @scores[2]==0 then
      @comment="You got whacked!"
    elsif @scores[2]<6 then
      @comment="Excellent!"
    elsif @scores[2]<90 then
      @comment="Pretty Good!"
    else
      @comment="Try again!"
    end
    erb :result
end
