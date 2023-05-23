defmodule SimpleChatServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SimpleChatServerWeb.Telemetry,
      # Start the Ecto repository
      SimpleChatServer.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SimpleChatServer.PubSub},
      # Start Finch
      {Finch, name: SimpleChatServer.Finch},
      # Start the Endpoint (http/https)
      SimpleChatServerWeb.Endpoint
      # Start a worker by calling: SimpleChatServer.Worker.start_link(arg)
      # {SimpleChatServer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleChatServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SimpleChatServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
