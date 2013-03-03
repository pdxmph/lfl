Lfl.controllers :library do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :index, :with => :id do
    @library =Library.find(params[:id])
    @books = @library.books
    render 'libraries/inventory'
  end

  get :index do 
    @libraries = Library.all
    render 'libraries/index'
  end

end
