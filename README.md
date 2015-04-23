# Checkups

Check status APIs and notify someone when changes occur.

## Setup

1. Clone this repo
2. Install ruby
3. Install bundler
4. bundle install

### Announcers

Configured by setting the `ANNOUNCER` environment variable. Announcers are
responsible for receiving a new status object and sending a notification when
there has been a change.

Announcers take no arguments to initialize and should respond to `announce`.

* **Stdout** (default): logs all messages to STDOUT

* **Hipchat**: posts all messages to the hipchat.com API
  * `HIPCHAT_API_TOKEN`
  * `HIPCHAT_ROOM_ID`
  * `HIPCHAT_ANNOUNCE_STATUS_CHANGE`

### Consumers

Configured by setting the `CONSUMERS` environment variable. This should be a
comma-separated list of status consumers. Consumers are responsible for
creating a new status object from a third-party status API.

Consumers take no arguments to initialize and should respond to `consume`.

* **DNSimple**
* **Github**
* **Heroku**
* **HipChat**
* **Keen**
* **RedisToGo**
* **Tddium**

### Statuses

Statuses are the announceable representation of a Consumer's response data.
They should be initialized with the data for a single status event.

All statuses should define:

* `sender`: name of the sender, defaults to `SENDER` constant
* `color`: represents the severity of the event (green, yellow, red, etc)
* `body`: full text that will be sent by the announcer

## Deploying

You probably just want to push it to heroku with the `memcachier:dev` addon
enabled.
