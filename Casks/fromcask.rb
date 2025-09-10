## This example will fall foul of a gatekeeper error on recent MacOS versions.
## ../Formulae/fromsource.rb demonstrates a working example building from source.
cask "fromcask" do
  version "0.0.2"
  
  name "Homebrew Example"
  desc "An example Go application distributed as a binary"
  homepage "https://github.com/theothertomelliott/homebrew-example"

  on_intel do
    url "https://github.com/theothertomelliott/homebrew-example/releases/download/v#{version}/homebrew-example-darwin-amd64.tar.gz"
    sha256 "b6a53e31c9589af4652c83d2e30b466dd7056c50bd50302fa086408c2d3b78d2"
    binary "homebrew-example-darwin-amd64/homebrew-example", target: "fromcask"
  end

  on_arm do
    url "https://github.com/theothertomelliott/homebrew-example/releases/download/v#{version}/homebrew-example-darwin-arm64.tar.gz"
    sha256 "8ef6aba23c7875cc9f9a9fdee859d3e9c379283cb79677f583cf9f6d595c68fb"
    binary "homebrew-example-darwin-arm64/homebrew-example", target: "fromcask"
  end
end
