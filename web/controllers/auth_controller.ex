defmodule TwitterOauthExample.AuthController do
  use TwitterOauthExample.Web, :controller

  alias TwitterOauthExample.Router

  def request(conn, _params) do
    token = ExTwitter.request_token(
      Router.Helpers.auth_url(conn, :callback)
    )
    {:ok, authenticate_url} = ExTwitter.authenticate_url(token.oauth_token)
    redirect conn, external: authenticate_url
  end

  def callback(conn, %{"oauth_token" => oauth_token, "oauth_verifier" => oauth_verifier}) do

    {:ok, access_token} = ExTwitter.access_token(oauth_verifier, oauth_token)

    # if we just ran configure without merging in the existing
    # config, we would lose existing config
    ExTwitter.configure(
      :process,
      Enum.concat(
        ExTwitter.Config.get_tuples,
        [ access_token: access_token.oauth_token,
          access_token_secret: access_token.oauth_token_secret ]
      )
    )

    IO.inspect ExTwitter.verify_credentials()
    conn = conn
      |> put_session(:current_user, ExTwitter.verify_credentials())
      |> put_session(:access_token, access_token.oauth_token)
      |> put_session(:access_token_secret, access_token.oauth_token_secret)

    redirect conn, to: Router.Helpers.page_path(conn, :index)
  end

end
