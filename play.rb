class Hangman


    def initialize
        # create a aplhabet array
        @letters = ('a'..'z').to_a
        @word = words.sample
        @lives = 7
    end


    def words
        [
            ['raelynn', 'The person who I loved most'],
            ['bed', 'Something people sleep on'],
            ['police', 'The people who protect and serve'],
            ['doctor', 'Someone who takes care of sick people'],
            ['car', 'A vehicle with 4 wheels that we drive on streets '],
            ['python', 'The best programming langauge'],
            ['bike', 'Something with 2 wheels that people ride around parks'],
        ]
    end


    def print_teaser
        word_teaser = ""

        @word.first.size.times do
            word_teaser += "_ "
        end

        puts word_teaser
    end


    def make_guess
        if @lives > 0
            puts "Enter a letter"
            guess = gets.chomp

            good_guess = @word.first.include? guess

            if good_guess
                puts "Good Guess!"
            else
                @lives -= 1
                puts "Sorry your guess was incorrect. You have #{ @lives } lives left. Try again."
                make_guess
            end
        else
            puts "You are out of lives! Game Over!"
        end
    end


    def begin
        
        puts "New gamed started...your word is #{ @word.first.size } characters long"
        print_teaser
        puts "Clue is: #{ @word.last }"

        make_guess
    end

end

game = Hangman.new
game.begin
