class BooksController < ApplicationController

 def show
    @book = Book.find(params[:id])
  end

  def new
  	authorize! :index, :book, :message => 'Access limited to administrators only.'
    @book = Book.new(params[:id])
  end

  def edit
    authorize! :index, :book, :message => 'Access limited to administrators only.'
    @book = Book.find(params[:id])
  end

  def update
    authorize! :index, :book, :message => 'Access limited to administrators only.'
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      flash[:success] = "Book updated"
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, :book, :message => 'Access limited to administrators only.'
    @book = Book.new(params[:book])
    if @book.save
      redirect_to books_path
    else
      render 'new'
    end    
  end

  def index
    authorize! :index, :book, :message => 'Access limited to administrators only.'
  	@books = Book.all
  end

  def destroy
    authorize! :index, :book, :message => 'Access limited to administrators only.'
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, :notice => "Book deleted!"
  end

end
