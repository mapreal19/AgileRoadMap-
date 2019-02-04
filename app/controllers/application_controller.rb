class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_locale
  before_action :allow_iframe_requests

  def signed_in_user
    redirect_to signin_url, flash: { info: 'Por favor haz Login.' } unless signed_in?
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale] = I18n.locale
  end

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
end
