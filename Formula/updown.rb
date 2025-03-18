class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.1.0" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                              url "https://github.com/GloryWong/updown/releases/download/v1.1.0/updown.aarch64-apple-darwin.tar.gz"
                                                                                                      sha256 "e4ce4be2fd804931bd0e1483c5ea06b66e3619e66d60799e947b87acbd90471b"
    else
                                                                                                                              url "https://github.com/GloryWong/updown/releases/download/v1.1.0/updown.x86_64-apple-darwin.tar.gz"
                                                                                                      sha256 "d6824bcc7eb70ce841293d8c96ae11643def7432528fe2a956910c8209071185"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                              url "https://github.com/GloryWong/updown/releases/download/v1.1.0/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                                      sha256 "f9cf6be642245519c4612733dfc1f1a7bcaf6e27aec5c2ecbb835a79b59e64b2"
    else
                                                                                                                              url "https://github.com/GloryWong/updown/releases/download/v1.1.0/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                                      sha256 "763bebc143e7ee7af113f13b6e9004c07e0c9d24294a05ac4ae3658e2d3a6eb0"
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
