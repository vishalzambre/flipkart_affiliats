require 'rubygems'
require './settings'
require 'sinatra'
require 'json'
require './flipkart'
require "base64"

class Home < Sinatra::Base
	Tilt.register Tilt::ERBTemplate, 'html.erb'
	get '/' do
		flipkart = Flipkart.new(FLIPKART_AFFILIATE_ID, FLIPKART_AFFILIATE_TOKEN)
		flipkart = JSON.parse flipkart.api_home
		@lists = flipkart['apiGroups']['affiliate']['apiListings']
  	erb :'index.html'
	end

  get '/products' do
		flipkart = Flipkart.new(FLIPKART_AFFILIATE_ID, FLIPKART_AFFILIATE_TOKEN)
		url = Base64.decode64(params[:url])
		details = JSON.parse flipkart.call_url(url)
		@nextUrl = details['nextUrl']
		@products = details['productInfoList']
		puts @products
		erb :'products.html'
	end
end