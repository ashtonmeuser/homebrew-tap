class Doubleshot < Formula
  desc "Like caffeinate, with the lid closed"
  homepage "https://github.com/ashtonmeuser/doubleshot"
  url "https://github.com/ashtonmeuser/doubleshot/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d5f51139a63c0e66fd9e7a5853f6fe78d34bc8efcb6343ff328384a6a9471191"

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
