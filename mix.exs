defmodule RpcHeartbeat.MixProject do
  use Mix.Project

  def project do
    [
      app: :rpc_heartbeat,
      version: "0.1.0",
      build_path: "./_build",
      config_path: "./config/config.exs",
      deps_path: "./deps",
      lockfile: "./mix.lock",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RpcHeartbeat.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 3.1"},
      {:cowboy, "~> 1.1"},
      {:jsonrpc2, "~> 1.0"},
      {:plug, "~> 1.5"}
    ]
  end
end
