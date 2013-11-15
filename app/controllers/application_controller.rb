class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_locale

  private
  	# http://xyzpub.com/en/ruby-on-rails/3.2/i18n_mehrsprachige_rails_applikation.html
  	def set_locale
  		I18n.locale = params[:locale] || I18n.default_locale
  		Rails.application.routes.default_url_options[:locale]= I18n.locale 
  	end
end
