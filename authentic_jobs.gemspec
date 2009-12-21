# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{authentic_jobs}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wynn Netherland"]
  s.date = %q{2009-12-20}
  s.description = %q{Ruby wrapper for the Authentic Jobs API}
  s.email = %q{wynn.netherland@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "authentic_jobs.gemspec",
     "changelog.markdown",
     "examples/search.rb",
     "lib/authentic_jobs.rb",
     "test/fixtures/categories.json",
     "test/fixtures/companies.json",
     "test/fixtures/error.json",
     "test/fixtures/locations.json",
     "test/fixtures/search.json",
     "test/fixtures/types.json",
     "test/helper.rb",
     "test/test_authentic_jobs.rb"
  ]
  s.homepage = %q{http://github.com/pengwynn/authentic_jobs}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Ruby wrapper for the Authenic Jobs API}
  s.test_files = [
    "test/helper.rb",
     "test/test_authentic_jobs.rb",
     "examples/search.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hashie>, ["~> 0.1.3"])
      s.add_runtime_dependency(%q<httparty>, ["~> 0.4.5"])
      s.add_development_dependency(%q<shoulda>, [">= 2.10.1"])
      s.add_development_dependency(%q<jnunemaker-matchy>, ["= 0.4.0"])
      s.add_development_dependency(%q<mocha>, ["= 0.9.4"])
      s.add_development_dependency(%q<fakeweb>, [">= 1.2.5"])
    else
      s.add_dependency(%q<hashie>, ["~> 0.1.3"])
      s.add_dependency(%q<httparty>, ["~> 0.4.5"])
      s.add_dependency(%q<shoulda>, [">= 2.10.1"])
      s.add_dependency(%q<jnunemaker-matchy>, ["= 0.4.0"])
      s.add_dependency(%q<mocha>, ["= 0.9.4"])
      s.add_dependency(%q<fakeweb>, [">= 1.2.5"])
    end
  else
    s.add_dependency(%q<hashie>, ["~> 0.1.3"])
    s.add_dependency(%q<httparty>, ["~> 0.4.5"])
    s.add_dependency(%q<shoulda>, [">= 2.10.1"])
    s.add_dependency(%q<jnunemaker-matchy>, ["= 0.4.0"])
    s.add_dependency(%q<mocha>, ["= 0.9.4"])
    s.add_dependency(%q<fakeweb>, [">= 1.2.5"])
  end
end

