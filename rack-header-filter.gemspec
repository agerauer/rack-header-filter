# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack/header_filter"

version = Rack::HeaderFilter::VERSION

Gem::Specification.new do |s|
  s.name        = 'rack-header-filter'
  s.version     = version
  s.summary     = "Middleware to filter out headers in a response"

  s.require_paths = ["lib"]
  s.files = ["README.md"]
  %w(lib).each do |dir|
    s.files = s.files + Dir.glob( "#{dir}/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  end

  s.authors = ["Andreas Gerauer"]
  s.email   = %q{andi@tickaroo.com}
  s.homepage = "http://www.tickaroo.com"
  
  s.platform = Gem::Platform::RUBY
end
