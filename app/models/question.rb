class Question < ApplicationRecord
  belongs_to :room

  validates :content, presence: true
end
