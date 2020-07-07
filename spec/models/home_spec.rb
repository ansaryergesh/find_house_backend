# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Home, type: :model do
  before :each do
    @user = User.create(username: 'qwerty', password: 'password', bio: 'My name is qwertyasas')
    @home = @user.homes.new(name: 'House', descripton: 'House description', price: '656565')
  end
  context 'valid home' do
    it 'valid home' do
      expect(@home).to be_valid
    end
  end
  context 'invalid Talk' do
    it 'has a invalid name' do
      @home.name = ' '
      expect(@home).to_not be_valid
    end

    it 'has a invalid description' do
      @home.descripton = ' '
      expect(@home).to_not be_valid
    end

    it 'has a invalid price' do
      @home.price = ' '
      expect(@home).to_not be_valid
    end
  end
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:favourites) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:descripton) }
    it { should validate_presence_of(:price) }
  end
end
