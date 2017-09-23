require 'rack/request'
require 'rack/response'

class SampleApp02
  def call(env)
    req = Rack::Request.new(env)

    body = case req.request_method
      when 'GET'
        '<html><body><form method="POST"><input type="submit" value="見たい？[Rack Request, Response]を使った例" /></form></body></html>'
      when 'POST'
        '<html><body>何見てんだよ[Rack Request, Resuponse]を使った例</body></html>'
    end

    res = Rack::Response.new do |r|
      r.status = 200
      r['Content-Type'] = 'text/html;charset=utf-8'
      r.write body
    end
    res.finish
  end
end
