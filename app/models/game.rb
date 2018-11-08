class Game < ApplicationRecord

  belongs_to :user
  belongs_to :opponent

  scope :upcoming, -> { where("date > ?", DateTime.now) }
  scope :by_date, -> { order("date") }

end
