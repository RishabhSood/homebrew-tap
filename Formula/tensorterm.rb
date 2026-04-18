class Tensorterm < Formula
  desc "Cyberpunk terminal dashboard for ML research paper tracking"
  homepage "https://github.com/RishabhSood/TensorTerm"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RishabhSood/TensorTerm/releases/download/v0.1.2/tensorterm-aarch64-apple-darwin.tar.gz"
      sha256 "834ff83e98c684d20a50f6e667f7a90eb833a5e551d4d2f919fec5f9e324918d"
    else
      url "https://github.com/RishabhSood/TensorTerm/releases/download/v0.1.2/tensorterm-x86_64-apple-darwin.tar.gz"
      sha256 "fb1e9f209508af31cc4c1bdd2f2976e33a7645ee579aee608989cf64823d30ea"
    end
  end

  on_linux do
    url "https://github.com/RishabhSood/TensorTerm/releases/download/v0.1.2/tensorterm-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "445cdaeb59f271e84d771e39d9fd4076c65e065c4457ac2d78839f50aee15b1f"
  end
  
  def install
    bin.install "tensorterm"
  end

  def caveats
    <<~EOS
      Configuration file is created on first run at:
        ~/.config/tensor_term/config.toml

      To edit your config:
        tensorterm --edit-config

      To see the config path:
        tensorterm --config-path

      Press `?` inside the app for the full keybindings overview.
      
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
