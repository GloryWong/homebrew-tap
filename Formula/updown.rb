class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.2.1" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                                          url "https://github.com/GloryWong/updown/releases/download/v1.2.1/updown.aarch64-apple-darwin.tar.gz"
                                                                                                                  sha256 "a437c8c5aaec4851ee739e7b8327b28cedac80f254e0f088e50151341cd58c6b"
    else
                                                                                                                                          url "https://github.com/GloryWong/updown/releases/download/v1.2.1/updown.x86_64-apple-darwin.tar.gz"
                                                                                                                  sha256 "9d9e313492e645126fd0a01022a5f20b5a6b915a7c3376c33100e07715059d4f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                                          url "https://github.com/GloryWong/updown/releases/download/v1.2.1/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                                                  sha256 "a7aa99cbf2e7fedb6f802486cf376825d69fc68a534af5843fdf3e20b90664d4"
    else
                                                                                                                                          url "https://github.com/GloryWong/updown/releases/download/v1.2.1/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                                                  sha256 "6bd8f4dd4cb4b28a05e49f20a2b3274342eae9abaf5ae0ae1498fae6ee0df49e"
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
