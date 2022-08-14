# 6 guesses

module Hangman
  class Player
    def initialize

    end

    def guess_letter
      puts "Input your guess: "
      guess = gets.chomp.downcase
    end
  end

  class Game
    def initialize
      @player = Player.new
    end

    def play
      # randomly selects a word
      answer = select_random_word
      p answer # used for testing, get rid after
      answer = answer.split('')
      display = Array.new(answer.length, '_')
      letters_guessed = Array.new
      guesses_left = 6
      while guesses_left > 0
        # display the display first
        print_array(display)
        # print out which letters have been guessed
        print_array(letters_guessed)
        loop do
          player_guess = @player.guess_letter
          if valid_guess?(player_guess, letters_guessed)
            letters_guessed.push(player_guess)
            # if correct guess
            if correct_guess?(player_guess, answer)
              # put correct letter into display
              answer.each_with_index do |letter, index|
                display[index] = letter if letter == player_guess
              end
            else
              puts "Sorry, #{player_guess} is not in the word."
            end
            break
          end
          puts "Sorry, that was an invalid input."
          puts "Please type in a letter that has not been guessed before."
        end
        # check the letter in the guess is in the array

        # break if word is guessed correctly
        break if display == answer
        guesses_left -= 1
      end

      if guesses_left == 0
        # game is lost
      else
        # game is won
      end
    end

    private

    def select_random_word
      words = File.readlines('google-10000-english-no-swears.txt')

      filtered_words = Array.new
      
      words.each_with_index do |word, index|
        word.strip!
        if word.length >= 5 && word.length <= 12
          filtered_words.push(word)
        end
      end
      # do File.close  ?
      filtered_words.sample
    end

    def print_array(array)
      array = array.join(' ')
      puts array
    end


    def valid_guess?(guess, letters_guessed)
      # false if guess.length != 1
      return false if guess.length != 1
      return false unless guess.match?(/[[:alpha:]]/)
      return false if letters_guessed.include? guess
      true
    end

    def correct_guess?(guess, answer)
      return true if answer.include? guess
      false
    end
  end
end

include Hangman

game = Game.new
game.play