class BookController < ApplicationController
   def new
    @book = Books.new
    respond_to do |format|
      format.html # addbook.html.erb
      format.json { render :json => @book }
    end
  end
  
  def index
    #  if session[:student].nil?
    #    flash[:notice]="session expired"
    #    redirect_to :action=>'login' and return
    @book = Books.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json =>@book}
    end
  end

  
  def create
  
    @book = Books.new(params[:books])
    respond_to do |format|
      if @book.save
        format.html { redirect_to  @book, :notice => 'Book was successfully added.' }
        format.json { render :json => @book, :status => :created, :location =>  showbook_student_path(@book) }
      else
        format.html { render :action => "addbook" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end
  
 def destroy
    @book = Books.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to book_index_url }
      format.json { head :no_content }
    end
  end 
  
  def show
    @book = Books.find(params[:id])
    respond_to do |format|
      format.html # showbook.html.erb
      format.json { render :json => @book }
    end
  end
end
