use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :authentication, Authentication.Endpoint,
  secret_key_base: "oiVOQu7Bzg1662G1//L5EpAVvkXqkHhKAZZTbcXHPiAALn3ayDYlVpK/xQS3WqAc"
