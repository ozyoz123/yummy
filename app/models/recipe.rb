class Recipe < ApplicationRecord

  validates :name, presence: true, length: {minimum: 3, maximum: 15}
  validates :description, presence: true, length: {minimum: 5, maximum: 500}

  belongs_to :chef
  validates :chef_id, presence: true

end