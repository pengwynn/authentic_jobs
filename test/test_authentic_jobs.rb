require 'helper'

require 'helper'

class TestAuthenticJobs < Test::Unit::TestCase
  
  context "when authenticated" do
    setup do
      @client = AuthenticJobs.new('OU812')
    end
    
    should "return a list of companies" do
      stub_get("http://www.authenticjobs.com/api/?api_key=OU812&method=aj.jobs.getCompanies&format=json", "companies.json")
      companies = @client.companies
      companies.first.name.should == 'Adura Technologies, Inc.'
      companies.first.location.state.should == 'CA'
    end
    
    should "return a list of locations" do
      stub_get("http://www.authenticjobs.com/api/?api_key=OU812&method=aj.jobs.getLocations&format=json", "locations.json")
      locations = @client.locations
      locations.first.name.should == 'Anywhere in USA'
      locations.first.id.should == 'anywhereinusa'
    end
    
    should "return a listings via search" do
      stub_get("http://www.authenticjobs.com/api/?api_key=OU812&method=aj.jobs.search&format=json", "search.json")
      listings = @client.search
      listings.first.title.should == 'Interactive Art Designer'
      listings.first.company.name.should == 'Bazaarvoice'
    end
    
    should "return a list of job types" do
      stub_get("http://www.authenticjobs.com/api/?api_key=OU812&method=aj.types.getList&format=json", "types.json")
      types = @client.types
      types.last.name.should == 'Freelance'
    end
    
    should "return a list of job categories" do
      stub_get("http://www.authenticjobs.com/api/?api_key=OU812&method=aj.categories.getList&format=json", "categories.json")
      categories = @client.categories
      categories.first.name.should == 'Design'
    end
    
    should "handle error codes" do
      stub_get("http://www.authenticjobs.com/api/?api_key=OU812&method=aj.categories.getList&format=json", "error.json")
      lambda {@client.categories}.should raise_error(AuthenticJobsError)
    end
    
  end
  
  
end