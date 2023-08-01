require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:room_number) }
  end

  describe "relationships" do
    it { should have_many(:courses) } 
    it { should have_many(:students).through(:courses) }
  end
end