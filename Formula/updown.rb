class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.0.5" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                        url "https://github.com/GloryWong/updown/releases/download/v1.0.5/updown.aarch64-apple-darwin.tar.gz"
                                                                                                sha256 "32eef40949c04a31fa02e7b8c9f8619d4453b9bd96006f790af259340e5ee8e2"
    else
                                                                                                                        url "https://github.com/GloryWong/updown/releases/download/v1.0.5/updown.x86_64-apple-darwin.tar.gz"
                                                                                                sha256 "87290e16c6eb5dc21b109203e73e72409678fc3345807edc0d1eb192178e1a5d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                        url "https://github.com/GloryWong/updown/releases/download/v1.0.5/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                                sha256 "efab625bdcdc2e7424a91df5202709391d449713e31ed546c577575af2acbef2"
    else
                                                                                                                        url "https://github.com/GloryWong/updown/releases/download/v1.0.5/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                                sha256 "79282b03329c4f8e2a531c5737a915def3834dab59cef9c712e01a3d51e4bab5"
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
