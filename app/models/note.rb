class Note < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :title, length: { maximum: 255 }, presence: true, uniqueness: { scope: :book_id }
  validates :body, presence: true
end
