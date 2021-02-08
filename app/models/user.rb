class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true

  enum role: [:standard, :admin]
  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end
end
