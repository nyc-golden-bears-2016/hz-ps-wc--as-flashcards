require_relative 'controller'

flashcards = Controller.new(ARGV[0])

flashcards.prompt_questions
flashcards.get_final_results
