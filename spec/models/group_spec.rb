require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    user = User.create(name: 'John Doe')
    subject do
      Group.new(
        name: 'Group 1',
        user:
      )
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
