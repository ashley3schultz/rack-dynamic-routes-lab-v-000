class Application
attr_accessor :name, :price
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_name = req.path.split("/items/").last #turn /songs/Sorry into Sorry
      item = @@items.find{|i| i.name == item_name}

      resp.write item.price
    else
      resp.write "page Not Found"
      resp.status = 404
    end
    resp.finish
  end
end
