class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery except: :gallery_web_address

  def gallery_web_address
    @customers = Customer.all
                  .where(web_page_viewable: true)
                  .map { |c| [c.note, c.gallery_web_address] }

    respond_to do |format|
      format.js { render json: @customers, callback: params['callback'] }
      format.json { render json: @customers }
    end
  end

end
