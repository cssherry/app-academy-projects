module Phase2
  class ControllerBase
    attr_reader :req, :res

    # Setup the controller
    def initialize(req, res)
      @req = req
      @res = res
      @already_built_response = false
    end

    # Helper method to alias @already_built_response
    def already_built_response?
      @res.status = 500 if @already_built_response
      @already_built_response
    end

    # Set the response status code and header
    def redirect_to(url)
      fail if already_built_response?
      @res.status = 302
      @res['location'] = url
      @already_built_response = true
    end

    # Populate the response with content.
    # Set the response's content type to the given type.
    # Raise an error if the developer tries to double render.
    def render_content(content, type)
      fail if already_built_response?
      @res.content_type = type
      @res.body = content
      @already_built_response = true
    end
  end
end
