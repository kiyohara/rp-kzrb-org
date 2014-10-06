require 'rack/reverse_proxy'

use Rack::ReverseProxy do
  reverse_proxy_options preserve_host: true
  reverse_proxy '/', 'http://kanazawarb.github.io/'
end

app = proc do |env|
  [ 200, {'Content-Type' => 'text/plain'}, "Hello kanazawa.rb" ]
end

run app
