require 'active_record'
ActiveRecord::Base.establish_connection(  
                :adapter => "sqlite3",  
                :database => "admin.sqlite3",
  	        :pool => 5,
                :timeout => 5000
        )  

ActiveRecord::Schema.define do
    create_table :name_servers do |table|
        table.integer :domain_id
        table.string :nameserver
        table.string :ip_address
        table.boolean :status, :default => true
        table.timestamps
    end
end        
