require 'rails_helper'
require 'spec_helper'

describe Event do
	describe '#name' do
		it { should validate_presence_of(:name) }
		it { should validate_length_of(:name).is_at_most(50) }
	end

	describe '#created_by?' do
		let(:event) { create(:event) }
		subject { event.created_by?(user) }

		context 'when arg is nil' do
			let(:user) { nil }
			it { should be_falsey }
		end

		context '#owner_id equal arg #id' do
			let(:user) { double('user', id: event.id) }
			it { should be_truthy }
		end
	end
end
