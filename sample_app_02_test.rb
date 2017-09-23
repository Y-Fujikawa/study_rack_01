require './sample_app_02'
require 'test/unit'
require 'rack/mock'

class SampleApp02Test < Test::Unit::TestCase
    def setup
      @app = SampleApp02.new
      @mr  = Rack::MockRequest.new(@app)
    end

    def test_get
      res = nil
      assert_nothing_raised('なんか失敗した') { res = @mr.get('/', :lint => true) }
      assert_not_nil res, 'レスポンス来てない'
      assert_equal 200, res.status, 'ステータスコードが変'
      assert_equal 'text/html;charset=utf-8', res['Content-Type'], 'Content-Typeが変'
      assert_match /<html><body><form method=\"POST\"><input type=\"submit\" value=\"見たい？\[Rack Request, Response\]を使った例\" \/><\/form><\/body><\/html>/, res.body, '本文が変'
    end

    def test_post
      res = nil
      assert_nothing_raised('なんか失敗した') { res = @mr.post('/', :lint => true) }
      assert_not_nil res, 'レスポンス来てない'
      assert_equal 200, res.status, 'ステータスコードが変'
      assert_equal 'text/html;charset=utf-8', res['Content-Type'], 'Content-Typeが変'
      assert_match /<html><body>何見てんだよ\[Rack Request, Resuponse\]を使った例<\/body><\/html>/, res.body, '本文が変'
    end
end
