module Toying
  class Shares < Grape::API
    format :json

    # sets /shares as endpoint
    resource :shares do
      desc "First get attempt"
      # GET to /shares, returns object for now
      get do
        {:data => "derp"}
      end
    end

  end
end

