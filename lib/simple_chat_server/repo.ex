defmodule SimpleChatServer.Repo do
  use Ecto.Repo,
    otp_app: :simple_chat_server,
    adapter: Ecto.Adapters.Postgres
end
