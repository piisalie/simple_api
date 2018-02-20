defmodule SimpleApi.Counter do
  use GenServer

  def start_link(opts) do
    case GenServer.start_link(__MODULE__, %{count: 0}, opts) do
      {:error, {:already_started, pid}} -> {:ok, pid}
      {:ok, pid} -> {:ok, pid}
    end
  end

  def increment do
    GenServer.call({:global, __MODULE__}, {:increment})
  end

  def handle_call({:increment}, _from, state) do
    new_count = state.count + 1
    {:reply, new_count, %{state | count: new_count}}
  end
end
