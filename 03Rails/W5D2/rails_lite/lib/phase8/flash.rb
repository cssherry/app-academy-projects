module Phase8
  class Flash
    def initialize(req)
      @flash = cookies_for_app(req)
      @flash ||= {}
      @flash_later = {}
    end

    def cookies_for_app(req)
      cookie = req.cookies.find { |cookie| cookie.name == '_rails_lite_app_flash'}
      JSON.parse(cookie.value) unless cookie.nil?
    end

    def []=(key, value)
      @flash_later[key] = value
    end

    def now
      @flash#[key] = value, don't need to create separate method for now[]=, you can't
    end

    def [](key)
      @flash[key]
    end

    def store_flash_cookie(res)
      res.cookies.unshift(WEBrick::Cookie.new('_rails_lite_app_flash', @flash_later.to_json))
    end
  end
end
