class Doubleshot < Formula
  desc "Like caffeinate, with the lid closed"
  homepage "https://github.com/ashtonmeuser/doubleshot"
  url "https://github.com/ashtonmeuser/doubleshot/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d5f51139a63c0e66fd9e7a5853f6fe78d34bc8efcb6343ff328384a6a9471191"
  revision 1

  bottle do
    root_url "https://github.com/ashtonmeuser/homebrew-tap/releases/download/doubleshot-0.1.0_1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "62c1ef412610a9ed6995366dda3e02353e36af77945d340c5257c418bf17d423"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "99222baec760dbf0f884aa3cfce5e476bd332ee2ebda8fdf2a9c3400c7504302"
  end

  depends_on "go" => :build
  depends_on arch: :arm64
  depends_on :macos

  deny_network_access!

  def install
    ENV["CGO_ENABLED"] = "1"
    system "go", "build", *std_go_args
  end

  test do
    output = shell_output("#{bin}/doubleshot -s")
    assert_match "External monitor:", output
    assert_match "Doubleshot sessions (this user):", output
  end
end
