class WeatherCli < Formula
  desc "A CLI tool for weather information"
  homepage "https://github.com/GloryWong/weather-cli"
  version "v0.0.0" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GloryWong/weather-cli/releases/download/#{version}/weather-cli.aarch64-apple-darwin.tar.gz"
      sha256 "SHA256_AARCH64_DARWIN_PLACEHOLDER"
    else
      url "https://github.com/GloryWong/weather-cli/releases/download/#{version}/weather-cli.x86_64-apple-darwin.tar.gz"
      sha256 "SHA256_X86_64_DARWIN_PLACEHOLDER"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GloryWong/weather-cli/releases/download/#{version}/weather-cli.aarch64-unknown-linux-gnu.tar.gz"
      sha256 "SHA256_AARCH64_LINUX_PLACEHOLDER"
    else
      url "https://github.com/GloryWong/weather-cli/releases/download/#{version}/weather-cli.x86_64-unknown-linux-gnu.tar.gz"
      sha256 "SHA256_X86_64_LINUX_PLACEHOLDER"
    end
  end

  def install
    # Extract the compressed archive.
    system "tar", "-xzf", Dir["*.tar.gz"].first

    # Rename the binary so that it is installed as "weather-cli" or "weather-cli.exe"
    if OS.windows?
      mv "weather-cli.exe", "weather-cli.exe"
      bin.install "weather-cli.exe"
    else
      # For macOS and Linux, assume the binary is named according to the platform-specific filename.
      # Rename to a generic name.
      if File.exist? "weather-cli.x86_64-apple-darwin"
        mv "weather-cli.x86_64-apple-darwin", "weather-cli"
      elsif File.exist? "weather-cli.aarch64-apple-darwin"
        mv "weather-cli.aarch64-apple-darwin", "weather-cli"
      elsif File.exist? "weather-cli.x86_64-unknown-linux-gnu"
        mv "weather-cli.x86_64-unknown-linux-gnu", "weather-cli"
      elsif File.exist? "weather-cli.aarch64-unknown-linux-gnu"
        mv "weather-cli.aarch64-unknown-linux-gnu", "weather-cli"
      end
      bin.install "weather-cli"
    end
  end

  test do
    system "#{bin}/weather-cli", "--version"
  end
end
