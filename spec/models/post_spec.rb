require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  it { should belong_to(:user) }
  it { should belong_to(:project) }

  it { should validate_presence_of(:title) }
  #it { should validate_presence_of(:description) }
  #it { should validate_presence_of(:picture) }
  it { should validate_presence_of(:user) }
end
