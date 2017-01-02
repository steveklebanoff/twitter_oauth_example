defmodule TwitterOauthExample.Router do
  use TwitterOauthExample.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_current_user
    plug :configure_ecto
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TwitterOauthExample do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/auth/request", AuthController, :request
    get "/auth/callback", AuthController, :callback
    get "/auth/logout", AuthController, :logout

    resources "/tweets", TweetController, only: [:index, :create]
  end

  # Fetch the current user from the session and add it to `conn.assigns`. This
  # will allow you to have access to the current user in your views with
  # `@current_user`.
  # From https://github.com/scrogson/oauth2_example/blob/230e8f2f5a33d70c02fc66e80c1e51eb20121edd/web/router.ex#L27
  defp assign_current_user(conn, _) do
    assign(conn, :current_user, get_session(conn, :current_user))
  end

  defp configure_ecto(conn, _) do
    if get_session(conn, :current_user) &&
      get_session(conn, :access_token) &&
      get_session(conn, :access_token_secret) do
        # Configure extwitter credentials
        ExTwitter.configure(
          :process,
          Enum.concat(
            ExTwitter.Config.get_tuples,
            [ access_token: get_session(conn, :access_token),
              access_token_secret: get_session(conn, :access_token_secret)]
          )
        )
    end

    conn
  end
end
