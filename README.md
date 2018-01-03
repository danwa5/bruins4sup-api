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
* Set your `TWITTER_API_KEY` and `TWITTER_API_SECRET` environment variables

### Twitter Authentication

* Sign in to https://apps.twitter.com
* Set the callback URL for your app
* On your app navigate to `/auth/twitter/callback?screen_name=YOUR_TWITTER_HANDLE`

### Run Test Suite

```shell
$ COVERAGE=true rspec ./spec
$ open coverage/index.html
```
