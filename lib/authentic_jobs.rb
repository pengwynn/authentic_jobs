require 'rubygems'

gem 'hashie', '~> 0.1.3'
require 'hashie'

gem 'httparty', '~> 0.4.5'
require 'httparty'

directory = File.expand_path(File.dirname(__FILE__))

Hash.send :include, Hashie::HashExtensions

class AuthenticJobsError < StandardError
  attr_reader :data

  def initialize(data)
    @data = data
    super
  end
end

class AuthenticJobs
  include HTTParty
  base_uri 'www.authenticjobs.com/api'
  format :json
  
  attr_accessor :api_key
  
  def initialize(api_key)
    self.api_key = api_key
  end
  
  def companies
    mashup(self.class.get("/", :query => method_params('aj.jobs.getCompanies'))).companies.company
  end
  
  def locations
    mashup(self.class.get("/", :query => method_params('aj.jobs.getLocations'))).locations.location
  end
  
  def search(options={})
    mashup(self.class.get("/", :query => method_params('aj.jobs.search', options))).listings.listing
  end
  
  def types
    mashup(self.class.get("/", :query => method_params('aj.types.getList'))).types['type']
  end
  
  def categories
    mashup(self.class.get("/", :query => method_params('aj.categories.getList'))).categories.category
  end

  
  private
    def mashup(response)
      response = Hashie::Mash.new(response)
      raise AuthenticJobsError.new("Code #{response.code} -- #{response.desc}") unless response.stat == 'ok'
      response
    end
    
    def method_params(method, params={})
      {:method => method, :api_key => self.api_key, :format => 'json'}.merge(params)
    end
  
end