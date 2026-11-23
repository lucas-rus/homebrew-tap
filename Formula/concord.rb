class Concord < Formula
  desc "Coordinate teams of parallel AI coding agents on one repository"
  homepage "https://github.com/lucas-rus/concord"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "84ff62bd125471b8d7bd724fddd588a60f20faa8e392bdad776f896766ff9ac6"
    end
    on_intel do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6e57dfd9da6b28fb068f0eae730fab8b11bdb146129490fd18b331b4b4406bd9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49a5753d4116d5e4aad94ce1f5d7e2c8d0c08d09073a6973f01b4065098f9687"
    end
    on_intel do
      url "https://github.com/lucas-rus/concord/releases/download/v#{version}/concord-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c7969c29885f96b5b225a79bafe74b9a9d624f7de7f6059a44f1b95623fcb04"
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
