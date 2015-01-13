require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      @cookies = cookies_for_app(req)
      @cookies ||= {}
    end

    def cookies_for_app(req)
      cookie = req.cookies.find { |cookie| cookie.name == '_rails_lite_app'}
      JSON.parse(cookie.value) unless cookie.nil?
    end

    def [](key)
      @cookies[key]
    end

    def []=(key, val)
      @cookies[key] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
      res.cookies << WEBrick::Cookie.new('_rails_lite_app', @cookies.to_json)
    end
  end
end
