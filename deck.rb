require 'pry'
require_relative 'card'
class Deck

  attr_reader :total

  def initialize(deck_name)
    @deck_name = deck_name
    @cards = create_cards
    @question_counter = 0
    @total = @cards.length
  end

  def next_question
    if @question_counter >= @cards.length
      return nil
    else
      question = @cards[@question_counter].question
      @question_counter += 1
      question
    end
  end

  def process_answer(input)
    # p input
    # p @cards[@question_counter].answer
    @cards[@question_counter - 1].user_answer << input
    if input == (@cards[@question_counter - 1].answer)
      @cards[@question_counter - 1].answered_correctly = true
      return true
    end
    false
  end

  def create_cards
    array_to_pass = []
    data_array = parse_text
    data_array.each_with_index do |line, idx|
      if line.length == 0
        array_to_pass << Card.new(data_array[idx-2], data_array[idx-1])
      end
    end
    array_to_pass
  end

  def correct
    num_correct = 0
    @cards.each do |card|
      if card.answered_correctly == true
        num_correct += 1
      end
    end
    num_correct
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

