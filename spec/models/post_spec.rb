require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'factory' do
    context 'true' do
      let(:post) { FactoryBot.build(:post) }
      it { expect(post).to be_valid }
    end

    context 'false' do
      let(:post) { FactoryBot.build(:post, title: nil) }
      it { expect(post).not_to be_valid }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:category) }

    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:rates).dependent(:destroy) }
    # it { is_expected.to have_many(:users).through(:rates).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'scope approved' do
    context 'approved posts exists' do
      let(:approved) { FactoryBot.create(:post, status: 'Approved') }
      let(:declined) { FactoryBot.create(:post, status: 'Declined') }
      let(:new) { FactoryBot.create(:post) }
      it { expect(described_class.approved).to include(approved) }
    end

    context 'no approved posts exists' do
      let(:new) { FactoryBot.create(:post) }
      let(:declined) { FactoryBot.create(:post, status: 'Declined') }
      it { expect(described_class.approved).not_to include(new, declined) }
    end
  end

  describe 'search' do
    context 'search category' do
      let(:search) { 'puPPies' }
      let(:category) { FactoryBot.create(:category, name: 'puppies') }
      let(:post) { FactoryBot.create(:post, category: category) }
      let(:post1) { FactoryBot.create(:post, title: 'puppies') }
      it { expect(described_class.search(search)).to include(post) }
    end
  end

  describe 'rating_point' do
  end

end
