class Student < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy
  has_and_belongs_to_many :courses
end
