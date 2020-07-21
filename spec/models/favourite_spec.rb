# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favourite, type: :model do
  describe 'Associations' do
    it { should belong_to(:user).dependent(false) }
    it { should belong_to(:home).dependent(false) }
  end
end
