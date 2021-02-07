require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'Presence validations' do
    it { should validate_presence_of(:title) }
  end
end
