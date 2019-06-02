require_relative 'timer'
require_relative 'stopwatch'
require_relative 'pair_timer'
require 'byebug'
def get_choice
    puts "Hello, please pick the one you would like to use: "
    puts "1) Timer"
    puts "2) Pair Timer (for a/A)"
    puts "3) Stop Watch"
    return gets.chomp.to_i
end

def valid_choice?(choice)
    [1,2,3].include?(choice)
end

def valid_duration?(duration)
    duration.is_a?(Integer)
end

def run_timer
    duration = ''
    choice = ''

    until valid_duration?(duration)
        print "Enter a duration (in minutes): "
        duration = gets.chomp.to_i
    end

    until choice == 'Y' || choice == 'N' 
        puts "Would you like to set a custom message for when the time is up? (y/n):"
        choice = gets.chomp.upcase
    end

    case choice
    when 'Y'
        print "Enter your message: "
        msg = gets.chomp
        t = Timer.new(duration, msg)
        t.run
    when 'N'
        t = Timer.new(duration)
        t.run
    end
end

def run_pair_timer
    choice = ''

    until choice == 'Y' || choice == 'N'
        puts "Would you like to enter a custom message telling you when to switch? (y/n):"
        choice = gets.chomp.upcase
    end

    case choice
    when 'Y'
        print "Enter your message: "
        msg = gets.chomp
        pt = Timer.new(msg)
        pt.run
    when 'N'
        pt = Timer.new
        pt.run
    end
end

def run_stopwatch
    s = StopWatch.new
    s.run
end

if __FILE__ == $PROGRAM_NAME
    choice = ''

    until valid_choice?(choice)
        choice = get_choice
    end

    run_timer if choice == 1
    run_pair_timer if choice == 2
    run_stopwatch if choice == 3
end