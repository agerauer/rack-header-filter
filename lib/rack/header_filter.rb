module Rack
  class HeaderFilter
    VERSION = '0.1'
  
    def initialize(app, filters = [])
      @app = app
      @filters = filters
    end
  
    def call(env)
      status, headers, body = @app.call(env)
    
      filtered_headers = headers.dup
      @filters.each do |filter|
        filtered_headers.delete(filter)
      end
    
      [status, filtered_headers, body]
    end
  end
end