class Tclaude < Formula
  desc "Tmux-based multi-agent session manager for Claude Code and Codex CLI"
  homepage "https://github.com/tofutools/tclaude"
  url "https://github.com/tofutools/tclaude/archive/refs/tags/v0.0.443.tar.gz"
  sha256 "cad40cfb2395e72caab331df5ac8d4ed569c2960669478c18fb42c9dd9d00851"
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
