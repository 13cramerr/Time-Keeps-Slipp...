class PairTimer
    
    attr_reader :time, :message

    def initialize(name_1, name_2, message = nil)
        @time = 900 # 15 mins
        @pair = [name_1, name_2]
        @current_person = @pair[0]
        @next_person = @pair[1]
        @message = message
        @default_message = "Time to switch, it is #{@next_person}'s turn to navigate.'"
    end


    def reset_time
        @time = 900
    end


    def formatted_time
        mins = time / 60
        secs = time % 60

        secs = "0#{time % 60}" if secs < 10

        "Time remaining: #{mins}:#{secs}"
    end


    def switch_person!
        # debugger
        @pair.rotate!
        @current_person = @pair[0]
        @next_person = @pair[1]
        @default_message = "Time to switch, it is #{@next_person}'s turn to navigate.'"
    end


    def display_d_n
        puts "Navigator: #{@current_person}"
        puts "Driver: #{@next_person}"
    end


    def run
        loop do
            until time <= 0
                system("clear")
            puts ">> use 'ctrl+C' to stop <<\n\n"
                puts display_d_n
                puts formatted_time
                sleep(1)
                @time -= 1
            end

            msg = @message || @default_message
            system(%Q{say -v "Vick" "#{msg}"})
            switch_person!
            system("clear")

            puts ">> use 'ctrl+C' to stop <<"          
            puts "Press 'Enter' when you are ready"
            gets
            reset_time
        end
    end
end