CAMPAIGNMONITOR
=============

This is a simple CampaignMonitor.com class to add/remove subscribers to/from subscriber lists.
I'm using this to add and remove subscribers/users from my app to campaignmonitor.com

USAGE:
---------

require "campaign_monitor"

CampaignMonitor.api_key = "your key here"

campaign_monitor = CampaignMonitor.new( [LIST_ID] )

campaign_monitor.add_subscriber(:email => "me@spam.com", :name =>"Michael Spam") # note everything but email and name will be passed to CampaignMonitor as custom field


campaign_monitor.remove_subscriber("me@spam.com")


TODO:
---------
 * perhaps add some more features like handly bounces

Credits:
---------
http://bjhess.com/bjhessblog/2008/02/19/calling-mailbuild-addwithcustomfields-with-ruby/
Michael Bumann - railslove.com