require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:user) {create(:user)}
  let(:project) {create(:project, user_id: user.id)}

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:contents) }
    it { is_expected.to have_one_attached(:thumbnail) }

  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe '.project thumbnail_url' do
    it "returns the url of project thumbnail" do
      path_url = project.thumbnail_url
      expect(project.thumbnail_url).to eq(path_url)  
    end
  end
end
