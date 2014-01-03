class QuizzesController < ApplicationController
  before_filter :authenticate_person!

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
  	authorize! :index, :quiz, :message => 'Access limited to administrators only.'
    @quiz = Quiz.new(params[:id])
  end

  def create
    authorize! :index, :quiz, :message => 'Access limited to administrators only.'
    @quiz = Quiz.new(params[:quiz])
    if @quiz.save
      redirect_to quizzes_path
    else
      render 'new'
    end    
  end

  def check
    @user = current_user
    @subscriber = current_subscriber
    @quiz = Quiz.find(params[:quiz_id])
    @lesson = @quiz.lesson
    
    @question_numbers = []
    @quiz.questions.each do |question|
      @question_numbers << question.id
    end

    @correct_answers = []
    @quiz.questions.each do |question|
      @correct_answers << question.correct_answer
    end

    @answers = params[:answer]

    if @answers == nil
      redirect_to quiz_path(@quiz), :message => "Please answer all the questions!"
    elsif @answers.count < @quiz.questions.count
      redirect_to quiz_path(@quiz), :message => "Please answer all the questions!"
    else
    end

    @possible = @question_numbers.count
    @score = 0

  end

  def edit
    authorize! :index, :quiz, :message => 'Access limited to administrators only.'
    @quiz = Quiz.find(params[:id])
  end

  def update
    authorize! :index, :quiz, :message => 'Access limited to administrators only.'
    @quiz = Quiz.find(params[:id])
    if @quiz.update_attributes(params[:quiz])
      flash[:success] = "Quiz updated"
      redirect_to quizzes_path
    else
      render 'edit'
    end
  end

  def index
  	authorize! :index, :quiz, :message => 'Access limited to administrators only.'
    @quizzes = Quiz.all
  end

  def destroy
    authorize! :index, :quiz, :message => 'Access limited to administrators only.'
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to quizzes_path, :notice => "Quiz deleted!"
  end

end
