class ApplicationController < ActionController::Base
protect_from_forgery

before_filter  :set_language

helper_method :current_user_session, :current_user

def set_language
  unless session[:locale]
    country_code = get_country_code_by_id(request.remote_ip)
    if country_code =='no'
      Language.set('no')
      I18n.locale = 'no'
    else
      Language.set('en')
      I18n.locale = 'en'
    end
    session[:locale] = Language.to_s
  end
  Language.set(session[:locale])
  I18n.locale = session[:locale]

  if params[:locale] =~/en|no/
    Language.set(params[:locale])
    I18n.locale = params[:locale]
    session[:locale] = Language.to_s
    #redirect_to :back
  end
end

def get_country_code_by_id(ip)
  begin
    output= IO.popen("whois #{ip} | grep country:")
    output.gets[8..-1].strip.downcase
  rescue
    "en"
  end
end
private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    unless current_user
    store_location
    flash[:notice] = "You must be logged in to access this page"
    redirect_to login_url
    return false
    end
  end

  def require_no_user
    if current_user
    store_location
    flash[:notice] = "You must be logged out to access this page"
#    redirect_to login_url
    return false
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end

