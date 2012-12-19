require 'active_record'
ActiveRecord::Base.establish_connection(  
                :adapter => "sqlite3",  
                :database => "admin.sqlite3",
  	        :pool => 5,
                :timeout => 5000
        )  

ActiveRecord::Schema.define do
    create_table :domains do |table|
        table.string :domain_name
        table.boolean :status, :default => false
        table.timestamps
    end
end        
