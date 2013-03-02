Admin.controllers :books do

  get :index do
    @books = Book.all
    render 'books/index'
  end

  get :new do
    @book = Book.new
    @libraries = Library.all
    render 'books/new'
  end

  post :create do
    @book = Book.new(params[:book])
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect url(:books, :edit, :id => @book.id)
    else
      render 'books/new'
    end
  end

  get :edit, :with => :id do
    @book = Book.find(params[:id])
    render 'books/edit'
  end

  put :update, :with => :id do
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      flash[:notice] = 'Book was successfully updated.'
      redirect url(:books, :edit, :id => @book.id)
    else
      render 'books/edit'
    end
  end

  delete :destroy, :with => :id do
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = 'Book was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Book!'
    end
    redirect url(:books, :index)
  end
end
