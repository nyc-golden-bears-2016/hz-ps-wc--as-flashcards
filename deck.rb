require 'pry'
class Card

  attr_reader :question, :answer
  attr_accessor :answered_correctly, :user_answer

  def initialize(question, answer)
    @question = question
    @answer = answer
    @answered_correctly = false
    @user_answer = ''
  end

end

class Deck

  def initialize(deck_name)
    @deck_name = deck_name
    @cards = create_cards
  end

  def print_cards
    @cards.each do |card|
      puts card.question
      puts card.answer
      puts "---------"
    end
  end


  def create_cards
    array_to_pass = []
    data_array = parse_text
    data_array.each_with_index do |line, idx|
      if line.length == 0
        array_to_pass << Card.new(data_array[idx-2], data_array   [idx-1])
      end
    end
    array_to_pass
  end

  def parse_text
    data_array = IO.readlines(@deck_name)
    data_array << ''
    data_array.map! do |line|
      line.strip
    end
    data_array
  end
end



deck = Deck.new('nighthawk_flashcard_data.txt')


deck.print_cards
