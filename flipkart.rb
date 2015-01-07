require 'rest-client'
require './settings'

class Flipkart
	attr_accessor :affiliate_id, :token, :response_type

	def initialize(affiliate_id, token, response_type='json')
		@affiliate_id = affiliate_id
		@token = token
		@response_type = response_type
	end

	def api_home			
		return sendRequest(FLIPKART_BASE_API).body
	end

	def call_url(url)
		return sendRequest(url).body
	end

	private
		def sendRequest(url)
			hearders = {'Cache-Control' => 'no-cache', 'Fk-Affiliate-Id' => @affiliate_id, 'Fk-Affiliate-Token' => @token }
			RestClient.get url, hearders
		end	
end
