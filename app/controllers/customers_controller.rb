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
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "You've created a new customer!"
      redirect_to customers_path
    else
      flash[:alert] = "Uh oh, something went wrong :("
      render "new"
    end
  end

  def destroy
  end

  def customer_params
    params.require(:customer).permit!
  end
end
