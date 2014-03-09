## Interior Decorator

Ultra-lightweight decorator for Rails models. Because decorators should be simple.

## Installation

Include it in your Gemfile.

```
gem 'interior_decorator'
```

## Usage

### Create Your Decorator

Add your decorator in `app/decorators`:

```ruby
class UserDecorator < InteriorDecorator

  def updated_at
    model.updated_at.strftime("%A, %B %e, %Y")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
```

Use `model` to get at the model as in the `updated_at` method above, or if you're not worried about a name collision you can just omit it, as in `full_name`.

Interior Decorator sends any methods it doesn't find to the actual model, so there's not need to specify what to delegate.

### Decorate Your Objects

Use the `decorate` helper method in your views to get the decorated object:

```
<%= decorate(user).updated_at %>
```

If you need a decorated object in a controller then do:

```
decorated_user = UserDecorator.decorate(user)
```

Call `decorate` on a collection to get an arary of decorated objects. It just checks to see if the item you pass it is enumerable.

```
decorated_users = UserDecorator.decorate(users)
```

## Vim Projections

For use with Rails.vim. Place in `config/projections.json`.

```json
{
  "app/decorators/*_decorator.rb": {
    "command": "decorator",
    "alternate": "spec/decorators/%s_decorator_spec.rb",
    "template": "class %SDecorator < InteriorDecorator\nend"
  }
}
```

## Contribute

Pull requests are welcome, but let's keep this thing simple.
