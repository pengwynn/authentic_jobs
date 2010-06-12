# Authentic Jobs

Find your next gig from the console! This is a Ruby wrapper for the [AuthenticJobs.com API](http://www.authenticjobs.com/api/documentation/).

## Installation

    sudo gem install authentic_jobs
    
## Usage

Create a client with your API key

    client = AuthenticJobs.new('OU812') # <-- Get your key at http://www.authenticjobs.com/api/

Search for jobs

    jobs = client.search(:location => 'austintxus', :keywords => 'ruby')
    
List all companies with current listings

    companies = client.companies
    
List all job types

    types = client.types
    
List all job categories

    categories = client.categories
    

The categories, types, and locations methods are all cached after the first call. To refresh, simply add a bang:

    client.categories!
    client.types!
    client.locations!
    
All calls return a [Hashie::Mash](http://github.com/intridea/hashie) and support dot-notation.

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2009 [Wynn Netherland](http://wynnnetherland.com). See LICENSE for details.
