class Playbook < ApplicationRecord

  belongs_to :user
  has_many :plays


  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  
end
