require 'spec_helper'

describe Item, 'associations' do
  it { expect(subject).to belong_to(:list) }
end

describe Item, 'validations' do
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to ensure_length_of(:name).is_at_least(3) }
  it { expect(subject).to ensure_length_of(:name).is_at_most(30) }
  it { expect(subject).to ensure_length_of(:short_description).is_at_most(140) }
end
  