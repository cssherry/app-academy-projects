require_relative '../phase5/controller_base'

module Phase6
  class ControllerBase < Phase5::ControllerBase
    # use this with the router to call action_name (:index, :show, :create...)
    def invoke_action(name, method)
      session
      @routers ||= Router.new
      @routers.send(method, Regexp.new("^#{@req.path}$"), self.class, name)
      if methods.include?(name)
        send(name)
      else
        render_content(@req.body, "text/html")
      end
    end
  end
end
