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
			question = @deck.next_question
			break if !(question)
			show_question(question.question)
			report_answer(question)
		end
	end

	def get_final_results
		correct = @deck.correct
		total = @deck.total
		@view.final_results(correct, total)
	end

	private

	def show_question(question)
		@view.print_question(question)
	end

	def report_answer(question)
		input = @view.get_user_input
		if @deck.process_answer(question, input)
			@view.correct
		else
			@view.incorrect
		end
	end
end
