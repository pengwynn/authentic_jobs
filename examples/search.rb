require 'rubygems'
require 'authentic_jobs'

client = AuthenticJobs.new('OU812') # <-- Get your key at http://www.authenticjobs.com/api/

jobs = client.search(:location => 'austintxus', :keywords => 'ruby')