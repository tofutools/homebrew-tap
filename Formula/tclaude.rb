class Tclaude < Formula
  desc "Tmux-based multi-agent session manager for Claude Code and Codex CLI"
  homepage "https://github.com/tofutools/tclaude"
  url "https://github.com/tofutools/tclaude/archive/refs/tags/v0.0.445.tar.gz"
  sha256 "a310dafabfa3ecacda0376c5d684ce2cfd953a3a8e8d614710e1b00aa32f7e23"
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
