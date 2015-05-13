module Toying
  class App
    def initialize
    end

    def self.instance
      @instance ||= Rack::Builder.new do
        use Rack::Cors do
          allow do
            origins '*'
            resource '*', headers: :any, methods: :get
          end
        end
        run Toying::App.new
      end.to_app
    end

    def call(env)
      #api
      response = Toying::API.call(env)
      puts response
      response
    end

  end
end
