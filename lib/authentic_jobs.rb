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
  
  def companies!
    mashup(self.class.get("/", :query => method_params('aj.jobs.getCompanies'))).companies.company
  end
  
  def companies
    @companies ||= companies!
  end
  
  def locations!
    mashup(self.class.get("/", :query => method_params('aj.jobs.getLocations'))).locations.location
  end
  
  def locations
    @locations ||= locations!
  end
  
  
  # category: The id of a job category to limit to. See aj.categories.getList
  # type: The id of a job type to limit to. See aj.types.getList
  # sort: Accepted values are: date-posted-desc (the default) and date-posted-asc
  # company: Free-text matching against company names. Suggested values are the ids from aj.jobs.getCompanies
  # location: Free-text matching against company location names. Suggested values are the ids from aj.jobs.getLocation
  # keywords: Keywords to look for in the title or description of the job posting. Separate multiple keywords with commas. Multiple keywords will be treated as an OR
  # page: The page of listings to return. Defaults to 1.
  # perpage: The number of listings per page. The default value is 10. The maximum value is 100.
  def search(options={})
    mashup(self.class.get("/", :query => method_params('aj.jobs.search', options))).listings.listing
  end
  
  def types!
    mashup(self.class.get("/", :query => method_params('aj.types.getList'))).types['type']
  end
  
  def types
    @types ||= types!
  end
  
  def categories!
    mashup(self.class.get("/", :query => method_params('aj.categories.getList'))).categories.category
  end
  
  def categories
    @categories ||= categories!
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