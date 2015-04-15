
require 'timeout'




def try_with_timeout (timeout_seconds)
  Timeout.timeout(timeout_seconds) do
    begin
      yield
    rescue Exception => e
      puts 'Takes too long'
    ensure
      "#ENSURED"
    end
  end
end

try_with_timeout(2.0) do
  sleep 3.0
  puts "That was refreshing..."
end
