defmodule RpcHeartbeat.Handler do
  @moduledoc """
  JSONRPC request handler
  """

  use JSONRPC2.Server.Handler

  def handle_request(method, args) do
    IO.puts "Received method: #{method}, args #{inspect args}"

    case extract_method(method) do
      {:ok, action} -> handle(action, args)
      # handle method mismatch with 404
    end
  end

  defp handle(:version, []) do
    "1.0.0"
  end

  defp handle(:heartbeat, []) do
    start = Application.get_env(:rpc_heartbeat, :start_at)
    now = System.monotonic_time(:millisecond)

    "Alive for #{now - start}ms."
  end

  defp extract_method(method) do
    try do
      atom = String.to_existing_atom(method)
      {:ok, atom}
    rescue
      _  -> :error
    end
  end
end
