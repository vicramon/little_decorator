class UsersController < ApplicationConroller

  def show
    decorate(User.new)
    render nothing: true
  end

end
