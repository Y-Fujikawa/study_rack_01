require './sample_app'
require './sample_app_02'
require 'rack/lobster'

map '/sample' do
  run SampleApp.new
end

map '/sample2' do
    run SampleApp02.new
end

map '/lobster' do
  # Rackをインストールすると
  # サンプルとして付いてくるアプリケーション
  # ちょっと面白い
  run Rack::Lobster.new
end

