class SampleApp
  def call(env)
    case env['REQUEST_METHOD']
      when 'GET'
        [
            200,
            { 'Content-Type' => 'text/html;charset=utf-8' },
            ['<html><body><form method="POST"><input type="submit" value="見たい？" /></form></body></html>']
        ]
      when 'POST'
        [
            200,
            { 'Content-Type' => 'text/html;charset=utf-8' },
            ['<html><body>何見てんだよ</body></html>']
        ]
    end
  end
end
