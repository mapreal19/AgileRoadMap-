source 'https://rubygems.org'
ruby '1.9.3'
#ruby-gemset=AgileRoadMap+

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

group :development do
	#http://railscasts.com/episodes/402-better-errors-railspanel
	gem 'better_errors'
	gem 'binding_of_caller'
	gem 'meta_request'
end

group :development, :test do
	# Use sqlite3 as the database for Active Record
	gem 'sqlite3', '1.3.8'
	gem 'rspec-rails', '2.13.1'
	# gem 'annotate'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
end

# Heroku for development
group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end

group :assets do
	# HTML 5 support, http://modernizr.com/
	gem "modernizr-rails", "~> 2.6.2.3"
end

#>= always install the lastest gem, whereas ~> install minor releases (e.g. from 4.0.0 to 4.0.1)

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

# https://github.com/igor-alexandrov/wiselinks
# to add wiselinks to a link, you have to give it a data attribute of push set to true, like so:
# <% link_to "Home", root_path, data: { push: true } %>
gem 'wiselinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'debugger', group: [:development, :test]

# HTML abstraction language (Haml)
gem 'haml', '~> 4.0.3'
gem 'haml-rails', '~> 0.4'

# http://railscasts.com/episodes/314-pretty-urls-with-friendlyid?view=asciicast
#gem 'friendly_id'

gem 'font-awesome-sass-rails'
