module QuizzesHelper

# GET /quizzes or /quizzes.json
  def index
    @quizzes = Quiz.all
  end
end
