class Employee < ApplicationRecord
  belongs_to :dog
  validates :title, :alias, uniqueness: true
  def full_name
    first_name + " " + last_name
  end

  

end
