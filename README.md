# RDecorator

Rdecorator is an Pyhton like decorator use for AOP pattern programming

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rdecorator', github: 'https://github.com/falm/rdecorator.git'
```

And then execute:

    $ bundle

## Usage

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


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/falm/rdecorator.
