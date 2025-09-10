class Fromsource < Formula
  desc "An example installing a Go app from source"
  url "https://github.com/theothertomelliott/homebrew-example.git",
      tag:      "v0.3.11",
      revision: "3decca51762304c12ab9eae7f290cf9a0416f859"
  license "MIT"
  head "https://github.com/theothertomelliott/homebrew-example.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(), "."
  end

  test do
    system "#{bin}/homebrew-example"
  end
end
