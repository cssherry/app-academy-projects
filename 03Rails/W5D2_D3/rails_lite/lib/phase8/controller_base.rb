require_relative '../phase6/controller_base'
require_relative './flash'

module Phase8
  class ControllerBase < Phase6::ControllerBase
    # use this with the router to call action_name (:index, :show, :create...)
    attr_reader :flash

    def initialize(req, res, route_params = {})
      super
      flash
    end

    def redirect_to(url)
      @flash.store_flash_cookie(@res)
      super
    end

    def flash
      @flash ||= Flash.new(@req)
    end
  end
end
