class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
