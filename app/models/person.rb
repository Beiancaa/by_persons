class Person < ApplicationRecord
  has_one :profile, :dependent => :destroy
  has_many :addresses, :dependent => :destroy
  belongs_to :user
end
