class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.3.1" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                                                                              url "https://github.com/GloryWong/updown/releases/download/v1.3.1/updown.aarch64-apple-darwin.tar.gz"
                                                                                                                                                      sha256 "8c7162a3c05d888ed8e93df73e8cea60665ac50a9b0a99b0fca52e52b13752ae"
    else
                                                                                                                                                                              url "https://github.com/GloryWong/updown/releases/download/v1.3.1/updown.x86_64-apple-darwin.tar.gz"
                                                                                                                                                      sha256 "99c29281d67e3bd2661ecb75dd4c317f13a68e020f48bc5083b3df61a39bd283"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                                                                              url "https://github.com/GloryWong/updown/releases/download/v1.3.1/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                                                                                      sha256 "b120106238a8a183fcba876d709d6db442750d11d207319d941f416f6ab3b285"
    else
                                                                                                                                                                              url "https://github.com/GloryWong/updown/releases/download/v1.3.1/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                                                                                      sha256 "b589c3fb799b63502bc4d7d53c4e4bd70d91680bce5eb5fbabdf1e05fc4d7209"
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
