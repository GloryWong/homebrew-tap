class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.2.0" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                                    url "https://github.com/GloryWong/updown/releases/download/v1.2.0/updown.aarch64-apple-darwin.tar.gz"
                                                                                                            sha256 "e1ab121aafedd4cc7dc2993991842c1581a9b9187b7a1b540f9b9ea5333689da"
    else
                                                                                                                                    url "https://github.com/GloryWong/updown/releases/download/v1.2.0/updown.x86_64-apple-darwin.tar.gz"
                                                                                                            sha256 "f9f8df384aca9f9645b19d59a4195bd5359818138375f787ca02e33c4fa58b2b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                                    url "https://github.com/GloryWong/updown/releases/download/v1.2.0/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                                            sha256 "4bf85d389ff63f6a8843121f9a8eebfa5b74cb47849f614f252ea9c2ffebb457"
    else
                                                                                                                                    url "https://github.com/GloryWong/updown/releases/download/v1.2.0/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                                            sha256 "8f889cb2ea016e1a58d8712f6ab7e3e83d62245046927030809e36612eb5708b"
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
