cask "fromcask" do
  version "0.3.11"
  
  name "Homebrew Example"
  desc "An example Go application distributed as a binary"
  homepage "https://github.com/theothertomelliott/homebrew-example"

  # macOS Intel (x86_64)
  on_intel do
    url "https://github.com/theothertomelliott/homebrew-example/releases/download/v#{version}/homebrew-example-darwin-amd64.tar.gz"
    sha256 "INTEL_SHA256_PLACEHOLDER"
  end

  # macOS Apple Silicon (ARM64)
  on_arm do
    url "https://github.com/theothertomelliott/homebrew-example/releases/download/v#{version}/homebrew-example-darwin-arm64.tar.gz"
    sha256 "ARM64_SHA256_PLACEHOLDER"
  end

  # Linux x86_64
  on_system :linux, macos: false do
    on_arch :x86_64 do
      url "https://github.com/theothertomelliott/homebrew-example/releases/download/v#{version}/homebrew-example-linux-amd64.tar.gz"
      sha256 "LINUX_AMD64_SHA256_PLACEHOLDER"
    end
  end

  # Linux ARM64
  on_system :linux, macos: false do
    on_arch :arm64 do
      url "https://github.com/theothertomelliott/homebrew-example/releases/download/v#{version}/homebrew-example-linux-arm64.tar.gz"
      sha256 "LINUX_ARM64_SHA256_PLACEHOLDER"
    end
  end

  # Linux ARM (32-bit)
  on_system :linux, macos: false do
    on_arch :arm do
      url "https://github.com/theothertomelliott/homebrew-example/releases/download/v#{version}/homebrew-example-linux-arm.tar.gz"
      sha256 "LINUX_ARM_SHA256_PLACEHOLDER"
    end
  end

  # Windows x86_64
  on_system :windows, macos: false do
    on_arch :x86_64 do
      url "https://github.com/theothertomelliott/homebrew-example/releases/download/v#{version}/homebrew-example-windows-amd64.zip"
      sha256 "WINDOWS_AMD64_SHA256_PLACEHOLDER"
    end
  end

  # Windows ARM64
  on_system :windows, macos: false do
    on_arch :arm64 do
      url "https://github.com/theothertomelliott/homebrew-example/releases/download/v#{version}/homebrew-example-windows-arm64.zip"
      sha256 "WINDOWS_ARM64_SHA256_PLACEHOLDER"
    end
  end

  binary "homebrew-example"
  binary "homebrew-example.exe", target: "homebrew-example" if OS.windows?
end
