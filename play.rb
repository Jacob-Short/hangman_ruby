class Hangman


    def initialize
        @word = words.sample
        @lives = 7
        @word_teaser = ""

        @word.first.size.times do
            @word_teaser += "_ "
        end
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


    def print_teaser last_guess = nil

        update_teaser(last_guess) unless last_guess.nil?

        puts @word_teaser
    end


    def update_teaser last_guess
        new_teaser = @word_teaser.split
       
        new_teaser.each_with_index do |letter, index|
            # replace blank values with guessed letter
            # if matches letter in word
            if letter == '_' && @word.first[index] == last_guess
                new_teaser[index] = last_guess
            end
        end

        @word_teaser = new_teaser.join(' ')

    end



    def make_guess
        if @lives > 0
            puts "Enter a letter"
            guess = gets.chomp

            good_guess = @word.first.include? guess

            if guess == "exit"
                puts "Thank you for playing!"
            elsif good_guess
                puts "You are correct!"

                print_teaser guess

                if @word.first == @word_teaser.split.join()
                    puts "Congradulations!You have won this round!"
                else
                    make_guess
                end
            
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
        puts "To exit the game at any point -> Type 'exit'"
        print_teaser
        puts "Clue is: #{ @word.last }"

        make_guess
    end

end

game = Hangman.new
game.begin
