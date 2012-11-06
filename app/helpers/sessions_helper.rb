module SessionsHelper

  def sign_in(cliente)
    cookies.permanent[:remember_token] = cliente.remember_token
    self.current_user = cliente
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(cliente)
    @current_user = cliente
  end

  def current_user
    @current_user ||= Cliente.find_by_remember_token(cookies[:remember_token])
  end

  def current_user?(cliente)
    cliente == current_user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
    puts "Singed out"
  end
  end