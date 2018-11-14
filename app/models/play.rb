class Play < ApplicationRecord

  has_and_belongs_to_many :playbooks
  accepts_nested_attributes_for :playbooks_plays

  validates :name, presence: true
  validates :playbooks, presence: true


end
