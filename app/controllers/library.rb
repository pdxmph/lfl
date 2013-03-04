Lfl.controllers :library do

  get :index, :with => :id do
    @library =Library.find(params[:id])
    @books = @library.books.find(:all, :order => "title ASC", :conditions => ["in_stock = ?",1])
    render 'libraries/inventory'
  end

  get :index do 
    @libraries = Library.all
    render 'libraries/index'
  end

end
