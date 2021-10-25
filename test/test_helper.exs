Application.ensure_all_started(:bypass)

# Ignore environment while testing
Enum.each(
  ~w[DWOLLA_ROOT_URI DWOLLA_CLIENT_ID DWOLLA_CLIENT_SECRET],
  &System.delete_env/1
)

ExUnit.start()
