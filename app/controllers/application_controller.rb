class ApplicationController < ActionController::Base
  include Pundit
  before_action :set_locale
  before_action :set_edition
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    redirect_to root_path, notice: t('flash.pundit.not_authorized')
  end

  def set_locale
    I18n.locale = I18n.available_locales.include?(params[:locale]&.to_sym) ? params[:locale] : I18n.default_locale
    Rails.application.routes.default_url_options[:locale] = I18n.locale
  end

  def set_edition 
    if cookies['geocoderLocation'].present? 
      position_coords = JSON.parse(cookies['geocoderLocation'])
      location = Location.create(position_coords)
      @edition = is_near_stockholm?(location) ? "Stockholm Edition" : "Rest of Sweden Edition"
      location.destroy
    else
      @edition = "Rest of Sweden"
    end
    @edition
  end

  def is_near_stockholm?(location)
    Location.near([59.334591, 18.063240], 100).include?(location)
  end
end
