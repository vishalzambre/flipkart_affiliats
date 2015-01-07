require 'rest-client'
require './settings'

class Flipkart
	attr_accessor :affiliate_id, :token, :response_type, :url

	def initialize(affiliate_id, token, url, response_type='json')
		@affiliate_id = affiliate_id
		@token = token
		@url = url
		@response_type = response_type
	end

	def api_home			
		return sendRequest.body
	end

	def call_url
		return sendRequest.body
	end

	private
		def sendRequest
			hearders = {'Cache-Control' => 'no-cache', 'Fk-Affiliate-Id' => @affiliate_id, 'Fk-Affiliate-Token' => @token }
			RestClient.get @url, hearders
		end	
end
