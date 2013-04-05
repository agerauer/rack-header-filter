# Rack::HeaderFilter

Remove specific HTTP headers from Rack response.

## Example Rack Usage

In your config.ru:

``` ruby
# remove 'X-Request-Id', 'X-Runtime' and X-Rack-Cache headers
use Rack::HeaderFilter, ['X-Request-Id', 'X-Runtime', 'X-Rack-Cache']
```

## Exapmle Rails Usage

In your application.rb:

``` ruby
# remove 'X-Request-Id', 'X-Runtime' and X-Rack-Cache headers
config.middleware.insert 0, 'Rack::HeaderFilter', ['X-Request-Id', 'X-Runtime', 'X-Rack-Cache']
```
