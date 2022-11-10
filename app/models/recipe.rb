class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy

  # validations

  validates :name, presence: true, length: { maximum: 70 }
  validates :user_id, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :public, inclusion: { in: [true, false] }

end
