require 'spec_helper'

describe Logging::Plugins::Bugsnag do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end
end
