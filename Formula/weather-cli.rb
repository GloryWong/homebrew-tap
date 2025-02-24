class WeatherCli < Formula
  desc "A CLI tool for weather information"
  homepage "https://github.com/GloryWong/weather-cli"
  version "v1.1.0" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                          url "https://github.com/GloryWong/weather-cli/releases/download/v1.1.0/weather-cli.aarch64-apple-darwin.tar.gz"
                  sha256 "50e5cce2a5267dc520cf5246210cb1d0ac1a9c26f9941a7a91c3aa09db9671ed"
    else
                                          url "https://github.com/GloryWong/weather-cli/releases/download/v1.1.0/weather-cli.x86_64-apple-darwin.tar.gz"
                  sha256 "38211d4bfc4a31917967cf9a3e9706c036a8d99185f3faef5ba4d92e5a02e61c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                          url "https://github.com/GloryWong/weather-cli/releases/download/v1.1.0/weather-cli.aarch64-unknown-linux-gnu.tar.gz"
                  sha256 "b247ab25cec8f4a5bd27809429166a92d6f9c4a940f7b5243169f957e64cbe57"
    else
                                          url "https://github.com/GloryWong/weather-cli/releases/download/v1.1.0/weather-cli.x86_64-unknown-linux-gnu.tar.gz"
                  sha256 "4cb24b1aeb1ab0804bb1db42fb1214f48a2726ff0958607038dc10f222da0879"
    end
  end

  def install
    # Rename the binary and install to bin.
    if OS.mac?
      if File.exist? "weather-cli.x86_64-apple-darwin"
        mv "weather-cli.x86_64-apple-darwin", "weather"
      elsif File.exist? "weather-cli.aarch64-apple-darwin"
        mv "weather-cli.aarch64-apple-darwin", "weather"
      end
    elsif OS.linux?
      if File.exist? "weather-cli.x86_64-unknown-linux-gnu"
        mv "weather-cli.x86_64-unknown-linux-gnu", "weather"
      elsif File.exist? "weather-cli.aarch64-unknown-linux-gnu"
        mv "weather-cli.aarch64-unknown-linux-gnu", "weather"
      end
    end

    bin.install "weather"
  end

  test do
    system "#{bin}/weather-cli", "--version"
  end
end
