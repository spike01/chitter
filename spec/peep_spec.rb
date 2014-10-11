require 'spec_helper'

describe Peep do

  it 'creates a peep from the param hash' do
    params = { content: 'Test peep' }
    expect(Peep).to receive(:create).with(params)
    Peep.from(params)
  end
end
