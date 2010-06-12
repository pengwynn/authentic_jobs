require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "authentic_jobs"
    gem.summary = %Q{Ruby wrapper for the Authenic Jobs API}
    gem.description = %Q{Ruby wrapper for the Authentic Jobs API}
    gem.email = "wynn.netherland@gmail.com"
    gem.homepage = "http://wynnnetherland.com/projects/authentic_jobs/"
    gem.authors = ["Wynn Netherland"]

    gem.add_dependency('hashie', '~> 0.2.0')
    gem.add_dependency('httparty', '~> 0.5.2')

    gem.add_development_dependency('shoulda', '>= 2.10.1')
    gem.add_development_dependency('jnunemaker-matchy', '0.4.0')
    gem.add_development_dependency('mocha', '~> 0.9.4')
    gem.add_development_dependency('fakeweb', '>= 1.2.5')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "authentic_jobs #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
