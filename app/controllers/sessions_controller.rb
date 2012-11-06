class SessionsController < ApplicationController
  def new
  end

  def create
    user = Cliente.find_by_email(params[:session][:email].downcase)
    if user && (user.senha == params[:session][:senha])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
