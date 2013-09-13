require_relative '../../db/config'

class Student < ActiveRecord::Base
validates :email, format: { with: /.+@.+\.\w{2,}/}, uniqueness: true
validates :age, numericality: { greater_than: 5 }
validates :phone, length: { minimum: 12 }

  def phone_number_must_contain_at_least_10_digits
     raise "Check phone number: wrong number of digits" if phone.gsub(/\D/,"").length < 10
  end

  def name
    "#{first_name} #{last_name}"
  end

  def age
    Time.now.year-birthday.year
  end
end

