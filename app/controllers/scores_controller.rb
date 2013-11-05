class ScoresController < ApplicationController

  def show
    authorize! :view, :score, :message => 'Access limited to teachers only.'
    @score = Score.find(params[:id])
  end

  def new
    @score = Score.new(params[:score])
    @lesson = @score.quiz.lesson
      redirect_to lesson_path(@lesson)
  end

  def create
    @score = Score.new(params[:score])
    @lesson = @score.quiz.lesson
    if @score.save
      redirect_to lesson_path(@lesson)
    else
      render 'new'
    end    
  end

  def edit
    authorize! :index, :score, :message => 'Access limited to administrators only.'
    @score = Score.find(params[:id])
  end

  def update
    authorize! :index, :score, :message => 'Access limited to administrators only.'
    @score = Score.find(params[:id])
    if @score.update_attributes(params[:score])
      flash[:success] = "Score updated"
      redirect_to scores_path
    else
      render 'edit'
    end
  end

  def index
    @scores = Score.all
  end

  def destroy
    authorize! :index, :score, :message => 'Access limited to administrators only.'
    @score = Score.find(params[:id])
    @score.destroy
    redirect_to scores_path, :notice => "Score deleted!"
  end

end
