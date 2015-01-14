module Phase6
  class Route
    attr_reader :pattern, :http_method, :controller_class, :action_name

    def initialize(pattern, http_method, controller_class, action_name)
      @pattern = pattern
      @http_method = http_method
      @controller_class = controller_class
      @action_name = action_name
    end

    # checks if pattern matches path and method matches request method
    def matches?(req)
      if @pattern === req.path
        if req.request_method.downcase.to_sym == @http_method
          return true
        end
      end
      false
    end

    # def split_uri(uri)
    #   standard_uri = uri.gsub(/:.+id/, ":") #replace :**_id in pattern with just : for matching
    #                     .gsub(/:id/, ":") #replace :id in pattern with just : for matching
    #                     .gsub(/\/\d/, "/:") #replace number in uri with just : for matching
    #                     .gsub(/\(\..+/, "") #replace (.:format) in pattern
    #                     .gsub(/\..+/, "") #replaces .format in uri
    #   standard_uri.split("/")
    # end

    # use pattern to pull out route params (save for later?)
    # instantiate controller and call controller action
    def run(req, res)
      path_params = @pattern.match(req.path)
      path_params_hash = Hash[ path_params.names.zip( path_params.captures ) ] unless path_params.nil?
      @controller_class.new(req, res, path_params_hash ||= {}).invoke_action(@action_name, @http_method)
    end
  end

  class Router
    attr_reader :routes

    def initialize
      @routes = []
    end

    # simply adds a new route to the list of routes
    def add_route(pattern, method, controller_class, action_name)
      @routes << Route.new(pattern, method, controller_class, action_name)
    end

    # evaluate the proc in the context of the instance
    # for syntactic sugar :)
    def draw(&proc)
      obj.instance_eval{proc}
    end

    # make each of these methods that
    # when called add route
    [:get, :post, :put, :delete].each do |http_method|
      define_method(http_method) do |pattern, controller_class, action_name|
        add_route(pattern, http_method, controller_class, action_name)
      end
    end

    # should return the route that matches this request
    def match(req)
      matching_route = @routes.select { |route| route.matches?(req) }
      matching_route.first unless matching_route.nil?
    end

    # either throw 404 or call run on a matched route
    def run(req, res)
      match(req) ? run(req, res) : res.status = 404
    end
  end
end
