require 'active_record'
ActiveRecord::Base.establish_connection(  
                :adapter => "sqlite3",  
                :database => "admin.sqlite3",
  	        :pool => 5,
                :timeout => 5000
        )  

class Domain < ActiveRecord::Base 
  has_many :name_servers
end

class NameServer < ActiveRecord::Base
  belongs_to :domain
end

#Domain.create(:domain_name => "amir.my", :status => true)
#Domain.create(:domain_name => "saya.my", :status => true)

#domains = Domain.all
#domains.each {|x| puts "#{x.domain_name} #{x.created_at}"}
