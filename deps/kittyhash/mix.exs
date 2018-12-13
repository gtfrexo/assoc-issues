defmodule Kittyhash.MixProject do
  use Mix.Project

  def project do
    [
      app: :kittyhash,
      version: "0.1.1",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package() ,
      description: "Pashword hashing with kitty!"
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE*"],
      maintainers: ["Gavin Rose"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/gtfrexo/kitty_hash"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:comeonin, "~> 4.0"},
      {:argon2_elixir, "~> 1.3"},
      {:bcrypt_elixir, "~> 1.0"},
      {:pbkdf2_elixir, "~> 0.12"},
      {:ex_doc, "~> 0.18.0", only: :dev}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
