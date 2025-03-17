class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                url "https://github.com/GloryWong/updown/releases/download/v0.0.0/updown.aarch64-apple-darwin.tar.gz"
                        sha256 "5ca44c9c4860a9213036b18da25373544efac9fd246ebbac089490f816305b85"
    else
                                                url "https://github.com/GloryWong/updown/releases/download/v0.0.0/updown.x86_64-apple-darwin.tar.gz"
                        sha256 "1c1dd19b26e814f62358b9b3bb76f54453c2abbe99bdc6240b2c65fa6c926300"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                url "https://github.com/GloryWong/updown/releases/download/v0.0.0/updown.aarch64-unknown-linux-gnu.tar.gz"
                        sha256 "8da79cce189f72e493a1cc2c743b9d25ed42036ccddafb58c11356913577c2dd"
    else
                                                url "https://github.com/GloryWong/updown/releases/download/v0.0.0/updown.x86_64-unknown-linux-gnu.tar.gz"
                        sha256 "3862d0b28e00aa3398c1903437ee1e70d660b22b222de96e4fb3adbff3611a09"
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
