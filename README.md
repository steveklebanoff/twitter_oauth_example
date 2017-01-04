# Twitter OAuth Example
## Twitter authentication and token usage in Elixir

### Setup

- Create a new twitter app https://apps.twitter.com/
- Make sure to set a Privacy URL and Terms Of Service URL
- After creating, modify app's settings
  - Update the app's settings with "Read and Write" for the Access type, and also check "Request email addresses from users".  
- Copy `dev.secret.exs.example` to `dev.secret.exs` and fill your app's in consumer key and secret


### Start the app:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### Notes & Caveats

- Every time a user signs in, we generate a new access token.
  - Since tokens do not expire in twitter, it may be better to store these somewhere secure and not regenerate on every login

- We store the twitter access_token and access_token_secret in the session
  - You would need the consumer key and consumer secret to do anything interesting with these tokens.  That being said, you may want to consider alternatives for a production setting.



### TODO

- [x] Show timeline
- [x] Allow posting to timeline
  - [x] Protect against users not signed in
- [x] Write plug for restricting tweets controller to authenticated users
- [ ] Remove DB ecto stuff from phoenix
- [ ] Handle when access is denied from twitter

- [ ] make real form, serialize
- [ ] update bootstrap layout
- [ ] Write custom plugs instead of defining on router
- [ ] Manage JS better
```
When done: [info] GET /auth/callback
[debug] Processing by TwitterOauthExample.AuthController.callback/2
  Parameters: %{"oauth_token" => "xyz", "oauth_verifier" => "abc"}
  Pipelines: [:browser]

When bad:
[debug] Processing by TwitterOauthExample.AuthController.callback/2
    Parameters: %{"denied" => "R9aaLAAAAAAAyl8fAAABWV34hXw"}
    Pipelines: [:browser]
```
