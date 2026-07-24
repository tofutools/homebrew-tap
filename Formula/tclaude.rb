class Tclaude < Formula
  desc "Tmux-based multi-agent session manager for Claude Code and Codex CLI"
  homepage "https://github.com/tofutools/tclaude"
  url "https://github.com/tofutools/tclaude/archive/refs/tags/v0.0.1363.tar.gz"
  sha256 "13b00d68c2d0403a516281cf5589ce77b349e073cf70c92b10b37f3c89f32960"
  license "MIT"
  head "https://github.com/tofutools/tclaude.git", branch: "main"

  depends_on "go" => :build
  depends_on "tmux"

  def install
    # -X main.version stamps the version into the binary so `tclaude --version`
    # reports it (a source-tree build has no module version otherwise). v#{version}
    # matches the upstream release tag, e.g. v0.0.446. No-op on older tags that
    # predate the main.version variable.
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}")
  end

  def caveats
    <<~EOS
      tclaude is installed but NOT yet configured. Run the one-time setup to wire
      it into your coding harness (installs Claude Code hooks, the status bar, and
      the clickable-notification handler):

        tclaude setup

      Most users also want the agent-coordination extras:

        tclaude setup --install-agent-skills --install-default-agent-permissions

      Run `tclaude setup --help` for every --install-* option (or --install-all),
      and see the installation guide:
        https://tofutools.github.io/tclaude/#installation
    EOS
  end

  test do
    assert_match "tclaude", shell_output("#{bin}/tclaude --help 2>&1")
  end
end
