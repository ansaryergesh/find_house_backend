# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(username: 'qwerty', password: 'password', bio: 'My name is qwertyasas')
  end
  context 'valid User' do
    it 'has a valid name' do
      expect(@user).to be_valid
    end
  end

  context 'invalid User' do
    it 'has a unique username' do
      @user = User.create(username: 'ansar', password: 'password', bio: 'My name is Ansar')
      @user.invalid?
      expect(@user.errors[:username]).to include('has already been taken')
    end

    it 'validate presense of' do
      @user = User.new(username: 'asdfg', password: '', bio: '')
      expect(@user).to_not be_valid
    end
  end

  describe "Associations and Validation" do
    it { should have_many(:homes).dependent(:destroy) }
    it { should have_many(:favourites).dependent(:destroy) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:bio) }
    it { should validate_presence_of(:password) }
  end
end