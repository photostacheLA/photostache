class CustomersController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "You've successfully edited customer's profile!"
      redirect_to customer_path(@customer)
    else
      flash[:alert] = "Uh oh, something went wrong :("
      redirect_to edit_customer_path(@customer)
    end
  end

  def edit
    @customer = Customer.find(params[:id])
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
