require_relative 'view'
require_relative 'deck'

class Controller
	class NoDeckError < StandardError
	end

	def initialize(file_name)
		@view = View.new
		if ARGV.length == 0
			@view.user_helper
			raise NoDeckError
		else
			@deck = Deck.new(file_name)
		end
	end

	def prompt_questions
		loop do
			question = get_next_question
			break if !(question)
			show_question(question)
			report_answer
		end
	end

	def get_final_results
		correct = @deck.correct
		total = @deck.total
		@view.final_results(correct, total)
	end

	private

	def get_next_question
		@deck.next_question
	end

	def show_question(question)
		@view.print_question(question)
	end

	def report_answer
		# todo: update with proper Deck method
		# puts "hello"
		input = STDIN.gets.chomp
		# puts "in here"
		@view.check_answer(@deck.process_answer(input))
	end
end
