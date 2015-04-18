require 'spec_helper'

describe 'Logging::Appenders::Bugsnag' do
  before :all do
    @logger = Logging.logger['rspec']
    @logger.add_appenders(
      Logging.appenders.bugsnag('bugsnag', level: :error)
    )
  end

  let(:logger) { @logger }

  describe 'logger.debug' do
    before { expect(::Bugsnag).to_not receive(:notify) }
    it { logger.debug('debug') }
  end

  describe 'logger.info' do
    before { expect(::Bugsnag).to_not receive(:notify) }
    it { logger.info('info') }
  end

  describe 'logger.warn' do
    before { expect(::Bugsnag).to_not receive(:notify) }
    it { logger.warn('warn') }
  end

  describe 'logger.error' do
    before { expect(::Bugsnag).to receive(:notify).with(an_instance_of(RuntimeError), { severity: 'error' }) }
    it { logger.error('error') }
  end

  describe 'logger.fatal' do
    before { expect(::Bugsnag).to receive(:notify).with(an_instance_of(RuntimeError), { severity: 'error' }) }
    it { logger.fatal('fatal') }
  end
end
