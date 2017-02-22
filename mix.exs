defmodule Authentication.Mixfile do
  use Mix.Project

  def project do
    [app: :authentication,
     version: "0.0.1",
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Authentication, []},
      applications: [
        :phoenix, :phoenix_pubsub, :cowboy, :logger
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.1"},
     {:phoenix_pubsub, "~> 1.0"},
     {:joken, "~> 1.4.1"},
     {:poison, "~> 2.2.0"},
     {:json_web_token, "~> 0.2"},
     {:cowboy, "~> 1.0"}]
  end
end
