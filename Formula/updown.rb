class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.2.2" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                                                url "https://github.com/GloryWong/updown/releases/download/v1.2.2/updown.aarch64-apple-darwin.tar.gz"
                                                                                                                        sha256 "ed09e983e2438599764426e5524b9e3ceec89c1b461ddd74d4ee76b83c5f9103"
    else
                                                                                                                                                url "https://github.com/GloryWong/updown/releases/download/v1.2.2/updown.x86_64-apple-darwin.tar.gz"
                                                                                                                        sha256 "37aff822523c6bd5f4cdb3ee5d71d71ed19a06e8233ea604e36271b627240426"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                                                url "https://github.com/GloryWong/updown/releases/download/v1.2.2/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                                                        sha256 "b04ecf39b44b4530ef6d318233055708b4c2efd950b216145cf6ec9e46dd0622"
    else
                                                                                                                                                url "https://github.com/GloryWong/updown/releases/download/v1.2.2/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                                                        sha256 "c24c1ff7fdf244f7a5fa3adf67680b5b0046b9ecaee956e29e40cdcc8c6be490"
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
