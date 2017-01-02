defmodule TwitterOauthExample.TweetController do
  use TwitterOauthExample.Web, :controller

  def index(conn, _params) do
    screen_name = get_session(conn, :current_user).screen_name
    tweets = ExTwitter.user_timeline([screen_name: screen_name])
    render conn, "index.html", %{tweets: tweets}
  end

  def create(conn, %{"message" => message}) do
    ExTwitter.update(message)
    send_resp(conn, 200, "")
  end
end
