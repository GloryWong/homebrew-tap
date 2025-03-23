class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.2.4" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                                                            url "https://github.com/GloryWong/updown/releases/download/v1.2.4/updown.aarch64-apple-darwin.tar.gz"
                                                                                                                                    sha256 "d85b60125bad8d3f8c2281e878a811dd6c69d4296a2dd16f3871739016482dfe"
    else
                                                                                                                                                            url "https://github.com/GloryWong/updown/releases/download/v1.2.4/updown.x86_64-apple-darwin.tar.gz"
                                                                                                                                    sha256 "d520c0a76c9f24d5ee1f9ac253645f70a08353f7d4221147929b786f9240feb3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                                                            url "https://github.com/GloryWong/updown/releases/download/v1.2.4/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                                                                    sha256 "546f8c470a5473e6d98ef1667eb3b049f07d585154747ba04bf01da484bdfd6c"
    else
                                                                                                                                                            url "https://github.com/GloryWong/updown/releases/download/v1.2.4/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                                                                    sha256 "95cdf6a2ab9a552d082c4d64748def78eaffb25f1aef9ed42bbc5346776580c7"
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
