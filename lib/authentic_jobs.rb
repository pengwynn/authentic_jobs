require 'hashie'
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
  
  # API key for all requests
  #
  # @see http://www.authenticjobs.com/api/ Request your API key here
  # @param [String] api_key your API key
  # @return [String] API key
  attr_accessor :api_key
  
  def initialize(api_key)
    self.api_key = api_key
  end
  
  # List of companies that are currently advertising positions, explicitly refreshing cache
  #
  # @return [Array<Hashie::Mash>] list of companies
  def companies!
    mashup(self.class.get("/", :query => method_params('aj.jobs.getCompanies'))).companies.company
  end
  
  # List of companies that are currently advertising positions
  #
  # @return [Array<Hashie::Mash>] list of companies
  def companies
    @companies ||= companies!
  end
  
  
  # List locations for companies that are currently advertising positions, explicitly refreshing cache
  #
  # @return [Array<Hashie::Mash>] list of locations
  def locations!
    mashup(self.class.get("/", :query => method_params('aj.jobs.getLocations'))).locations.location
  end
  
  # List locations for companies that are currently advertising positions
  #
  # @return [Array<Hashie::Mash>] list of locations
  def locations
    @locations ||= locations!
  end
  
  # List current positions
  # 
  # @option options [String] :category The id of a job category to limit to. See aj.categories.getList
  # @option options [String] :type The id of a job type to limit to. See aj.types.getList
  # @option options [String] :sort ('date-posted-desc') Accepted values are 'date-posted-desc' and 'date-posted-asc'
  # @option options [String] :company Free-text matching against company names. Suggested values are the ids from aj.jobs.getCompanies
  # @option options [String] :location Free-text matching against company location names. Suggested values are the ids from aj.jobs.getLocation
  # @option options [String] :keywords Keywords to look for in the title or description of the job posting. Separate multiple keywords with commas. Multiple keywords will be treated as an OR
  # @option options [Integer] :page (1) The page of listings to return. Defaults to 1.
  # @option options [Integer] :perpage (1) The number of listings per page. The default value is 10. The maximum value is 100.
  def search(options={})
    mashup(self.class.get("/", :query => method_params('aj.jobs.search', options))).listings.listing
  end
  
  # List supported job types, explicitly refreshing cache
  #
  # @return [Array<Hashie::Mash>] list of types
  def types!
    mashup(self.class.get("/", :query => method_params('aj.types.getList'))).types['type']
  end
  
  # List supported job types
  #
  # @return [Array<Hashie::Mash>] list of types
  def types
    @types ||= types!
  end
  
  # List supported job categories, explicitly refreshing cache
  #
  # @return [Array<Hashie::Mash>] list of categories
  def categories!
    mashup(self.class.get("/", :query => method_params('aj.categories.getList'))).categories.category
  end
  
  # List supported job categories
  #
  # @return [Array<Hashie::Mash>] list of categories
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