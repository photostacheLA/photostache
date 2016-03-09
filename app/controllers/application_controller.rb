class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def gallery_web_address
    @customers = Customer.all
                  .where(web_page_viewable: true)
                  .map { |c| [c.note, x.gallery_web_address] }
    render json: @customers, callback: params['callback']
  end
end
