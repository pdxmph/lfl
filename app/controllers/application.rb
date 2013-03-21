Lfl.controllers :application do
# Once we have more than one library:
#  get :index, :map => "/" do
#    @libraries = Library.all
#    render 'application/index'
#  end

# While it's just us:
  get :index, :map => "/" do 
    @library = Library.find(1)
    @books = @library.books.find(:all, :order => "title ASC", :conditions => ['in_stock = ?',true])
    render 'libraries/inventory'
  end

  get :about, :map => "/about" do
    render 'application/about'
  end

  get :contact, :map => "/contact" do
    render 'application/contact'
  end

  get :map, :map => "/map" do
    render 'application/map'
  end

  get :plans, :map => "/plans" do
    render 'application/plans'
  end


end
