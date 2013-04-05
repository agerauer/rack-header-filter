# encoding: utf-8
require 'spec_helper'
require 'rack/header_filter'

describe Rack::HeaderFilter do
  it "should filter headers" do
    in_headers = {
      'Content-Type' => 'text/html',
      'Cache-Control' => 'nocache',
      'Server' => 'rack',
      'X-Powered-By' => 'something'
    }
    app = Proc.new {|env| [200, in_headers, ['Hello World']] }
    header_filter = Rack::HeaderFilter.new(app, ['Server', 'X-Powered-By'])
    
    status, out_headers, content = header_filter.call({})
    
    status.should eq 200
    out_headers.count.should eq 2
    out_headers['Content-Type'].should eq 'text/html'
    out_headers['Cache-Control'].should eq 'nocache'
    out_headers['Server'].should be_nil
    out_headers['X-Powered-By'].should be_nil
  end
end