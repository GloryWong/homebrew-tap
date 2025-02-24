class WeatherCli < Formula
  desc "A CLI tool for weather information"
  homepage "https://github.com/GloryWong/weather-cli"
  version "v1.0.17" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                              url "https://github.com/GloryWong/weather-cli/releases/download/v1.0.17/weather-cli.aarch64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
                              url "https://github.com/GloryWong/weather-cli/releases/download/v1.0.17/weather-cli.x86_64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                              url "https://github.com/GloryWong/weather-cli/releases/download/v1.0.17/weather-cli.aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
                              url "https://github.com/GloryWong/weather-cli/releases/download/v1.0.17/weather-cli.x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  def install
    # Extract the compressed archive.
    system "tar", "-xzf", Dir["*.tar.gz"].first

    # Rename the binary so that it is installed as "weather-cli" or "weather-cli.exe"
    if OS.windows?
      mv "weather-cli.exe", "weather.exe"
      bin.install "weather.exe"
    else
      # For macOS and Linux, assume the binary is named according to the platform-specific filename.
      # Rename to a generic name.
      if File.exist? "weather-cli.x86_64-apple-darwin"
        mv "weather-cli.x86_64-apple-darwin", "weather"
      elsif File.exist? "weather-cli.aarch64-apple-darwin"
        mv "weather-cli.aarch64-apple-darwin", "weather"
      elsif File.exist? "weather-cli.x86_64-unknown-linux-gnu"
        mv "weather-cli.x86_64-unknown-linux-gnu", "weather"
      elsif File.exist? "weather-cli.aarch64-unknown-linux-gnu"
        mv "weather-cli.aarch64-unknown-linux-gnu", "weather"
      end
      bin.install "weather"
    end
  end

  test do
    system "#{bin}/weather-cli", "--version"
  end
end
