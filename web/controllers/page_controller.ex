defmodule TwitterOauthExample.PageController do
  use TwitterOauthExample.Web, :controller

  def index(conn, _params) do
    if conn.assigns.current_user do
      render conn, "logged_in.html"
    else
      render conn, "logged_out.html"
    end
  end
end
