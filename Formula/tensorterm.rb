class Tensorterm < Formula
  desc "Cyberpunk terminal dashboard for ML research paper tracking"
  homepage "https://github.com/RishabhSood/TensorTerm"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RishabhSood/TensorTerm/releases/download/v0.1.1/tensorterm-aarch64-apple-darwin.tar.gz"
      sha256 "de169e88c9a3fecb018c0f3c83b6daa1dff03b270c8c799ddd962ecf740c185e"
    else
      url "https://github.com/RishabhSood/TensorTerm/releases/download/v0.1.1/tensorterm-x86_64-apple-darwin.tar.gz"
      sha256 "a7d43aa909999fce175a5506024ca4a5769e0da331bf12510f474ffaedd45083"
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
