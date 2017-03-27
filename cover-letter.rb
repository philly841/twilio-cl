require 'rubygems'
require 'twilio-ruby'
require 'sinatra'


post '/sms' do
  topic = params['Body']

  subjects = {
    "Product" => "Admittedly, Philip has never been a Product Manager. However, he has worked extensively with the Product teams at Cornerstone to help shape the company's investment strategy, M&A perspective, and strategic initiatives. Philip believes strong product knowledge is crucial to identify ways to maximize value for customers and expand the ecosystem without creating conflicts of interest and competitive overlap.",
    "Partnerships" => "Philip views strategic partnerships as a key strategy for companies to maximize their solution capabilities, customer experience, and top-line growth in a resource-efficient manner. Beyond traditional M&A and venture investments, he spearheaded a customer migration project with one of Cornerstone's reseller partners and has also driven several Business Development initiatives including discussions with partners leveraging Cornerstone's client base and sales channels.",
    "Work Style" => "Philip is results-driven, and likes building consensus and collaboration with other stakeholders to achieve success.  He works well independently to hit deadlines but believes that open communication is important to ensure everyone agrees on how to proceed.  He has worked closely with Finance & Accounting, Product, Sales, Marketing, HR, and Tech teams while at Cornerstone.",
    "Industry Experience" => "Philip's been in tech since he graduated from UC Berkeley and has over 9 years of total industry experince, with the last 7 years working directly with cloud companies as an investment banker and in Corporate Development. He has worked with companies with similar business models to Twilio's such as ExactTarget, and appreciates the usage based model in aligning customer interests with that of the company's.",
    "More" => "Sounds like it may be worth having a quick phone call with Philip.  He'd love to tell you more in person!"
  }
  message = subjects[topic] || "Sorry, that was unclear, please respond with Product, Partnerships, Work Style, Industry Experience or More."
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message message
  end
  twiml.text
end



