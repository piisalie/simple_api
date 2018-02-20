defmodule SimpleApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    port = 4000
    IO.puts "Starting Server on port: #{port}"

    children = [
      # Starts a worker by calling: SimpleApi.Worker.start_link(arg)
      # {SimpleApi.Worker, arg},
      Plug.Adapters.Cowboy.child_spec(
        :http,
        SimpleApi.Endpoint,
        [],
        [port: port]),
      {SimpleApi.Counter, name: {:global, SimpleApi.Counter}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
