class UsersController < ApplicationController
  
  def show
    @nickname = current_user.nickname
    @stands = current_user.stands
  end
end
