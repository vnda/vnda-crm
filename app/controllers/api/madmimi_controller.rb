class Api::MadmimiController < ApplicationController
  before_action :set_shop

  def new_client
    render json: 'ok'
  end
  private

  def set_shop
    logger.debug "Shop: #{env['HTTP_X_STORE']}"
    @shop = begin
      params[:token].present? ? Shop.find_by!(token: params[:token]) : Shop.find_by(name: (env['HTTP_X_STORE'] || "unknown-host").split(':').first)
    rescue ActiveRecord::RecordNotFound
      return head :unauthorized
    end
  end

end
