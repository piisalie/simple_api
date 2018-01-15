defmodule SimpleApi.Counter do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, %{count: 0}, opts)
  end

  def increment do
    GenServer.call(__MODULE__, {:increment})
  end

  def handle_call({:increment}, _from, state) do
    new_count = state.count + 1
    {:reply, new_count, %{state | count: new_count}}
  end
end
