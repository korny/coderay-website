class RaysController < ApplicationController
  
  before_filter :get_ray, :only => [:show, :expand, :edit, :update, :destroy]
  
  def index
    @rays = Ray.paginate :include => :language, :per_page => 10, :page => params[:page], :order => 'created_at DESC'
  end
  
  def show
  end
  
  def expand
    render :layout => false
  end
  
  def new
    @ray = Ray.new
  end
  
  def create
    @ray = Ray.new params[:ray]
    if @ray.save
      flash[:success] = 'Ray was successfully created.'
      redirect_to @ray
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @ray.update_attributes(params[:ray])
      flash[:success] = 'Ray was successfully updated.'
      redirect_to @ray
    else
      render :edit
    end
  end
  
  def destroy
    @ray.destroy
    flash[:notice] = 'Ray was deleted.'
    redirect_to Ray
  end
  
protected
  
  def get_ray
    @ray = Ray.find params[:id]
  end
  
end
