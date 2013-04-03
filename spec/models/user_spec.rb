require 'spec_helper'

describe User, 'associations' do
  it { expect(subject).to have_many(:lists) }
end

describe User, 'validations' do

end
  