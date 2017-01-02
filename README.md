# Twitter OAuth Example
## Authentication, DB storage, and token usage in Elixir

### Setup

- Create a new twitter app https://apps.twitter.com/
- Make sure to set a Privacy URL and Terms Of Service URL
- After creating, modify app's settings
  - Update the app's settings with "Read and Write" for the Access type, and also check "Request email addresses from users".  
- Copy `dev.secret.exs.example` to `dev.secret.exs` and fill your app's in consumer key and secret


### Start the app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
