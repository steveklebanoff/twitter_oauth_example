defmodule TwitterOauthExample.Router do
  use TwitterOauthExample.Web, :router
  alias TwitterOauthExample.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Plugs.AssignCurrentUser
    plug Plugs.ConfigureTwitterClient
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
end
