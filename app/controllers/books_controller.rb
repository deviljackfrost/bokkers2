class BooksController < ApplicationController
 def new
    @book = Book.new
  end


  def show
    @user = User.all
    @book = Book.find(params[:id])
    @books = Book.page(params[:page])
  rescue ActiveRecord::RecordNotFound
  flash[:alert] = "Book not found"
  redirect_to user_path
  end

   def index
    @booker = current_user
    @book = Book.new
    @books = Book.page(params[:page])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    flash[:notice] = "投稿を削除しました"
    redirect_to books_path
  end

  def update
     @book = Book.find(params[:id])
  if @book.update(book_params)
    redirect_to books_path
    flash[:notice] = "プロフィール編集に成功しました"
  else
    render books_path
  end
 end

  def edit
    @book = Book.find(params[:id])  
  end

  def create
    @book = current_user.books.build(book_params)
    @books= Book.all
   if @book.save
    redirect_to books_path
    flash[:notice] = "投稿に成功しました"
   else
    @books = Book.page(params[:page])
    flash[:notice] = '投稿に失敗しました'
    render :index
   end
  end
  
  
    private
      
   def user_params
    params.permit(:id, :image)
   end
    

  def book_params
    params.require(:book).permit(:title, :caption, :id, :user_id)
  end
end
