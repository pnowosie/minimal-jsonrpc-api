defmodule RpcHeartbeatTest do
  use ExUnit.Case
  doctest RpcHeartbeat

  test "greets the world" do
    assert RpcHeartbeat.hello() == :world
  end
end
