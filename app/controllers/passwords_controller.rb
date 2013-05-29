class PasswordsController < ApplicationController
  
  before_filter :find_password, :only => [:show, :edit, :update]

  def index
    @passwords = Password.all  
  end

  def new
    @password = Password.new  
  end

  def create
    @password = Password.new(params[:password])
    if @password.save
      redirect_to @password, 
        :notice => "Password was successfully created."
    else
      flash[:alert] = "Password has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @password.update_attributes(params[:password])
      redirect_to @password, :notice => "Password has been updated."
    else
      flash[:notice] = "Password has not been updated."
      render :action => "edit"
    end
  end

  private
    def find_password
      @password = Password.find(params[:id])  
    end
end
