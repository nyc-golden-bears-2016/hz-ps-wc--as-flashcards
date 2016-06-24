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
