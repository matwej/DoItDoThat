class ApplicationController < ActionController::API
  include ActionController::Serialization
  # before_action :set_locale
  #
  # protected
  #
  # def set_locale
  #   languages = HTTP::Accept::Languages.parse(request.headers['Accept-Language'])
  #   available_localizations = HTTP::Accept::Languages::Locales.new(["en"])
  #   desired_localizations = available_localizations & languages
  #   unless desired_localizations.empty?
  #     I18n.locale = desired_localizations.first
  #   end
  # end
end
