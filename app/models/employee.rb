class Employee < ApplicationRecord
  belongs_to :dog
  validates :title, :alias, absence: true, on: :create

  def full_name
    first_name + " " + last_name
  end

  

end
