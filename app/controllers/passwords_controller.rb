class PasswordsController < ApplicationController
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
    @password = Password.find(params[:id])  
  end

end
