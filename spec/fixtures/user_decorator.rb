class UserDecorator < InteriorDecorator

  def full_name
    "#{first_name} #{last_name}"
  end

  def favorite_food
    'pie'
  end

  def likes_to_bake
    model.favorite_food
  end

end
