class Application
attr_accessor :name, :price
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_name = req.path.split("/items/").last
      item_id = @@items.find{|i| i.name == item_name}

      resp.write item_id.price
    else
      resp.write "Route not found"
      resp.status = 404
    end

    def price
      @price
    end
    resp.finish
  end
end
