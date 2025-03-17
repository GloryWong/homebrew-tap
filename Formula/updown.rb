class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.0.1" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                          url "https://github.com/GloryWong/updown/releases/download/v1.0.1/updown.aarch64-apple-darwin.tar.gz"
                                                                  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
                                                                                          url "https://github.com/GloryWong/updown/releases/download/v1.0.1/updown.x86_64-apple-darwin.tar.gz"
                                                                  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                          url "https://github.com/GloryWong/updown/releases/download/v1.0.1/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
                                                                                          url "https://github.com/GloryWong/updown/releases/download/v1.0.1/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
