# Chains

## Requiring Chains

Chains can be used by simply requiring it, and calling `chain` and `with` methods:

```ruby
require 'chains'
```

`chain` applies the operations in the block to the object, returning the result of the last expression:

```ruby
str = 'Hello'
Chains::chain(str, -> {
  concat(' World')
  length
})
# => 11
```

`with` applies the operations in the block to the object, and returns the object:

```ruby
str = 'Hello'
Chains::with(str, -> {
  concat(' World')
  length
})
# => 'Hello World'
```


## Including Chains

Chains can be included into a class to add the `chain` and `with` methods to the object.

```ruby
require 'chains'

class SuperString < String
  include Chains
end
```

Then:

```ruby
obj = SuperString.new
obj.chain(-> {
  concat(' World')
  length
})
# => 11
```

```ruby
obj = SuperString.new
obj.with(-> {
  concat(' World')
  length
})
# => 'Hello World'
```
