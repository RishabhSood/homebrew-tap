class Tensorterm < Formula
  desc "Cyberpunk terminal dashboard for ML research paper tracking"
  homepage "https://github.com/RishabhSood/TensorTerm"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RishabhSood/TensorTerm/releases/download/v0.1.1/tensorterm-aarch64-apple-darwin.tar.gz"
      sha256 "464c2103ace0dba17ec216b27d5055921c3ec0034ed986531ad969e3c3976eb0"
    else
      url "https://github.com/RishabhSood/TensorTerm/releases/download/v0.1.1/tensorterm-x86_64-apple-darwin.tar.gz"
      sha256 "3b58227b85210976af3f113a307fe3a7975fd6613d83e00c701a0e36084e887c"
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
