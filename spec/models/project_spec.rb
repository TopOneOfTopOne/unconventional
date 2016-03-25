require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { create(:project) }

  it { should belong_to(:user) }

  it { should validate_presence_of(:title) }
  #it { should validate_presence_of(:description) }
  it { should validate_presence_of(:user) }

  describe "attributes" do
    it "responds to title" do
      expect(project).to respond_to(:title)
    end

    it "responds to description" do
      expect(project).to respond_to(:description)
    end

  end
end
