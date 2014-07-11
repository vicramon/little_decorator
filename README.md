[![Gem Version](https://badge.fury.io/rb/little_decorator.svg)](http://badge.fury.io/rb/little_decorator)
[![Code Climate](http://img.shields.io/codeclimate/github/kabisaict/flow.svg)](https://codeclimate.com/github/vicramon/little_decorator)
[![Travis CI](https://travis-ci.org/vicramon/little_decorator.svg?branch=master)](https://travis-ci.org/vicramon/little_decorator)

![LittleDecorator: a rails model decorator. A cute husky with sunglasses proclaims his surprise at how small this gem is.](http://i.imgur.com/e0YvqjJ.png)

Ultra lightweight decorator for Rails models. LittleDecorator has just **42** actionable lines of code.

## Installation

Include it in your Gemfile.

```
gem 'little_decorator'
```

## Usage

### Create Your Decorator

Add your decorator in `app/decorators`:

```ruby
# app/decorators/user_decorator.rb
class UserDecorator < LittleDecorator

  def full_name
    "#{first_name} #{last_name}"
  end

  def updated_at
    model.updated_at.strftime("%A, %B %e, %Y")
  end

end
```

Method calls are sent to the model via `method_missing`, so you can call model methods directly as in the `full_name` method defined above.

Call model methods with `model` when you want to override a method but still get to the original model.

You can access helper methods and route helpers in your decorators.

### Decorate Your Objects

You can call `decorate` on an object or a collection in both controllers and views. Examples below.

#### In Controllers

Just call `decorate`:

```ruby
decorate(user)
```

#### In Views

Just call `decorate`:

```erb
<%= decorate(user) %>
```

#### On Collections

Just call `decorate`. You'll get an array of decorated objects

```ruby
decorate(users)
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
    "template": "class %SDecorator < LittleDecorator\nend"
  }
}
```

## Contribute

Pull requests are welcome, but I want to keep this gem simple.
