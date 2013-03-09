Admin.controllers :libraries do

  get :index do
    @libraries = Library.all
    render 'libraries/index'
  end

  get '/:id/inventory_sheet' do
    @library =Library.find(params[:id])
    @books = @library.books.find(:all, :order => "title ASC", :conditions => ["in_stock = ?",1])
    render 'libraries/inventory_sheet', :layout => 'simple'
  end


  get :new do
    @library = Library.new
    render 'libraries/new'
  end

  post :create do
    @library = Library.new(params[:library])
    if @library.save
      flash[:notice] = 'Library was successfully created.'
      redirect url(:libraries, :edit, :id => @library.id)
    else
      render 'libraries/new'
    end
  end

  get :edit, :with => :id do
    @library = Library.find(params[:id])
    render 'libraries/edit'
  end

  put :update, :with => :id do
    @library = Library.find(params[:id])
    if @library.update_attributes(params[:library])
      flash[:notice] = 'Library was successfully updated.'
      redirect url(:libraries, :edit, :id => @library.id)
    else
      render 'libraries/edit'
    end
  end

  delete :destroy, :with => :id do
    library = Library.find(params[:id])
    if library.destroy
      flash[:notice] = 'Library was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Library!'
    end
    redirect url(:libraries, :index)
  end
end
