class Play < ApplicationRecord

  belongs_to :playbook

  validates :name, presence: true

end
