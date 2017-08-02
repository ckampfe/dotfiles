defmodule Exshell.Brew do
  def update do
    {data, 0} = System.cmd("brew", ["update"])
    IO.puts(data)
  end

  def upgrade do
    {data, 0} = System.cmd("brew", ["upgrade"])
    IO.puts(data)
  end
end
