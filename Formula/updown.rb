class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.0.4" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                  url "https://github.com/GloryWong/updown/releases/download/v1.0.4/updown.aarch64-apple-darwin.tar.gz"
                                                                                          sha256 "44b545d72bc09488dd233214321582950d6a5d724d7f06073c1114d2456e3c96"
    else
                                                                                                                  url "https://github.com/GloryWong/updown/releases/download/v1.0.4/updown.x86_64-apple-darwin.tar.gz"
                                                                                          sha256 "d6304f3d4d0e539adbad6905ea04b42162e6b1dc82ea2fb323d84a3952632857"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                  url "https://github.com/GloryWong/updown/releases/download/v1.0.4/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                          sha256 "c30ed93d205f3f2dedfccee0c6a1928e839d90b12744a127d437560c2b69d7a0"
    else
                                                                                                                  url "https://github.com/GloryWong/updown/releases/download/v1.0.4/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                          sha256 "ba30352030fa629057007f781b98007fa00b087e6bd1d7e61edc567f30d34e26"
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
