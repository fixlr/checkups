# Checkups

Check status APIs and notify someone when changes occur.

## Setup

1. Clone this repo
2. Install ruby
3. Install bundler
4. bundle install

### Announcers

Configured by setting the `ANNOUNCER` environment variable.

* **Stdout** (default): logs all messages to STDOUT

* **Hipchat**: posts all messages to the hipchat.com API
  * `HIPCHAT_API_TOKEN`
  * `HIPCHAT_ROOM_ID`
  * `HIPCHAT_ANNOUNCE_STATUS_CHANGE`

### Consumers

Configured by setting the `CONSUMERS` environment variable. This should be a
comma-separated list of status consumers.

* **Github**
* **Heroku**
* **Keen**
* **Tddium**

## Deploying

You probably just want to push it to heroku with the `memcachier:dev` addon
enabled.
