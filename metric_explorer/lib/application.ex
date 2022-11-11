defmodule MetricExplorer.Application do
  @moduledoc false
  use Application

  alias MetricCollector

  def start(_type, _args) do
    children = [{MetricCollector, []}]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
