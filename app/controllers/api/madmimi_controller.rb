class Api::MadmimiController < ApplicationController
  before_action :set_shop

  def new_client
    if @shop
      response = @shop.mimi.add_to_list(params[:client][:email], @shop.madmimi_list_name, {
      :first_name   => params[:client][:first_name],
        :last_name    => params[:client][:last_name],
        :ultima_compra => params[:client][:updated_at]
        })
      puts "#{response} - Loja: #{@shop.name}" if response
    end
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
