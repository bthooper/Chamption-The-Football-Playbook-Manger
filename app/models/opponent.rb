class Opponent < ApplicationRecord
  has_many :games

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :name, uniqueness: true
  validates :mascot, presence: true

end
