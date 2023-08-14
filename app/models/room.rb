class Room < ApplicationRecord
  before_create :generate_slug
  
  has_many :messages, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :name, presence: true
  validates :slug, uniqueness: true

  private
    def generate_slug
      self.slug = SecureRandom.uuid
    end
end
