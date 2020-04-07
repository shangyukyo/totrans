class Admin::ContactsController < Admin::BaseController
  before_action :find_contact, only: [:index, :update]
  
  def index    
  end  

  def update
    @contact.update_attributes!(contact_params)    
    redirect_to admin_contacts_path
  end

  protected

  def find_contact
    @contact = Contact.first
  end

  def contact_params
    params.permit(:email, :support_email, :air_transpot_phone, :shipping_phone, :customer_service_phone, :address_1, :address_2)
  end
end