class Doubleshot < Formula
  desc "Like caffeinate, with the lid closed"
  homepage "https://github.com/ashtonmeuser/doubleshot"
  url "https://github.com/ashtonmeuser/doubleshot/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "a00e232d32b797da7386e8528f01ba32d5a9fa69b1435b1806f90b429459a654"

  bottle do
    root_url "https://github.com/ashtonmeuser/homebrew-tap/releases/download/doubleshot-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "ba0b6372a004a5b845858a6854cd7b991fafd0bdfcc4a42a2d227ee9079e43ec"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c48bb528d024bf925a12656ab64c6cb50c6171d3f980250bb466294918f5bada"
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
