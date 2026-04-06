class Tensorterm < Formula
  desc "Cyberpunk terminal dashboard for ML research paper tracking"
  homepage "https://github.com/RishabhSood/TensorTerm"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RishabhSood/TensorTerm/releases/download/v0.1.0/tensorterm-aarch64-apple-darwin.tar.gz"
      sha256 "sha256:b3b11b2865105fb658e90bc8ae94667620ba9cf782f738e9896f1d63109c27cc"
    else
      url "https://github.com/RishabhSood/TensorTerm/releases/download/v0.1.0/tensorterm-x86_64-apple-darwin.tar.gz"
      sha256 "sha256:f730bc6b32abac18ecbc225585c5f902e68b2c487dfb8fdad8598baacfe9ff2f"
    end
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
