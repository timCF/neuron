defmodule Neuron do
  alias Neuron.{Response, Connection, Config}

  @moduledoc """
  Allows to interact with graphql endpoints.
  """

  @doc """
  runs a query request to your graphql endpoint
  """
  def query(query_string, headers \\ [], options \\ []) do
    query_string
    |> construct_query_string()
    |> run(headers, options)
  end

  @doc """
  runs a mutation request to your graphql endpoint
  """
  def mutation(mutation_string, headers \\ [], options \\ []) do
    mutation_string
    |> construct_mutation_string()
    |> run(headers, options)
  end

  defp run(body, headers, options) do
    body
    |> run_query(headers, options)
    |> Response.handle()
  end

  defp run_query(body, headers, options) do
    Connection.post(url(), body, headers, options)
  end

  defp construct_query_string(query_string) do
    "query #{query_string}"
  end

  defp construct_mutation_string(mutation_string) do
    "mutation #{mutation_string}"
  end

  defp url do
    Config.get(:url)
  end
end
