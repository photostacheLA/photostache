class Customer < ActiveRecord::Base

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def full_name
    first_name + ' ' + last_name
  end

  def customer_attributes
    attributes.except('id', 'created_at', 'updated_at')
  end

  def web_page_viewable?
    web_page_viewable
  end
end
