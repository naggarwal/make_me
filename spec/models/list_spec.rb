require 'spec_helper'

describe List, 'associations' do
  it { expect(subject).to have_many(:items) }
  it { expect(subject).to belong_to(:user) }
end

describe List, 'validations' do
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to ensure_length_of(:name).is_at_least(3) }
  it { expect(subject).to ensure_length_of(:name).is_at_most(30) }
end
