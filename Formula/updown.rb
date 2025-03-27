class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.4.0" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                                                                                    url "https://github.com/GloryWong/updown/releases/download/v1.4.0/updown.aarch64-apple-darwin.tar.gz"
                                                                                                                                                            sha256 "46049f15b4abad8cdd5d3de0eca280e29d2dde3ad1309e069cb69a332a079762"
    else
                                                                                                                                                                                    url "https://github.com/GloryWong/updown/releases/download/v1.4.0/updown.x86_64-apple-darwin.tar.gz"
                                                                                                                                                            sha256 "513de8585e1548ba7123f28423bdee98111b011d921b5354e86627c237b617ad"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                                                                                    url "https://github.com/GloryWong/updown/releases/download/v1.4.0/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                                                                                            sha256 "e81da81590ea277afbbbe7fed29c5eb090228e65ca4c54400af7e9cd0891187a"
    else
                                                                                                                                                                                    url "https://github.com/GloryWong/updown/releases/download/v1.4.0/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                                                                                            sha256 "543370ef47063871152acb0e9c50d5452de2401fbb84853c3ecf05fd2bafacf0"
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
    run [opt_bin/"updown", "upload"]
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
