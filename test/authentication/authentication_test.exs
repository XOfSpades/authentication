defmodule AuthenticationTest do
  use ExUnit.Case, async: true
  import Joken

  test "works when using joken" do
    private_key = JOSE.JWK.from_pem_file("resources/jwtsig-test-prv-ks.pem")
    IO.puts "private key:"
    IO.inspect private_key
    IO.puts ""
    public_key = JOSE.JWK.from_pem_file("resources/jwtsig-test-pub-ks.pem")
    IO.puts "public key:"
    IO.inspect public_key
    IO.puts ""

    signed_token = %{ "name" => "John Doe" }
    |> token
    |> sign(rs384(private_key))
    |> get_compact

    IO.puts "token: "
    IO.inspect signed_token
    IO.puts ""

    my_verified_token = signed_token
    |> token
    |> with_signer(rs384(public_key))
    |> verify

    IO.puts "verification: "
    IO.inspect my_verified_token
    IO.puts ""
  end

  # test "it can read the auth key files" do
  #   private_key = JsonWebToken.Algorithm.RsaUtil.private_key(
  #     "resources", "private_key.pem"
  #   )
  #   opts = %{
  #     alg: "RS384",
  #     key: private_key
  #   }

  #   jwt = JsonWebToken.sign(%{foo: "bar"}, opts)
  #   IO.inspect jwt

  #   # public_key = JsonWebToken.Algorithm.RsaUtil.public_key(
  #   #   "resources", "jwtsig-test-pub-ks.pem"
  #   # )

  #   file_data = File.read!("resources/public_key.pem")
  #   IO.inspect file_data
  #   public_key = JsonWebToken.Algorithm.RsaUtil.public_key(file_data)

  #   {status, claims} = JsonWebToken.verify(jwt, %{key: public_key, alg: "RS384"})

  #   IO.puts "Status: #{status}"
  #   IO.inspect(claims)
  # end
end

