# Visualize dependencies with graphviz

## Setup

    $ bundle install

## Usage

Put your dependencies into `deps.yml` in a key value format, like:

```
user:
  - product
  - order
order:
  - product
  - orderitem
```

Run command:

    $ ruby build.rb
