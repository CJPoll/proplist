defmodule Proplist do
  @doc """
  ## Example

      iex> Proplist.append_values([a: 1, b: 0, a: 2, a: [3, 4]], :a)
      [1, 2, 3, 4]

  """
  def append_values(list, key) when is_list(list) do
    :proplists.append_values(key, list)
  end

  @doc """
  ## Example

      iex> Proplist.compact([{:a, 1}, {:b, true}, :c])
      [{:a, 1}, :b, :c]

  """
  def compact(list) when is_list(list) do
    :proplists.compact(list)
  end

  @doc """
  ## Example

      iex> Proplist.delete([{:a, 1}, :b, {:a, true}, :c, :a], :a)
      [:b, :c]

  """
  def delete(list, key) when is_list(list) do
    :proplists.delete(key, list)
  end

  @doc """
  ## Examples

    iex> Proplist.expand([:fie, :foo, :fum], [{:foo, [:bar, :baz]}])
    [:fie, :bar, :baz, :fum]

    iex> Proplist.expand([:fie, :foo, :fum], [{{:foo, true}, [:bar, :baz]}])
    [:fie, :bar, :baz, :fum]

    iex> Proplist.expand([:fie, {:foo, false}, :fum], [{{:foo, false}, [:bar, :baz]}])
    [:fie, :bar, :baz, :fum]

    iex> Proplist.expand([:fie, {:foo, :fum}, :fum], [{{:foo, false}, [:bar, :baz]}])
    [:fie, {:foo, :fum}, :fum]

    iex> Proplist.expand([:fie, {:foo, true}, :fum], [{{:foo, false}, [:bar, :baz]}])
    [:fie, :foo, :fum]

  """
  def expand(list, expansions) when is_list(list) do
    :proplists.expand(expansions, list)
  end

  @doc """
    iex> Proplist.get_all_values([:a, :b, :c], :d)
    []

    iex> Proplist.get_all_values([:a, :b, :c, {:a, true}, {:a, false}, {:a, :hi}], :a)
    [true, true, false, :hi]
  """
  def get_all_values(list, key) when is_list(list) do
    :proplists.get_all_values(key, list)
  end

  @doc """
    iex> Proplist.get_bool([{:a, true}, {:a, false}], :a)
    true

    iex> Proplist.get_bool([{:a, false}, {:a, true}], :a)
    false

    iex> Proplist.get_bool([{:a, :hi}, {:a, :there}], :a)
    false
  """
  def get_bool(list, key) when is_list(list) do
    :proplists.get_bool(key, list)
  end

  @doc """
    iex> Proplist.get_value([:a, :b], :c)
    nil

    iex> Proplist.get_value([:a, :b], :c, :default)
    :default

    iex> Proplist.get_value([:a, :b], :a)
    true

    iex> Proplist.get_value([{:a, :hi}, :b], :a)
    :hi
  """
  def get_value(list, key, default \\ nil) do
    :proplists.get_value(key, list, default)
  end

  @doc """
  iex> Proplist.defined?([:a], :a)
  true

  iex> Proplist.defined?([:a], :b)
  false

  iex> Proplist.defined?([{:a, true}], :b)
  false

  iex> Proplist.defined?([{:a, nil}], :a)
  true

  iex> Proplist.defined?([{:a, false}], :a)
  true
  """
  def defined?(list, key) when is_list(list) do
    :proplists.is_defined(key, list)
  end

  @doc """
    iex> Proplist.lookup([{:a, :hi}, {:a, :there}], :a)
    {:a, :hi}

    iex> Proplist.lookup([:a], :a)
    {:a, true}

    iex> Proplist.lookup([:a], :b)
    nil

    iex> Proplist.lookup([{:a, nil}], :a)
    {:a, nil}

    iex> Proplist.lookup([{:a, false}], :a)
    {:a, false}
  """
  def lookup(list, key) when is_list(list) do
    case :proplists.lookup(key, list) do
      :none -> nil
      any -> any
    end
  end

  @doc """
    iex> Proplist.lookup_all([:a, {:a, true}, {:b, :hi}, {:a, false}, {:a, nil}], :a)
    [{:a, true}, {:a, true}, {:a, false}, {:a, nil}]

    iex> Proplist.lookup_all([{:a, true}, {:b, :hi}, {:a, false}, {:a, nil}], :c)
    []
  """
  def lookup_all(list, key) when is_list(list) do
    :proplists.lookup_all(key, list)
  end

  def normalize(list, stages) do
    :proplists.normalize(list, stages)
  end

  @doc """
    iex> Proplist.property(:a)
    :a

    iex> Proplist.property({:a, true})
    :a

    iex> Proplist.property({:a, :b})
    {:a, :b}
  """
  def property(prop) do
    :proplists.property(prop)
  end

  @doc """
    iex> Proplist.property(:a, true)
    :a

    iex> Proplist.property(:a, :hi)
    {:a, :hi}
  """
  def property(key, value) do
    :proplists.property(key, value)
  end

  @doc """
    iex> Proplist.split([{:c, 2}, {:e, 1}, :a, {:c, 3, 4}, :d, {:b, 5}, :b], [:a, :b, :c])
    {[[:a], [{:b, 5}, :b],[{:c, 2}, {:c, 3, 4}]], [{:e, 1}, :d]}
  """
  def split(list, keys) when is_list(list) when is_list(keys) do
    :proplists.split(list, keys)
  end

  def substitute_aliases(list, aliases) when is_list(list) when is_list(aliases) do
    :proplists.substitute_aliases(aliases, list)
  end

  def substitute_negations(list, negations) when is_list(list) when is_list(negations) do
    :proplists.substitute_negations(negations, list)
  end

  @doc """
    iex> Proplist.unfold([:a, {:a, true}, {:a, :hi}, {:b, nil}])
    [{:a, true}, {:a, true}, {:a, :hi}, {:b, nil}]
  """
  def unfold(list) when is_list(list) do
    :proplists.unfold(list)
  end
end
