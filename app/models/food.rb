class Food < ApplicationRecord
  has_many :recipe_foods, foreign_key: :food_id, dependent: :destroy
  belongs_to :user, foreign_key: :user_id
end
