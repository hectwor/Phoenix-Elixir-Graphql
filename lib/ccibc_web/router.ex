defmodule CcibcWeb.Router do
  use CcibcWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug.GraphiQL,
      schema: CcibcWeb.Schema,
      interface: :simple,
      context: %{pubsub: CcibcWeb.Endpoint}
  end

  scope "/api", CcibcWeb do
    pipe_through :api
  end
end
