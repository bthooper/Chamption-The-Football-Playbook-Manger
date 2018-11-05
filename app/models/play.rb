class Play < ApplicationRecord

  has_and_belongs_to_many :playbooks

  validates :name, presence: true

  accepts_nested_attributes_for :playbooks

end
