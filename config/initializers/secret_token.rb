# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Reddit::Application.config.secret_key_base = '44a9b49cc40e168faa506287d3f008c5c7afd513c6c93f6679fbd909d58c180040632c4efef06f3fda728fbdb08ff6353eda0b55fb42faf65603a7c2ab1524cb'
