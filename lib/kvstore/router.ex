defmodule KVstore.Router do
    @moduledoc """
        Для веб сервера нужен маршрутизатор, место ему именно тут.
    """
    use Plug.Router
    
    if Mix.env == :dev do
        use Plug.Debugger, otp_app: :kvstore
    end

    plug :match
    plug :dispatch

    get "/" do
        send_resp(conn, 200, "world")
    end

    match _ do
        send_resp(conn, 404, "oops")
    end
end