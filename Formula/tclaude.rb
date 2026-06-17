class Tclaude < Formula
  desc "Tmux-based multi-agent session manager for Claude Code and Codex CLI"
  homepage "https://github.com/tofutools/tclaude"
  url "https://github.com/tofutools/tclaude/archive/refs/tags/v0.0.438.tar.gz"
  sha256 "463a15ef70d8c1ee5bf6d37443fca0d25d4c2a7721cdaa1adeb3fb0152dbfcc9"
  license "MIT"
  head "https://github.com/tofutools/tclaude.git", branch: "main"

  depends_on "go" => :build
  depends_on "tmux"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "tclaude", shell_output("#{bin}/tclaude --help 2>&1")
  end
end
