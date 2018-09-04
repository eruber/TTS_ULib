# TTS_ULib

Tabletop Simulator (TTS) Library of Lua code from one of two sources:

1. Developed by the author
2. Curated from various attributed sources

# Lua Environment Outside of TTS
Some TTS_ULib modules contain no TTS API calls and can thus be tested outside of TTS and without any mocking of TTS APIs. This type of testing requires a Lua run-time environment.

# Deploying To TTS Include path
Will probably need a deployment script (written in Python or Lua itself) that will convert any Lua 'require' statements to TTS '#include' statements.

# Testing

Using LuaUnit for unit testing.

