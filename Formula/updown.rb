class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.5.0" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
            url "https://github.com/GloryWong/updown/releases/download/v1.5.0/updown.aarch64-apple-darwin.tar.gz"
            sha256 "17e81b19c43e6efdff3853d917802ac563eecf5677249b39b20ca9170258e9d8"
    else
            url "https://github.com/GloryWong/updown/releases/download/v1.5.0/updown.x86_64-apple-darwin.tar.gz"
            sha256 "06bc30491596e13deb921446c3af7dd0ef7015f37242c5deb4faf00b1a32896b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
            url "https://github.com/GloryWong/updown/releases/download/v1.5.0/updown.aarch64-unknown-linux-gnu.tar.gz"
            sha256 "910fff4b5d962302accebaebe935d7315eb0976d219d0b1ddf946e7ef23b3f77"
    else
            url "https://github.com/GloryWong/updown/releases/download/v1.5.0/updown.x86_64-unknown-linux-gnu.tar.gz"
            sha256 "48831e15073258a4b7663b9184e84dae5bc6854e78a02a6013bdf25241958f4a"
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

    # Ensure the ~/.updown/ directory exists
    (Pathname.new(Dir.home)/".updown/logs").mkpath
  end

  service do
    run [opt_bin/"updown", "upload", "--quiet", "--notify"]
    run_type :cron
    cron "0 15 * * *" # 15:00 every day
    log_path Pathname.new(Dir.home)/".updown/logs/updown-brew-service.log"
    error_log_path Pathname.new(Dir.home)/".updown/logs/updown-brew-service.error.log"
    environment_variables PATH: std_service_path_env
  end

  test do
    system "#{bin}/updown", "--version"
  end
end
