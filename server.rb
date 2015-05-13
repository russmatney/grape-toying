module App
  class API < Grape::API
    prefix :api
    format :json

    resource :shares do
      desc "First get attempt"
      get do
        {:data => "derp"}
      end
    end

  end
end

