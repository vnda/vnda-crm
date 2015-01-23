class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private

  def success_redirect(*args)
    opts = args.extract_options!
    key = "#{params[:controller]}.#{params[:action]}"
    notice = I18n.t(key, scope: [:notices])
    redirect_to(*args, opts.reverse_merge(notice: notice))
  end

  def require_authentication
    if Rails.env == "production"
      authenticate_or_request_with_http_basic do |name, password|
        name == ENV['HTTP_USER'] && password == ENV['HTTP_PASSWORD']
      end
    end
  end
end
