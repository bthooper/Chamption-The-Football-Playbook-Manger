class Playbook < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :plays


  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  
end
