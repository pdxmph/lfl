Lfl.controllers :application do
  get :index, :map => "/" do
    @libraries = Library.all
    render 'application/index'
  end

end
