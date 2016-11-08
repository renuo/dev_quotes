use Mix.Config

config :dev_quotes,
  github_access_token: System.get_env("GITHUB_ACCESS_TOKEN"),
  stackoverflow_api_key: System.get_env("STACKOVERFLOW_API_KEY")

config :addict, secret_key: System.get_env("ADDICT_SECRET_KEY")

config :extwitter, :oauth, [
   consumer_key: System.get_env("TWITTER_CONSUMER_KEY"),
   consumer_secret: System.get_env("TWITTER_CONSUMER_SECRET"),
   access_token: System.get_env("TWITTER_ACCESS_TOKEN"),
   access_token_secret: System.get_env("TWITTER_ACCESS_TOKEN_SECRET")
]
