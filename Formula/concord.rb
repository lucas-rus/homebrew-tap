class Concord < Formula
  desc "Coordinate teams of parallel AI coding agents on one repository"
  homepage "https://github.com/lucas-rus/concord"
  version "0.1.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "83ed6ffb150076309eb62f56381f3cab58d664d96154be6b7f977f0585568766"
    end
    on_intel do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1dfb655ad25c823008ce67121177fa0b9fde8390a946480f6165ef4b7c055544"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c81fd2e74dda6a4791980ef67ba70f8bf6ae64e73d9b236f966af596542517a"
    end
    on_intel do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2f75ce995fc06721b7a6b671f90ba03e3b925cf6626fa7202f20c669e1677f4"
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
