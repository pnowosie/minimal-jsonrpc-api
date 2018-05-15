defmodule RpcHeartbeat.Application do
  @moduledoc """
  TODO
  """

  use Application

  def start(_type, _args) do
    port = Application.get_env(:rpc_heartbeat, :api_rpc_port)

    children = [
      JSONRPC2.Servers.HTTP.child_spec(:http, RpcHeartbeat.Handler, port: port)
    ]

    opts = [strategy: :one_for_one, name: RpcHeartbeat.Supervisor]
    Application.put_env(:rpc_heartbeat, :start_at, System.monotonic_time(:millisecond))

    IO.puts "Listening on port #{port}"
    Supervisor.start_link(children, opts)
  end

end
