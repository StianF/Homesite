class EmploymentsController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @employments = Employment.all
  end

  def show
    @employment = Employment.find(params[:id])
  end

  def new
    @employment = Employment.new
  end

  def create
    @employment = Employment.new(params[:employment])
    if @employment.save
      redirect_to @employment, :notice => "Successfully created employment."
    else
      render :action => 'new'
    end
  end

  def edit
    @employment = Employment.find(params[:id])
  end

  def update
    @employment = Employment.find(params[:id])
    if @employment.update_attributes(params[:employment])
      redirect_to @employment, :notice  => "Successfully updated employment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @employment = Employment.find(params[:id])
    @employment.destroy
    redirect_to employments_url, :notice => "Successfully destroyed employment."
  end
end
