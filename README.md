# **UNITS**

## Description

A "measurement" class, `Measurement`, that allows a user to work with units of measurement easier.

Also, a project for me to learn/practice/refine my OOP knowledge, through Ruby.

## Triggers

1. A new instance of the `Measurement` class is instantiated with 2 arguments: a numerical _value_ and a _unit_ of class `String`.

2. User calls a class or instance method of `Measurement`.

## Actors

1. The `Measurement` caller.

2. The `Measurement` class itself.

3. Any instances of `Measurement`

4. A map of unit types to reference

## Preconditions

1. Instances of `Measurement` are instantiated with a `Float` _value_ and a _unit_ `String`.

2. A base unit must exist in a corresponding array of unit values ('meter' for length & 'second' for time).

## Goals

1. Can do unit conversions (on units of the same type).

2. Can add to or subtract from `Measurement` instances with another `Measurement` instance, or a hard-coded measurement value, even if unit values don't match-up.

```ruby
m1 = Measurement.new(1, 'm')
m2 = Measurement.new(4, 'm')

m1.add(m2) # => "5m"
m1.add([200, "cm"]) # => "3m"||"300cm"
```

## Not Available

1. Creating a new instance of `Measurement` fails if the _value_ can't be coerced to a comparable `Float` or if the _unit_ is not a `String`.

2. Conversions fail if trying to convert to a different unit type.

3. Addition / subtraction fails if both measurements are not the same type.

## Steps of Execution

1. `Measurement.new` is called with a _value_ & _unit_.

2. During creation, _unit_ is found in a `unit_list` of unit values of the same unit type.

3. Instances of `Measurement` can call `convert` to convert it's _value_ into a _unit_ of the same type, found in the `unit_list`.

4. Instances of `Measurement` can call `add` to add/subtract a _unit_ of the same type from it's _value_
