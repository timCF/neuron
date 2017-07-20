defmodule Neuron.Connection do
  @moduledoc false

  def post(url, query, headers \\ [], options \\ []) do
    HTTPoison.post(
      url,
      query,
      Keyword.merge(["Content-Type": "application/graphql"], headers),
      options
    )
  end
end
