class Order < ApplicationRecord
  belongs_to :user
  has_many :carts

  after_create :send_email

  def send_email
    order_details = "Order ID ##{self.id}"
    order_details += "\n Address: #{address}"
    order_details += "\n City: #{city}"
    order_details += "\n Country: #{country}"
    order_details += "\n Phone: #{phone}"
    order_details += "\n\n Ordered Items"
    
    byebug
    carts.each_with_index do |cart_item, index|
      order_details += "\n\n Items #{index + 1}"
      order_details += "\n Title: #{cart_item.menu.title}"
      order_details += "\n Description: #{cart_item.menu.description}"
      order_details += "\n Price: #{cart_item.menu.price}"
    end

    payload = {
      :from => "Divertica <mailgun@sandbox0e59a2317ac248a5b7f6831d2769b8bc.mailgun.org>",
      :to => self.user.email || "venkatesh@f22labs.com",
      :subject => "Order Created!",
      :text => order_details
    }

    require 'mailgun-ruby'

    # First, instantiate the Mailgun Client with your API key
    mg_client = Mailgun::Client.new 'f3388c0cf5665ceb98fbd8a0967d44f9-73e57fef-d213537d'


    # Send your message through the client
    mg_client.send_message 'sandbox0e59a2317ac248a5b7f6831d2769b8bc.mailgun.org', payload



    # require 'rest-client'

    # response = RestClient.post "https://api:f3388c0cf5665ceb98fbd8a0967d44f9-73e57fef-d213537d@api.mailgun.net/v3/sandbox0e59a2317ac248a5b7f6831d2769b8bc.mailgun.org/messages", payload.to_json, :content_type => "application/json"

    # return response
    

  end
  
end
