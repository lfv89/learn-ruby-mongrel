require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'mongrel', '1.2.0.pre2'
end

class BasicHttpHandler < Mongrel::HttpHandler
  def process(request, response)
    response.start(200) do |head, output|
      head["Content-Type"] = "text/plain"
      output.write("Hello, World!")
    end
  end
end

 mongrel = Mongrel::HttpServer.new("0.0.0.0", "3000")
 mongrel.register("/", BasicHttpHandler.new).run.join
