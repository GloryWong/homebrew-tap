class Updown < Formula
  desc "A CLI tool for upload or download files to or from GitHub Gist"
  homepage "https://github.com/GloryWong/updown"
  version "v1.4.2" # This will be updated automatically

  if OS.mac?
    if Hardware::CPU.arm?
                                                                                                                                                                                                url "https://github.com/GloryWong/updown/releases/download/v1.4.2/updown.aarch64-apple-darwin.tar.gz"
                                                                                                                                                                        sha256 "2f6cf58575ccdfb22b2b956088ccb705b8478f71b4e87a404bc3fa9d1b8906db"
    else
                                                                                                                                                                                                url "https://github.com/GloryWong/updown/releases/download/v1.4.2/updown.x86_64-apple-darwin.tar.gz"
                                                                                                                                                                        sha256 "f00263822e30808f15839db84a3336aac43394b3c397e6626c28e33f525cc927"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
                                                                                                                                                                                                url "https://github.com/GloryWong/updown/releases/download/v1.4.2/updown.aarch64-unknown-linux-gnu.tar.gz"
                                                                                                                                                                        sha256 "fb574fa8ce0e1a4876c6935eeeaea62912d4e92db6e1bcecbf748a6add15a7c6"
    else
                                                                                                                                                                                                url "https://github.com/GloryWong/updown/releases/download/v1.4.2/updown.x86_64-unknown-linux-gnu.tar.gz"
                                                                                                                                                                        sha256 "f689b851cab335e73397282fbe75494760dfe443fb9607dd386e6fdd431ba224"
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
    run [opt_bin/"updown", "upload", "--quiet"]
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
