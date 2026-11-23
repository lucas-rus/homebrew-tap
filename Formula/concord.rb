class Concord < Formula
  desc "Coordinate teams of parallel AI coding agents on one repository"
  homepage "https://github.com/lucas-rus/concord"
  version "0.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2fcd3667b06783e274d37b8e73c16ad4337caf2ec7ca19f6f56b3214b0f12f42"
    end
    on_intel do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c37904d912c05c0e81ed538552f497db35cf88bff6dd128af12e4555df9d9d03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14eddfad048012e10aab10d59dac72a30eda4b03540d2ab30c135543df9d8509"
    end
    on_intel do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "95ca94cc81f71fbb7ea31839e6962b286961cba14d842de0d47cc413f9984c63"
    end
  end

  def install
    bin.install "concord"
  end

  def caveats
    <<~EOS
      Connect Concord to your coding agent as an MCP server, e.g. in OpenCode:
        "mcp": { "concord": { "type": "local", "command": ["concord", "mcp"] } }
      See https://github.com/lucas-rus/concord#install-and-use-it-from-your-agent-mcp
    EOS
  end

  test do
    assert_match "concord #{version}", shell_output("#{bin}/concord --version")
  end
end
