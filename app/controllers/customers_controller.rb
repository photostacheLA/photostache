class CustomersController < ApplicationController
  # before_filter :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def update
  end

  def edit
  end

  def create
    customer = Customer.find_by_email(customer_params[:email])
    if customer.present?
      flash[:alert] = "Customer with this email already exists! Check again you fools! Roy Kim!"
    else
      Customer.create(customer_params)
    end
    redirect_to customers_path
  end

  def destroy
  end

  def customer_params
    params.require(:customer).permit!
  end
end
