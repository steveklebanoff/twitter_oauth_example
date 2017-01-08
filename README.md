# Twitter OAuth Example
### Twitter OAuth example using Elixir and Phoenix with authenticated requests

![Demo](http://i.imgur.com/tAvZNgg.gif)

### Background

There are a few good examples showing how to use OAuth authentication in Phoenix and Elixir, but I wanted a solution which used a small amount of dependencies, and had the ability to make authenticated requests on behalf of a user.

Read more at http://headynation.com/twitter-oauth-elixir-phoenix/

### Setup

- Create a new twitter app https://apps.twitter.com/
- Make sure to set a Privacy URL and Terms Of Service URL
- After creating, modify app's settings
  - Update the app's settings with "Read and Write" for the Access Type
- Copy `dev.secret.exs.example` to `dev.secret.exs` and fill your app's in consumer key and secret


### Start the app:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
