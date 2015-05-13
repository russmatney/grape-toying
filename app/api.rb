module Toying
  class API < Grape::API
    #prefix all mounted reqs with /api
    prefix :api
    format :json
    mount ::Toying::Shares
  end
end
