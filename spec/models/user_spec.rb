require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'test@example.com', password: 'password123', name: 'John Doe') }

  describe 'validations' do
    it 'validates presence of name on update' do
      user = User.new(email: 'test@example.com', password: 'password123')
      user.valid?(:update) # Trigger validations for :update context
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of email' do
      user = User.new(email: nil, password: 'password123')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'validates presence of password' do
      user = User.new(email: 'test@example.com', password: nil, name: 'John Doe')
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it { should have_many(:groups) }
  end

  describe 'Devise modules' do
    it 'validates presence of name on update' do
      user = User.new(email: 'test@example.com', password: 'password123')
      user.valid?(:update) # Trigger validations for :update context
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of email' do
      user = User.new(email: nil, password: 'password123')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'validates presence of password' do
      user = User.new(email: 'test@example.com', password: nil, name: 'John Doe')
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end

  context 'when saving with changes to email' do
    it 'validates presence of name on update' do
      user = User.new(email: 'test@example.com', password: 'password123')
      user.valid?(:update) # Trigger validations for :update context
      expect(user.errors[:name]).to include("can't be blank")
    end
  end
end