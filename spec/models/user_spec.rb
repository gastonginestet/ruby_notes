require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Presence validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_presence_of(:email) }
  end
end
