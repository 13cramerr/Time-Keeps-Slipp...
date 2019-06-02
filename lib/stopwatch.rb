require 'byebug'
class StopWatch

    attr_accessor :hours, :minutes, :seconds

    def initialize
        @hours = 0
        @minutes = 0
        @seconds = 0
    end

    def formatted_time
        hours == 0 ? hrs = "" : hrs = "#{hours}:"
        minutes < 10 ? mins = "0#{minutes}" : mins = "#{minutes}"
        seconds < 10 ? secs = "0#{seconds}" : secs = "#{seconds}"
        "#{hrs}#{mins}:#{secs}"
    end

    def run
        loop do
            if @seconds > 59
                @seconds = 0
                @minutes += 1
            end

            if @minutes == 60
                @minutes = 0
                @hours += 1
            end

            puts ">> use 'ctrl+C' to stop <<"
            puts "Time: " + formatted_time

            @seconds += 1
            sleep(1)
            system("clear")
        end
    end
end