class Employee < ApplicationRecord
  belongs_to :dog

  def full_name
    first_name + " " + last_name
  end

  def self.aliases 
    Employee.all.map do |emp|
      emp.alias 
    end
  end

  def self.titles 
    Employee.all.map do |emp|
      emp.title 
    end
  end
end
