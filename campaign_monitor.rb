require 'soap/wsdlDriver'

class CampaignMonitor

	@@api_key = ""
  @@driver = SOAP::WSDLDriverFactory.new("http://app.campaignmonitor.com/api/api.asmx?WSDL").create_rpc_driver
  
  attr_accessor :list_id

  def initialize(list_id)
    @list_id = list_id
  end
  
  def add_subscriber(args={})
    name = args.delete(:name)
    email = args.delete(:email)
    custom_fields = []
    args.each do |key,value|
      custom_fields << {:Key => key, :Value => value}
    end
    
    response = driver.AddAndResubscribeWithCustomFields \
                     :ApiKey       => @@api_key, 
                     :ListID       => list_id, 
                     :Email        => "#{email}",
                     :Name         => "#{name}",
                     :CustomFields => {:SubscriberCustomField =>
                       custom_fields
                     }
    driver.reset_stream
    response.subscriber_AddAndResubscribeWithCustomFieldsWSDLResult
  end

  def remove_subscriber(email)
    response = driver.Unsubscribe \
                 :ApiKey       => API_KEY, 
                 :ListID       => list_id, 
                 :Email        => "#{email}"
    driver.reset_stream
    response.subscriber_UnsubscribeResult
  end
  
  def self.api_key=(value)
    @@api_key = value
  end
  private

    def driver
      @@driver
    end

end