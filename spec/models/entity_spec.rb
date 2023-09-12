require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'validations' do
    user = User.create(name: 'John Doe')
    subject do
      Entity.new(
        author: user,
        name: 'John Doe'
      )
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an author' do
      subject.author = nil
      expect(subject).to_not be_valid
    end
  end
end
