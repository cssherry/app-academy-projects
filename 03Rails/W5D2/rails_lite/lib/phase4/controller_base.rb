require_relative '../phase3/controller_base'
require_relative './session'

module Phase4
  class ControllerBase < Phase3::ControllerBase
    def redirect_to(url)
    end

    def render_content(content, type)
    end

    # method exposing a `Session` object
    def session
    end
  end
end
