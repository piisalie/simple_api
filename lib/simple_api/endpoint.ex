defmodule SimpleApi.Endpoint do
  use Plug.Router
  plug Plug.Logger
  plug :match
  plug :dispatch

  match "/file" do
    file = Path.join(:code.priv_dir(:simple_api), "hello.erl")
    file_contents = File.read!(file)
    send_resp(conn, 200, file_contents)
  end

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
