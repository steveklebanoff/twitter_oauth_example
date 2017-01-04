defmodule TwitterOauthExample.Plugs.AssignCurrentUser do
  import Plug.Conn
  def init(opts) do; opts; end;
  def call(conn, _opts) do
    assign(conn, :current_user, get_session(conn, :current_user))
  end
end

defmodule TwitterOauthExample.Plugs.RequireUser do
  import Plug.Conn

  def init(opts) do; opts; end;
  def call(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> Plug.Conn.send_resp(401, "")
      |> halt()
    end
  end
end

defmodule TwitterOauthExample.Plugs.ConfigureTwitterClient do
  import Plug.Conn
  def init(opts) do; opts; end;
  def call(conn, _opts) do
    if conn.assigns.current_user &&
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
