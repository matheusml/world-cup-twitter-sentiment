source 'https://rubygems.org'

ruby '1.9.3', :engine => 'jruby', :engine_version => '1.7.5'
gem 'rails', '4.0.0'

#gem 'pg'
#gem 'mysql2', '0.3.15'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'execjs'
gem 'therubyrhino'
gem 'activerecord-jdbcmysql-adapter'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem "twitter-bootstrap-rails"
gem 'tweetstream'
gem 'lazy_high_charts'

group :production do
  gem 'activerecord-jdbcpostgresql-adapter', platform: :jruby
  #gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end