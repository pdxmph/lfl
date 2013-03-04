Lfl.controllers :application do
  get :index, :map => "/" do
    @libraries = Library.all
    render 'application/index'
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
end
