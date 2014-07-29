class UsersController < ApplicationConroller

  def show
    decorate(User.new)
    render nothing: true
  end

  def missing
    decorate([])
    render nothing: true
  end

  def nils
    decorate(nil)
    render nothing: true
  end

end
