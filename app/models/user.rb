class User < ApplicationRecord
  
  has_one :profile
  has_many :playbooks
  has_many :plays, through: :playbooks 

  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  

  
end
