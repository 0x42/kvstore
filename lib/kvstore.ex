defmodule KVstore do 
    use Application
    alias KVstore.Router
    
    @impl true
    def start(_type, _args) do 
        # Plug.Adapters.Cowboy is deprecated!!! -> change to lib plug_cowboy
        children = [
            Plug.Adapters.Cowboy.child_spec(:http, Router, [], port: 4000)
        ]
        Supervisor.start_link(children, strategy: :one_for_one)
    end

    @impl true
    def stop(_state), do: :ok
end