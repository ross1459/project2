class UsersController < ApplicationController
  def index
    @users = Users.all
  end

end
