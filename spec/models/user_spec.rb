require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject do
      User.new(
        name: 'John Doe',
        email: 'test@email.com',
        password: 'password',
        password_confirmation: 'password'
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
