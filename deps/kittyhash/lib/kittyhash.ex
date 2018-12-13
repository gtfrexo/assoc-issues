defmodule Kittyhash do
  alias Comeonin.Argon2
  alias Comeonin.Bcrypt
  alias Comeonin.Pbkdf2
  
  @harshHashes [
    "H1D2Kitty-HashMonk3yB3ar5",
    "H2D2Kitty-Hash5harkG0rk",
    "H3D2Kitty-HashW0lfTig3r"
  ]

  def kitties_hash() do
    mash = @harshHashes 
    |> Enum.shuffle 
    |> List.first
    {:ok, mash}
  end

  def hasher_slasher(hash, mash) do
    if mash === "H1D2Kitty-HashMonk3yB3ar5" do
      hash_for_kitty_method_one(hash)
    end
    if mash === "H2D2Kitty-Hash5harkG0rk" do
      hash_for_kitty_method_two(hash)
    end
    if mash === "H3D2Kitty-HashW0lfTig3r" do
      hash_for_kitty_method_three(hash)
    end
  end

  def hash_for_kitty_method_one(hash) do
    postHash = Argon2.hashpwsalt(hash)
    {:ok, postHash}
  end

  def hash_for_kitty_method_two(hash) do
    postHash = Bcrypt.hashpwsalt(hash)
    {:ok, postHash}
  end

  def hash_for_kitty_method_three(hash) do
    postHash = Pbkdf2.hashpwsalt(hash)
    {:ok, postHash}
  end

  def kitty_paws(hash, postHash, mash) do
    if mash === "H1D2Kitty-HashMonk3yB3ar5" do
      kitty_paws_method_one(hash, postHash)
    end
    if mash === "H2D2Kitty-Hash5harkG0rk" do
      kitty_paws_method_two(hash, postHash)
    end
    if mash === "H3D2Kitty-HashW0lfTig3r" do
      kitty_paws_method_three(hash, postHash)
    end
  end

  def kitty_paws_method_one(hash, postHash) do
    case Argon2.checkpw(hash, postHash) do
      true -> {:ok, true}
      _ -> {:error, "Incorrect Password"}
    end
  end

  def kitty_paws_method_two(hash, postHash) do
    case Bcrypt.checkpw(hash, postHash) do
      true -> {:ok, true}
      _ -> {:error, "Incorrect Password"}
    end
  end

  def kitty_paws_method_three(hash, postHash) do
    case Pbkdf2.checkpw(hash, postHash) do
      true -> {:ok, true}
      _ -> {:error, "Incorrect Password"}
    end
  end

  #Kittyhash.hasher_slasher("asdf")
  #Kittyhash.kitty_paws("asdf", "$pbkdf2-sha512$160000$Ib3TK/.0X3srsgMyPfpDdg$wvaJTHA5ht5ZWMzkfLCNVaqE8ldjFe0VC0jOI7oF9PHdcB7yXC1N/0m322P46ve25zjMQ5VP9fsY8rpAEl7A4w", "Hashed to: H2D2Kitty-HashW0lfTig3r")
  #Kittyhash.kitty_paws("asdsf", "$pbkdf2-sha512$160000$Ib3TK/.0X3srsgMyPfpDdg$wvaJTHA5ht5ZWMzkfLCNVaqE8ldjFe0VC0jOI7oF9PHdcB7yXC1N/0m322P46ve25zjMQ5VP9fsY8rpAEl7A4w", "Hashed to: H2D2Kitty-HashW0lfTig3r")

end
