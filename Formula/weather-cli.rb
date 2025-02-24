class WeatherCli < Formula
  desc "A CLI tool for weather information"
  homepage "https://github.com/GloryWong/weather-cli"
  version "v1.0.18" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                    url "https://github.com/GloryWong/weather-cli/releases/download/v1.0.18/weather-cli.aarch64-apple-darwin.tar.gz"
            sha256 "be97003bda1d9ec9c931a15a3ec038bbd1caac7a8701cd551839c608d182c4d6"
    else
                                    url "https://github.com/GloryWong/weather-cli/releases/download/v1.0.18/weather-cli.x86_64-apple-darwin.tar.gz"
            sha256 "8014ca7c63fb2a2378a6fc58874250817b6b16e5317e7de9bbe5f0e65b3b38fb"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                    url "https://github.com/GloryWong/weather-cli/releases/download/v1.0.18/weather-cli.aarch64-unknown-linux-gnu.tar.gz"
            sha256 "5ed30251d4fc568816019ff70ca08dd463311f61c7efd05baa612e4c9000712c"
    else
                                    url "https://github.com/GloryWong/weather-cli/releases/download/v1.0.18/weather-cli.x86_64-unknown-linux-gnu.tar.gz"
            sha256 "e5026f1eaf1b541fd5a535e73bfe53e75da38eb797401e9ebcc30129fb2aece2"
    end
  end

  def install
    # Extract the compressed archive.
    # system "tar", "-xzf", Dir["*.tar.gz"].first

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
