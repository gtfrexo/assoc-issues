defmodule DbWeb.Router do
  use DbWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug DbWeb.Context
   end

  scope "/api", DbWeb do
    pipe_through :graphql

    resources "/context_vals", Context_ValController, except: [:new, :edit]
    resources "/genders", GenderController, except: [:new, :edit]
    resources "/locations", LocationController, except: [:new, :edit]
    resources "/versions", VersionController, except: [:new, :edit]
    resources "/hosts", HostController, except: [:new, :edit]
    resources "/medias", MediaController, except: [:new, :edit]
    resources "/messages", MessageController, except: [:new, :edit]
    resources "/profile_contents", Profile_ContentController, except: [:new, :edit]
    resources "/events", EventController, except: [:new, :edit]
    resources "/persons", PersonController, except: [:new, :edit]
    resources "/pools", PoolController, except: [:new, :edit]
    resources "/venues", VenueController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
    resources "/logs", LogController, except: [:new, :edit]
    resources "/server_flags", Server_FlagController, except: [:new, :edit]
  end

  forward "/api", Absinthe.Plug, 
    schema: DbWeb.Schema,
    socket: DbWeb.UserSocket

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: DbWeb.Schema,
    socket: DbWeb.UserSocket

end
