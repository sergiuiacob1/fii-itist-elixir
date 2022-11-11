defmodule MetricCollector do
  use GenServer

  require Logger

  # Client

  # these methods can be called by outside modules

  def start_link(_opts) do
    IO.inspect("am ajuns aici")

    # called by the supervisor in order to start the GenServer

    # let's construct the GenServer state here:

    # The usual representation of the state is a map;
    # Let's create a map with a single entry:
      # the key is a string named "available_metrics"
      # the value is a list of tuples containing:
        # 1. The name of the collected metric
        # 2. A function to extract the value of that metric
    state = %{}

    GenServer.start_link(__MODULE__, state)
  end

  def get_metric_data(_metric, _start_time, _end_time) do
    # Let's use this function to get metric data from a specified time interval;
    # Use :ets.tab2list(metric) to get a list with all the entries from a specified metric table;
    # Filter the entries and select only the ones with their timestamp between start_time and end_time
    # (tip: each data point is a {timestamp, value} tuple);
    # Return the eligible data points in a tuple with this format: {:ok, data_points}.
    # Pro tip: use the pipe operator |> to process the data.

    # Warning: if the metric does not exist, then :ets.tab2list return an ArgumentError;
    # Use a try do / rescue / end block for error handing;
    # In the rescue block, catch ArgumentError and return a tuple with this format: {:error, error_message}
    {:ok, []}
  end

  # Server

  # These functions represent GenServer logic.
  # Even though some methods are public (def instead defp), it is advisable not to call them outside this module

  @impl true
  def init(state) do
    # this function is called once when the GenServer starts

    # this function shows the monitoring options available on your OS
    show_monitoring_info()

    # Let's create the :ets tables for each available metric;
    # To do that, iterate over <Each> available metric and call the new method:
      # :ets.new(metric_name, [:set, :named_table])
        # :set -> it means that each entry in the table is considered unique
        # :named_table -> further insert calls needs to know only the name of the table, not the identifier returned by :ets.new

    # Schedule the work to be performed each second
    schedule_work()

    {:ok, state}
  end

  defp schedule_work do
    # starts an async process that will send the :collect_metrics message to this GenServer after one second
    Process.send_after(self(), :collect_metrics, :timer.seconds(1))
  end

  @impl true
  def handle_info(:collect_metrics, state) do
    # This functions handles the :collect_metrics message sent by the schedule_work function

    # Calls the schedule_work method asynchronously. In this way, this handle_info method is called once every 1 second.
    schedule_work()

    # Let's collect the metrics
    collect_metrics(state)
    {:noreply, state}
  end

  defp collect_metrics(_available_metrics) do
    # This method will collect and persist each available metric;

    # First, let's store the current timestamp into a variable such that each insert is made at the same time;
    # Use :os.system_time(:second) to get the current timestamp

    # For Each available metric, use the collector function defined in the state to get the current value;
    # Then, use :ets.insert in order to add the data point:
      # :ets.insert(metric_name, {current_timestamp, collected_value})
  end

  def get_cpu_usage do
    # This function extracts the current cpu_usage;
    # Start the aplication by using `iex -S mix` and check the "cpu_sup" log to see the format returned by your OS;

    # Use :cpu_sup.util() to get the current cpu usage percent value;
    # Warning: the function returns 0 if it is not available on your OS (it is not available on Windows).
    0
  end

  def get_memory_usage do
    # This function extracts the current memory_usage;
    # Start the aplication by using `iex -S mix` and check the "memsup" log to see the format returned by your OS;

    # Use :memsup.get_system_memory_data() to get the current memory data;
    # Warning: the function returns [] if it is not available on your OS;

    # In order to compute the memory usage percentage, we will use this formula:
      # (system_total_memory - free_memory) / system_total_memory * 100
      # Pro tip: convert the keyword list into a Map by using Map.new() and use pattern matching to extract the needed values
    0
  end

  def get_disk_usage do
    # This function extracts the current memory_usage;
    # Start the aplication by using `iex -S mix` and check the "disksup" log to see the format returned by your OS;

    # Use :disksup.get_disk_data() to get the current disk data;
    # Warning: the function returns [{"none",0,0}] if it is not available on your OS;

    # The response contains a list of tuples with this format: {partition_name, avilable_space_in_KB, capacity_percent}
    # In order to compute the disk usage percentage, we will choose a desired partition from the list.
    # Use Enum.filter() to select the desired partition by partition_name, then pattern matching to get the capacity_percent
    0
  end

  defp show_monitoring_info() do
    Logger.info("These are the responses of the monitoring functions reported by your operating system:")
    Logger.info("cpu_sup: #{inspect(:cpu_sup.util())}")
    Logger.info("memsup: #{inspect(:memsup.get_system_memory_data())}")
    Logger.info("disksup: #{inspect(:disksup.get_disk_data())}")
  end
end
