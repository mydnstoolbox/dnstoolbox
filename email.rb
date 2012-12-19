require 'action_mailer'
require "#{File.dirname(__FILE__)}/db2"

class MyMailer < ActionMailer::Base
                default :from => "amir@lt.my"
                def load_settings
                    ActionMailer::Base.smtp_settings = {
				:address        => "smtp.gmail.com",
                      		:port           => 587,
                      		:authentication => "plain",
                      		:user_name      => "amir@lt.my",
                      		:password       => "",
                      		:enable_starttls_auto => true
                    }
                    ActionMailer::Base.delivery_method = :smtp
                    ActionMailer::Base.perform_deliveries = true
                    ActionMailer::Base.raise_delivery_errors = true
                end

        	def send_mail rec, subj, bod=nil
                     load_settings  
                     mail(   :to => rec, :subject => subj, 
                                :content_type  => "text/plain",
:body => File.read("#{File.dirname(__FILE__)}/email.txt")
                        )
                end
end

domains = Domain.all
file = File.new("email.txt","w")
domains.each {|x| file.puts x.domain_name}
file.close
MyMailer.send_mail("amir@localhost.my", "Senarai domain").deliver
