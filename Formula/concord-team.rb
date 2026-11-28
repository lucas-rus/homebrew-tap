class ConcordTeam < Formula
  desc "See what your teammates' AIs are changing, while they change it"
  homepage "https://github.com/lucas-rus/concord/blob/teams/team/README.md"
  url "https://github.com/lucas-rus/concord/releases/download/team-v0.1.0/concord-team-0.1.0.tar.gz"
  sha256 "8a8f3d014ddbbd5d64aed1f2602f437027b22ce1768a3c25fcb924d53397e81d"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "lucas-rus/tap/concordmcp"
  uses_from_macos "python"

  def install
    bin.install "team/concord_team.py" => "concord-team"
  end

  def caveats
    <<~EOS
      concord-team reaches your teammates over Tailscale:
        brew install --cask tailscale   (then open it and log in)

      Start a team in your clone:   concord-team init
      Or join one:                  concord-team join <invite>
      Then:                         concord-team setup claude && concord-team up
    EOS
  end

  test do
    assert_match "concord-team #{version}", shell_output("#{bin}/concord-team --version")
  end
end
