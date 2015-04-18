source 'https://rubygems.org'

#ruby-gemset=AgileRoadMap+

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.9'
ruby '2.1.5'

group :development do
  #http://railscasts.com/episodes/402-better-errors-railspanel
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'guard-cucumber'
  gem 'spring'
end

group :development, :test do
  gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.13.1'
  gem "spring-commands-cucumber"
end

group :test do
  gem 'selenium-webdriver', '~> 2.42.0'
  gem 'capybara', '~> 2.3.0'
  gem 'poltergeist'
  gem 'cucumber-rails', '~> 1.4.1', :require => false
  gem 'database_cleaner'
  gem 'launchy', '~> 2.4.2'
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end

group :assets do
  # HTML 5 support, http://modernizr.com/
  gem "modernizr-rails", "~> 2.6.2.3"
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

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

# HTML abstraction language (Haml)
gem 'haml', '~> 4.0.3'
gem 'haml-rails', '~> 0.4'

gem 'font-awesome-sass-rails'

# https://github.com/swanandp/acts_as_list
gem 'acts_as_list'
gem 'jquery-ui-rails'

# http://touchpunch.furf.com/ Touch Event Support for jQuery UI
gem 'touchpunch-rails'

# https://github.com/caarlos0/nprogress-rails
gem 'nprogress-rails'

gem 'faker'

# http://ankane.github.io/chartkick/
gem 'chartkick'

gem 'groupdate'

#Tool to improve the translations with links embedded https://github.com/iGEL/it
gem 'it'

#translations from databases
gem 'globalize', '~> 4.0.2'