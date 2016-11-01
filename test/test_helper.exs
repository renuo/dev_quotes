ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(DevQuotes.Repo, :manual)
ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")
