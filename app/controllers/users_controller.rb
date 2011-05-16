class UsersController < ApplicationController
  def new
    @user = User.new()     
  end

  def create
	  @user=User.new(params[:user])
    if @user.save
      redirect_to {:action=>:main,:controller=>:main} 
    else
      puts @user.errors.full_messages
    end
  end
end
