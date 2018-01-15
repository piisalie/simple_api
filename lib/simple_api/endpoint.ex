defmodule SimpleApi.Endpoint do
  use Plug.Router
  plug Plug.Logger
  plug :match
  plug :dispatch

  match _ do
    count = SimpleApi.Counter.increment
    response =
      %{
        request_count: count,
        magic_env_var: Application.get_env(:simple_api, :magic_env_var)
      }

    send_resp(conn, 200, Poison.encode!(response))
  end
end
