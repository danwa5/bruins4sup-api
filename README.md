# README

## Development

### Dependencies

* Bundler 1.16.0
* Ruby 2.3.5

### Initialization

```shell
$ gem install bundler
$ bundle check || bundle install
```

### Twitter Configuration

* Register your app on https://apps.twitter.com
* Generate your consumer key and secret
* Set your TWITTER_API_KEY and TWITTER_API_SECRET environment variables

### Run Test Suite

```shell
$ COVERAGE=true rspec ./spec
$ open coverage/index.html
```
