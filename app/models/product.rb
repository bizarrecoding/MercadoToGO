class Product < ActiveRecord::Base
    has_many :order_items
    belongs_to :user
    #default_scope { where(active: true) }
    
end
