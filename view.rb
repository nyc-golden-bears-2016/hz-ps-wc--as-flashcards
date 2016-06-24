class View
 def get_user_input
   STDIN.gets.chomp.downcase
 end
 def user_helper
 puts "User Help"
 puts "="*20
 puts "Type the name of the deck as an argument to start that game\n"
 end
 def print_question(question)
   puts question
 end

 def correct
   puts "Correct!\n\n"
 end

 def incorrect
   puts "Incorrect!\n\n"
 end

 def final_results(right, total)
   puts "You answered #{right} out of #{total} correctly."
 end


end
