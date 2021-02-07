class Book < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy
  
  validates :title,length: { maximum: 255 } , presence: true,uniqueness: { scope: :user_id }

end
