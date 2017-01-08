defmodule TwitterOauthExample.TweetController do
  use TwitterOauthExample.Web, :controller
  plug TwitterOauthExample.Plugs.RequireUser

  def index(conn, _params) do
    screen_name = conn.assigns.current_user.screen_name
    tweets = ExTwitter.user_timeline([screen_name: screen_name])
    render conn, "index.html", %{tweets: tweets}
  end

  def create(conn, %{"message" => message}) do
    tweet = ExTwitter.update(message)
    url = "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"
    json conn, %{ url: url }
  end
end
