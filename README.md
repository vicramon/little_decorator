# Interior Decorator

[![Code Climate](https://codeclimate.com/github/vicramon/interior_decorator.png)](https://codeclimate.com/github/vicramon/interior_decorator)

Ultra-lightweight decorator for Rails models. Only 42 actionable lines of code!

## Installation

Include it in your Gemfile.

```
gem 'interior_decorator'
```

## Usage

### Create Your Decorator

Add your decorator in `app/decorators`:

```ruby
# app/decorators/user_decorator.rb
class UserDecorator < InteriorDecorator

  def full_name
    "#{first_name} #{last_name}"
  end

  def updated_at
    model.updated_at.strftime("%A, %B %e, %Y")
  end

end
```

Method calls are sent to the model via `method_missing`, so you can call model methods directly as in the `full_name` method defined above.

If there's going to be a method name collision then call model methods with `model.`.

You can access helper methods with `helper.`, or `h.` for short.

### Decorate Your Objects

#### In Controllers

Call `decorate` on the decorator:

```ruby
decorated_user = UserDecorator.decorate(user)
```

#### In Views

Call the decorate helper, or `d` for short:

```erb
<%= decorate(user) %>
```

#### On Collections

Call decorate the same way. You'll get an array of decorated objects.

```ruby
decorated_users = UserDecorator.decorate(users)
```

```erb
<%= decorate(users) %>
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

Pull requests are welcome, but I want to keep this gem simple.
