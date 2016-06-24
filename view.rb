class View
 def get_user_input
   gets.chomp.downcase
 end
 def user_helper
 puts "User Help"
 puts "="*20
 puts "Type the name of the deck as an argument to start thet game\n"
 end
 def print_question(question)
   puts question
 end

def check_answer(answer)
	if answer == true
		correct
	else
		incorrect
	end
end

 def correct
   puts "you got the correct answer\n"
 end

 def incorrect
   puts "you got the wrong answer\n"
 end

 def final_results(right, total)
   puts "You got #{right} out of #{total}"
 end


end
