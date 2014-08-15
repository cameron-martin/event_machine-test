require 'eventmachine'

module EventMachine
  class Test < Module

    class TimeoutError < RuntimeError; end

    def initialize(timeout)
      super() do

        define_method(:em_test) do |&block|
          done_callback = proc { throw :stop }

          # Calling EM.stop does not work, since it waits for the timer to finish first.
          catch(:stop) do
            EventMachine.run do
              EventMachine.add_timer(timeout) { raise TimeoutError }
              block.call(done_callback)
            end
          end
        end

      end
    end

  end
end
