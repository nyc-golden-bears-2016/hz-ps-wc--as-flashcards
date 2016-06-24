class Controller
	def initialize(file_name)
		@deck = Deck.new(file_name)
		@view = View.new
		create_deck(file_name)
	end

	def prompt_questions
		loop do
			question == get_next_question
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

	def show_question
		@view.print_question(get_next_question)
	end

	def report_answer
		# todo: update with proper Deck method
		input = @view.get_user_input
		@view.check_answer(deck.process_answer(input))
	end
end