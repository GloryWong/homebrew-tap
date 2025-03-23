class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.2.3" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                                                      url "https://github.com/GloryWong/updown/releases/download/v1.2.3/updown.aarch64-apple-darwin.tar.gz"
                                                                                                                              sha256 "0a16d80496dd809ab8a6d3e506189d4cda2a0f84aa64afebda8813e028aea026"
    else
                                                                                                                                                      url "https://github.com/GloryWong/updown/releases/download/v1.2.3/updown.x86_64-apple-darwin.tar.gz"
                                                                                                                              sha256 "2108eecee1265d17260c0d66300bfabcfee9b6457c9792ec9f765a8e0486854d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                                                      url "https://github.com/GloryWong/updown/releases/download/v1.2.3/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                                                              sha256 "ce90dc4df227be3a3b72c24e56a7c21da136fb0b6d3804746d9a32b0aa1a3a92"
    else
                                                                                                                                                      url "https://github.com/GloryWong/updown/releases/download/v1.2.3/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                                                              sha256 "9d668761133bca25da7aaba04caa7d5016bc6f5fb800b54e0e2c902f08ed9e40"
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
  end

  test do
    system "#{bin}/updown", "--version"
  end
end
