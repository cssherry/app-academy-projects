require 'active_support/core_ext'
require 'webrick'
require_relative '../lib/phase8/controller_base'
require_relative '../lib/phase6/router'
require 'byebug'

# http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick.html
# http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick/HTTPRequest.html
# http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick/HTTPResponse.html
# http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick/Cookie.html

class Cat
  attr_reader :name, :owner

  def self.all
    @cat ||= []
  end

  def initialize(params = {})
    params ||= {}
    @name, @owner = params["name"], params["owner"]
  end

  def save
    return false unless @name.present? && @owner.present?

    Cat.all << self
    true
  end

  def inspect
    { name: name, owner: owner }.inspect
  end
end

class CatsController < Phase8::ControllerBase
  def create
    @cat = Cat.new(params["cat"])
    if @cat.save
      @flash[:errors] = ["Created a new cat!"]
      redirect_to("/cats")
    else
      @flash.now[:errors] = ["Fill in all the fields man!"]
      render :new
    end
  end

  def index
    @cats = Cat.all
    render :index
  end

  def new
    @cat = Cat.new
    render :new
  end
end

router = Phase6::Router.new
router.draw do
  get Regexp.new("^/cats$"), CatsController, :index
  post Regexp.new("^/cats$"), CatsController, :create
  get Regexp.new("^/cats/new$"), CatsController, :new
end

server = WEBrick::HTTPServer.new(Port: 3000)
server.mount_proc('/') do |req, res|
  route = router.run(req, res)
end

trap('INT') { server.shutdown }
server.start
