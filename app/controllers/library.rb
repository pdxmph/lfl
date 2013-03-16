Lfl.controllers :library do

  get :index, :provides => [:html, :atom], :with => :id do
    @library =Library.find(params[:id])
    @books = @library.books.find(:all, :order => "title ASC", :conditions => ["in_stock = ?",true])
    render 'libraries/inventory'
  end

  get '/:id/inventory_sheet' do
    @library =Library.find(params[:id])
    @books = @library.books.find(:all, :order => "title ASC", :conditions => ["in_stock = ?",true])
    render 'libraries/inventory_sheet', :layout => 'simple'
  end


  get '/:id/feed' do
    @library = Library.find(params[:id])
    @books = @library.books.find(:all, :order => "created_at DESC", :conditions => ["in_stock =?",true])
    render 'libraries/atom'
  end

  get :index do 
    @libraries = Library.all
    render 'libraries/index'
  end

end
