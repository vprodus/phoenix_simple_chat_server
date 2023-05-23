defmodule SimpleChatServerWeb.RoomJSON do
  alias SimpleChatServer.Chat.Room

  @doc """
  Renders a list of rooms.
  """
  def index(%{rooms: rooms}) do
    %{data: for(room <- rooms, do: data(room))}
  end

  @doc """
  Renders a single room.
  """
  def show(%{room: room}) do
    %{data: data(room)}
  end

  defp data(%Room{} = room) do
    %{
      id: room.id,
      desc: room.desc,
      name: room.name
    }
  end
end
