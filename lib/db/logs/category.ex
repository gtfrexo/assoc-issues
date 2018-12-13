defmodule Db.Logs.Category do
    use Exnumerator,
      values: [:error, :warning, :feedback] 
    #use Absinthe.Schema.Notation

    #enum :category, values: [:error, :warning, :feedback]
  end