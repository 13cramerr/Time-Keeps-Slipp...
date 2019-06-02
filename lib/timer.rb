class Timer
    
    attr_reader :duration, :message

    # takes in a duration, in minutes
    def initialize(duration, message = "Time is up! Ding ding ding")
        # multiply duration by 60 to convert to minutes
        @duration = duration * 60
        @message = message
    end

    def formatted_time
        mins = duration / 60
        secs = duration  % 60

        secs = "0#{duration % 60}" if secs < 10
        
        "Time remaining: #{mins}:#{secs}"
    end

    def run
        while duration > 0
            puts ">> use 'ctrl+C' to stop <<"
            puts formatted_time
            sleep(1)
            @duration -= 1
            system("clear")
        end
        system(%Q{say -v "Vick" "#{message}"})
    end
end