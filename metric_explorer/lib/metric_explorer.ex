defmodule MetricExplorer do

  require Logger

  def query_between_timestamps(metric_name, start_time, end_time) do
    case MetricCollector.get_metric_data(metric_name, start_time, end_time) do
      {:ok, data_points} ->
        Enum.sort_by(data_points, fn {timestamp, _} -> timestamp end)

      # {:error, error_message} ->
      #   Logger.error("Failed to query the metric #{metric_name} in the [#{start_time}, #{end_time}] interval because of this error: #{error_message}")
    end
  end

  def query_last_x_seconds(metric_name, seconds) do
    Logger.info("Getting the last #{seconds} of data for the metric #{metric_name}...")
    # Deduce the start and end time interval. Use :os.system_time(:second) to get the current timestamp;
    # Use MetricCollector.get_metric_data() function to retrieve the data points;
    # Use a case to handle both {:ok, data_points} and {:error, message} responses, as above.
  end

  def query_from_timestamp_with_offset(metric_name, timestamp, offset) do
    Logger.info("Querying #{metric_name} metric data starting from #{timestamp} and with offset #{offset}...")
    # Deduce the start and end time interval based on the provided timestamp and the offset;
    # The offset can be negative or positive;
    # Use MetricCollector.get_metric_data() function to retrieve the data points;
    # Use a case to handle both {:ok, data_points} and {:error, message} responses, as above.
  end

  def compute_min([]) do
    0
  end

  def compute_min(_data_points) do

    # Use Enum.Reduce to compute the minimum data point value and return it
  end

  def compute_max(_data_points) do
    # Use Enum.Reduce to compute the minimum maximum point value and return it
  end

  def compute_avg(_data_points) do
    # Use Enum.Reduce to compute the average of the values and return it
  end

  def compute_odd_avg(_datapoints) do
    # Use function composition to compute the average of the values where the timestamp is an odd value
    # Pro Tip: use rem(a, b) to compute the remainder of a / b
  end
end
