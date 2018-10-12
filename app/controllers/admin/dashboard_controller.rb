class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['HTTP_BASIC_AUTH_NAME'], password: ENV['HTTP_BASIC_AUTH_PASS']

  def index
   render plain: "Everyone can see me!"
  end

  def edit
   render plain: "I'm only accessible if you know the password"
  end

  def show
  end
end
