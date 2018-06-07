class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path=="/items"
      resp.write
    else
      resp.write "page Not Found"
      resp.status = 404
    end
  end
end 
