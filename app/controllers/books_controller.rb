class BooksController < ApplicationController
  def new
  end

  def index
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new
    @books = Book.all
    
  end
  
  def create
    flash[:hoge] = "Book was successfully created."
    # 1.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # 4. 画面へリダイレクト
    redirect_to book_path(@book.id)
  else
    @books = Book.all
    render :index
  end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    flash[:hoge] = "Book was successfully updated."
  else
    @books = Book.all
    render :edit
  end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
