require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "relationships" do
    it { should have_many(:enrollments) }
    it { should have_many(:students).through(:enrollments) }
    it { should belong_to(:teacher) }
  end
end