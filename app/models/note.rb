class Note < ApplicationRecord
  belongs_to :book , inverse_of: :notes
  validates :title, length: { maximum: 255 }, presence: true, uniqueness: { scope: :book_id }
  validates :body, presence: true
end
