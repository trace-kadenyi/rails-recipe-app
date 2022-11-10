class Food < ApplicationRecord
  has_many :recipe_foods, foreign_key: :food_id, dependent: :destroy
  belongs_to :user, foreign_key: :user_id

  # validations

  validates :name, presence: true, length: { minimum: 2, maximum: 70 }
  validates :user_id, presence: true
  validates :measurement_unit, presence: true, length: { maximum: 15 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
