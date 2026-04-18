class Tensorterm < Formula
  desc "Cyberpunk terminal dashboard for ML research paper tracking"
  homepage "https://github.com/RishabhSood/TensorTerm"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RishabhSood/TensorTerm/releases/download/v0.1.2/tensorterm-aarch64-apple-darwin.tar.gz"
      sha256 "3e3b1d9fbef0d6eb38ac650e027845f6d709d76b6ddfa02098f0b7be3b84b142"
    else
      url "https://github.com/RishabhSood/TensorTerm/releases/download/v0.1.2/tensorterm-x86_64-apple-darwin.tar.gz"
      sha256 "b61615b63a166cb2409b3c98eceff9bc86c84f7fc56e3da2531103eda6d959d4"
    end
  end

  on_linux do
    url "https://github.com/RishabhSood/TensorTerm/releases/download/v0.1.2/tensorterm-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b38ed9c50d32f712d623fc823eb6d1d7cae5e166ab21607f3281047ed479f925"
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
