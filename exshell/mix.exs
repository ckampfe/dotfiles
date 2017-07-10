defmodule Exshell.Mixfile do
  use Mix.Project

  def project do
    [app: :exshell,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :httpoison],
     mod: {Exshell.Application, []}]
  end

  defp deps do
    [{:httpoison, "~> 0.11.1"},
     {:poison, "~> 3.1"},
     {:strand, "~> 0.5"},
     {:array_vector, "~> 0.2"},
     {:prolly, "~> 0.2"}]
  end
end
