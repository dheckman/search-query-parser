## Search Query Parser

The goal is to complete this class, make the tests pass and write some additional tests to provide full test coverage for your solution. Try to make your solution as optimized as possible and be prepared to talk about the space and time complexity of your solution. 

### What does this class do?

This class provides two methods:

1. `text` which returns the text-part of the given string
2. `tags` which returns the tag-part of the given string

We've provided two example tests to help you understand what this does. For example:

```ruby
parser = SearchQueryParser.new('monkey banana fun-time')
parser.text = 'monkey banana fun-time'
parser.tags = []
```

Another example:
'
```ruby
parser = SearchQueryParser.new("tag:'monkey' tag:'banana fun-time'")
parser.text = ''
parser.tags = ['monkey', 'banana fun-time']
```

A final example:

```ruby
parser = SearchQueryParser.new("tag:'monkey' tag:'monkey business' monkey")
parser.text = 'monkey'
parser.tags = ['monkey', 'monkey business']
```

Some things to note:

* A user can pass in any number of strings, and/or tags
* There can be 0..n 'tags'
* There can be 0..n 'strings'
* There can be 0..n spaces in a tag

### How to run

```
$ rspec search_query_parser.rb
```

### Dependencies

The only dependency of this project is the rspec test framework. Use bundler to install this dependency.

```
$ gem install bundler
$ bundle install
```
