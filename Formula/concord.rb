class Concord < Formula
  desc "Contract-level coherence and smart merging for parallel AI coding agents"
  homepage "https://github.com/lucas-rus/concord"
  version "0.1.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e01bfd8664bdc5efc35b6d07fc1d9afb916619bd89930347f6c2ca0312ec50dc"
    end
    on_intel do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3450ad6d942f57a6347b532f7707187e02e52d515fbfa1e28572fd4ceef5b17f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e9db8b7ff143a3ec98e9250658b1214c5e265144bab686f73ed045117b9b8a3"
    end
    on_intel do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "13be11f6d8a1870bd0daab68aed24867ed8cde42f2e7fad99febdc98834b2bcc"
    end
  end

  def install
    bin.install "concord"
  end

  def caveats
    <<~EOS
      Connect Concord to OpenCode, Claude Code, or Cursor automatically:
        concord setup
      See https://github.com/lucas-rus/concord#install-and-use-it-from-your-agent-mcp
    EOS
  end

  test do
    assert_match "concord #{version}", shell_output("#{bin}/concord --version")
  end
end
