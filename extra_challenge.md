# Elixir deep dive

If you want to extend the metric_explorer application into a fully fledged project, consider solving one (or more!) of the challanges that are described bellow. 

## Frontend & UI challenge
1. Use the Plug framework and construct a REST API to expose the metric data;
2. Write a web application to consume the API and render metric graphs in the browser;
3. Write a specification for your API by using swagger and OpenAPI;
4. Use the API spec to validate incoming requests.

## Remediation challenge
1. Define 3 new structures: Alarms, Actions and Bots;
   1. An alarm has a fire condition and a clear condition. A condition looks like this: in p% of the datapoints from the past x seconds, the target metric was < or > than a threshold t;
   2. An action is a struct that points to a python/bash script stored on disk;
   3. A bot is an entity that links an alarm to one or multiple actions.
2. Create a GenServer that:
    1. Allows the insertion of remediation triplets in its state;
    2. Each second, it verifies the fire condition of all the alarms in the state. If the condition is met, then the alarm triggers;
       1. When an alarm triggers, the associated bot is dispatched and all the actions are executed;
       2. When an action is executed, it runs the associated script;
       3. An alarm that is triggered cannot be triggered again until it is cleared first.
    3. Each second, it verifies the clear condition on all the triggered alarms and marks them as cleared if the condition is met so that they can trigger again in the future.
3. Persist the alarm trigger and clear events into a database. Write a controller to allow the user to query these events by alarm, timestamp, event type etc.
4. (Optionally) If you implemented the Frontend challenge, mark the relevant trigger and clear events onto the metric graphs.

## Language & Metrics challenge
1. Use Prometheus to collect metric data instead of Erlang :os_mon module;
2. Use Leex and Yecc to design a language to query the metric data;

Language examples:
cpu_usage.from(timestamp).to(timestamp)
memory_usage.last(5m).avg

OR
retrieve_metrics(name=cpu_usage, base_timestamp=timestamp, offset=-300s)

OR
metric_query |-> cpu_usage |-> [start_time, end_time]

3. Extend the language to allow the construction of complex metric queries that combines other metrics and mathematical operations:
my_metric = cpu_usage / 100 + 6

4. Finds ways to compress the collected data in order to save memory.


# PS
If you solve any of these, let us know at lucian@shoreline.io and sergiu@shoreline.io!