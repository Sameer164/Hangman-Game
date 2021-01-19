class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  
  def self.random_word
      return DICTIONARY.sample
  end
  
  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) { '_' }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end 

  def guess_word
    return @guess_word
  end

  def attempted_chars
    return @attempted_chars
  end

  def remaining_incorrect_guesses
    return @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    return @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
     indices = []
     @secret_word.each_char.with_index do |c, index|
      if char == c
        indices << index
      end
    end
    return indices
  end

  def fill_indices(char, indices)
      indices.each do |number|
        @guess_word[number] = char
      end
  end

  def try_guess(char)
    if already_attempted?(char)
      puts 'that has already been attempted'
      return false
    else
      if get_matching_indices(char).length == 0
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, get_matching_indices(char))
      end
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
      puts 'Enter a char:'
      input = gets.chomp
      return try_guess(input)

  end

  def win?
     if @guess_word.join('') == @secret_word
      puts 'WIN'
      return true
     else
      return false
     end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
  end

end
