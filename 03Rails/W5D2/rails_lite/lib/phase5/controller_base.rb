require_relative '../phase4/controller_base'
require_relative './params'

module Phase5
  class ControllerBase < Phase4::ControllerBase
    attr_reader :params

    # setup the controller
    def initialize(req, res, route_params = {})
      @req = req
      @res = res
      @params = Params.new(req, route_params ||= {})
      session #needs to be after @req and @res is defined
    end
  end
end
