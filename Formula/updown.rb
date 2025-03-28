class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.4.1" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                                                                                          url "https://github.com/GloryWong/updown/releases/download/v1.4.1/updown.aarch64-apple-darwin.tar.gz"
                                                                                                                                                                  sha256 "2449a12563b6eed1d306f353ed91ff8bbcbed84015a62a14251247eb9c67e905"
    else
                                                                                                                                                                                          url "https://github.com/GloryWong/updown/releases/download/v1.4.1/updown.x86_64-apple-darwin.tar.gz"
                                                                                                                                                                  sha256 "257d0eca00168c47e699250afc1284f7385942a80c0610f79d7c8ca343c4922b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                                                                                          url "https://github.com/GloryWong/updown/releases/download/v1.4.1/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                                                                                                  sha256 "b7ce5d9a07a8dbfa4bb1bfe48adab2f38587e2e3ca2331e74406cc5c4c23f52d"
    else
                                                                                                                                                                                          url "https://github.com/GloryWong/updown/releases/download/v1.4.1/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                                                                                                  sha256 "a4a06463aadd29516babd7698dca0dbdc007ffe8d933e67fae0ec633c56350d1"
    end
  end

  def install
    # Rename the binary and install to bin.
    if OS.mac?
      if File.exist? "updown.x86_64-apple-darwin"
        mv "updown.x86_64-apple-darwin", "updown"
      elsif File.exist? "updown.aarch64-apple-darwin"
        mv "updown.aarch64-apple-darwin", "updown"
      end
    elsif OS.linux?
      if File.exist? "updown.x86_64-unknown-linux-gnu"
        mv "updown.x86_64-unknown-linux-gnu", "updown"
      elsif File.exist? "updown.aarch64-unknown-linux-gnu"
        mv "updown.aarch64-unknown-linux-gnu", "updown"
      end
    end

    bin.install "updown"

    # Ensure the ~/.updown/ directory exists
    (Pathname.new(Dir.home)/".updown/logs").mkpath
  end

  service do
    run [opt_bin/"updown", "upload", "--quiet"]
    run_type :cron
    cron "0 15 * * *" # 15:00 every day
    log_path Pathname.new(Dir.home)/".updown/logs/updown-brew-service.log"
    error_log_path Pathname.new(Dir.home)/".updown/logs/updown-brew-service.error.log"
    environment_variables PATH: std_service_path_env
  end

  test do
    system "#{bin}/updown", "--version"
  end
end
