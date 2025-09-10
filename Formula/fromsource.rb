class Fromsource < Formula
  desc "An example installing a Go app from source"
  url "https://github.com/theothertomelliott/homebrew-example.git",
      tag:      "v0.0.2",
      revision: "0b2cebbda8eb92c977b246c19e8bd21e5226c752"
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
