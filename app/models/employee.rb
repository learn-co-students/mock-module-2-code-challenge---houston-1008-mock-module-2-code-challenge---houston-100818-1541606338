class Employee < ApplicationRecord
  belongs_to :dog

  def to_s
    self.first_name + " " + self.last_name
  end

  def self.aliases
    Employee.all.map { |employee| employee.alias }
  end

  def self.titles
    Employee.all.map { |employee| employee.title }
  end

  def self.uniq_alias_and_title?(params, employee)
    aliases = self.aliases
    aliases.delete(employee.alias)

    titles = self.titles
    titles.delete(employee.title)

    aliases.include?(params[:alias]) || titles.include?(params[:title]) ? false : true
  end

end
