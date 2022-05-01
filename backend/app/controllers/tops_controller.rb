class TopsController < ApplicationController
  def show
    # cdbinding.pry
    @user = User.find(1)
    #@flag = Flag.find(1)
  end

end
