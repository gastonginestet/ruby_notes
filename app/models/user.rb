class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :books, inverse_of: :user, dependent: :destroy

  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true

  after_create :create_global_book

  def create_global_book
    books.create title: 'Global'
  end
end
