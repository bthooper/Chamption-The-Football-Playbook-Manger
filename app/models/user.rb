class User < ApplicationRecord

  has_secure_password

  
  has_one :profile, dependent: :destroy
  has_many :playbooks
  has_many :plays, -> { distinct }, through: :playbooks 
  has_many :games
  has_many :opponents, through: :games

  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  accepts_nested_attributes_for :profile
  

  
end
