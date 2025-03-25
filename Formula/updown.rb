class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.3.0" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                                                                        url "https://github.com/GloryWong/updown/releases/download/v1.3.0/updown.aarch64-apple-darwin.tar.gz"
                                                                                                                                                sha256 "39b334c8fd846caaf1aff592fdc2e175f84abc43b15a7d5a9fea7e740264b7f6"
    else
                                                                                                                                                                        url "https://github.com/GloryWong/updown/releases/download/v1.3.0/updown.x86_64-apple-darwin.tar.gz"
                                                                                                                                                sha256 "bcd7ed910427748c492750348a38b001980b36dea6999608958cf902307e390e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                                                                        url "https://github.com/GloryWong/updown/releases/download/v1.3.0/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                                                                                sha256 "9d4e49f608616aaa7a9bc0c09180a3e5e96045173dc1ede601c613508a99c22c"
    else
                                                                                                                                                                        url "https://github.com/GloryWong/updown/releases/download/v1.3.0/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                                                                                sha256 "60ae41f7ce4ebbabbaecc4e80f2c2c0c1379f5a81e07c228cf977d5222209f8f"
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
