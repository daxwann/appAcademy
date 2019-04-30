# Building ActiveRecordLite

In this project, we build our own lite version of ActiveRecord.

## Learning Goals

- Know when to write class methods and when to write instance methods
- Know how to use `define_method` inside a class method to add instance methods
- Be able to create a generic SQLObject class that abstracts table-specific logic away
- Understand how ActiveRecord interfaces with the database
- Be able to write generic query methods that any class inheriting from SQLObject can use (e.g., all, where)
- Understand how `belongs_to` and `has_many` work in Rails
- Be able to metaprogram new methods
- Be able to write association methods that use joins (i.e. `has_many_through`)
- Know when to write code in a module versus a new class
