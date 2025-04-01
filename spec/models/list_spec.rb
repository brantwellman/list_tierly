require 'rails_helper'

RSpec.describe List, type: :model do
  describe "validations" do
    subject { build(:list) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:user) }
  end
end
