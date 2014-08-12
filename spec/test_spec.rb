
describe EventMachine::Test do

  include EventMachine::Test.new(1)
  include RSpec::EM::FakeClock

  #before { clock.stub }
  #after { clock.reset }

  it 'raises timeout error when done is not called' do
    expect do
      em_test do |done|
        #clock.stub
        #clock.tick(1)
      end
    end.to raise_error(EventMachine::Test::TimeoutError)
  end

  it 'does not raise timeout error if done is called' do

    expect do
      em_test do |done|
        done.call
      end
    end.to_not raise_error

  end

end