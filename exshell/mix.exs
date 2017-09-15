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
    [{:httpoison, "~> 0.13.0"},
     {:poison, "~> 3.1"},
     {:strand, "~> 0.5"},
     {:array_vector, "~> 0.3"},
     {:prolly, "~> 0.2"},
     {:ecto, "~> 2.1"},
     {:postgrex, ">= 0.0.0"},
     {:decimal, "~> 1.0"},
     {:sweet_xml, "~> 0.6.5"}
   ]
  end
end
