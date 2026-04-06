class TensorTerm < Formula
  desc "Cyberpunk terminal dashboard for ML research paper tracking"
  homepage "https://github.com/RishabhSood/TensorTerm"
  url "https://github.com/RishabhSood/TensorTerm/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8e371bec04ee7f2d29cd9ab41621e2c80f8883669e10f8d3a576f7a0287aebb6"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Configuration file is created on first run at:
        ~/.config/tensor_term/config.toml

      To edit your config:
        tensorterm --edit-config

      To see the config path:
        tensorterm --config-path

      API keys can be set via environment variables:
        export ANTHROPIC_API_KEY="sk-ant-..."
        export OPENAI_API_KEY="sk-..."
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tensorterm --version")
    assert_match "config.toml", shell_output("#{bin}/tensorterm --config-path")
  end
end
