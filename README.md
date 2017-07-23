# Proplist

A lightweight wrapper around Erlang's `:proplists` module.

This lib makes the proplist the first argument for all functions.
Additionally, when functions would return `:none` or `:undefined`, they instead
return `nil`

## Installation

```elixir
def deps do
  [{:proplist, git: "git@github.com:cjpoll/proplist", ref: "master"}]
end
```
