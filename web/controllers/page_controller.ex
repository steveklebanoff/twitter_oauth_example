defmodule TwitterOauthExample.PageController do
  use TwitterOauthExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
