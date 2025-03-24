class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.2.5" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                                                                  url "https://github.com/GloryWong/updown/releases/download/v1.2.5/updown.aarch64-apple-darwin.tar.gz"
                                                                                                                                          sha256 "24145198463587dc31a0bb1ce623986a51aadce1bbbaa4eac5a5859dbea2b68f"
    else
                                                                                                                                                                  url "https://github.com/GloryWong/updown/releases/download/v1.2.5/updown.x86_64-apple-darwin.tar.gz"
                                                                                                                                          sha256 "322be099ecbc1aca73f0c766636e95a0de12fb308e37e1c9edc6c9b19a7c4477"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                                                                  url "https://github.com/GloryWong/updown/releases/download/v1.2.5/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                                                                          sha256 "cde63ea36893f0fa7a50e8cdf9d1b5c66432cd946edae996f1f7450f3cc51764"
    else
                                                                                                                                                                  url "https://github.com/GloryWong/updown/releases/download/v1.2.5/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                                                                          sha256 "e1740051dd3c4b0c8d8b180e3c6f6a2043e23a3c738c46f866342a5b205dd0a9"
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
