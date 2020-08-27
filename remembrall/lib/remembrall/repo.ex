defmodule Remembrall.Repo do
  use Ecto.Repo,
    otp_app: :remembrall,
    adapter: Ecto.Adapters.Postgres
end
