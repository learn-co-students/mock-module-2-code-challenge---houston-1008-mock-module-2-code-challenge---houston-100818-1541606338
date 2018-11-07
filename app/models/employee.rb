class Employee < ApplicationRecord
    belongs_to :dog
    validates_uniqueness_of :alias, if: :different_than_none?
    validates_uniqueness_of :title
     
 
    def different_than_none?
        self.alias != "none"
    end
        
    
    def name 
        first_name + " " + last_name
    end 
end
