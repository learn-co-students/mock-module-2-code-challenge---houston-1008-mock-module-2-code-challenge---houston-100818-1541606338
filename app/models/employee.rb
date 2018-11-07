class Employee < ApplicationRecord

  belongs_to :dog
  validates_uniqueness_of :alias
  validates_uniqueness_of :title

end
