class UserController < ApplicationController
  def show
    @users = User.all
    @book = Book.find(params[:name])
    @books = Book.page(params[:page])
  rescue ActiveRecord::RecordNotFound
  flash[:alert] = "Book not found"
  end
  
  def index
    @user = User.all
    @book = Book.new
    @books = Book.page(params[:page])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to books_path(current_user)
     flash[:notice] = "プロフィール編集に成功しました"
  else
    flash[:notice] = "プロフィール編集に失敗しました"
    @users = User.all
    render :show
  end 
end

  def edit
    @user = User.find(params[:id])
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
  params.require(:user).permit(:name, :introduction, :email, :image)
end
  
  
end
