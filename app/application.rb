class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      input = req.params["item"]
      @@items.find{ |i| i.name == input.strip.downcase
        resp.write "#{item}\n"
      end
    else
      resp.write "page Not Found"
      resp.status = 404
    end
  end
end 
