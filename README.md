# RDecorator
[![Build Status](https://travis-ci.org/falm/rdecorator.svg?branch=master)](https://travis-ci.org/falm/rdecorator) 

Rdecorator is an Pyhton like decorator use for AOP pattern programming


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rdecorator', github: 'https://github.com/falm/rdecorator.git'
```

And then execute:

    $ bundle

## Usage

### Basic
```ruby
class Language
		extend Rdecorator

		def best(this, args)
				'best Language' + this.call(args)	
		end

		wrap :best
		def ruby
				'ruby'	
		end
end

Language.new.ruby #=> best Language ruby

```

### Decorator Class
```ruby
class Decorator 

	include Rdecorator

	def call
		'say fucking' + @this.call(*@args)
	end
end

class DummyClass

	decorator Decorator
	def say(hello)
				'hello'	
	end

end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/falm/rdecorator.
