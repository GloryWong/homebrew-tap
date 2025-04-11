# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Proyecto < Formula
  desc "Proyecto is a lightweight CLI tool for managing local projects"
  homepage "https://github.com/GloryWong/proyecto"
  version "2.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GloryWong/proyecto/releases/download/v2.2.2/proyecto_2.2.2_darwin_amd64.tar.gz"
      sha256 "724e85b6b9b8bc1a483506dd1054cf641b8288ddeaeafca1d0cf8e167ac0c6f0"

      def install
        bin.install "proyecto"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/GloryWong/proyecto/releases/download/v2.2.2/proyecto_2.2.2_darwin_arm64.tar.gz"
      sha256 "576631df474064967b0b73a4336fbcfd2d2f3dde195d7911a8ac4fb756acff2c"

      def install
        bin.install "proyecto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/GloryWong/proyecto/releases/download/v2.2.2/proyecto_2.2.2_linux_amd64.tar.gz"
        sha256 "b89035c0acba55da32931f65af6a1fffe0772135ce6791eee229ac378bde5ea6"

        def install
          bin.install "proyecto"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/GloryWong/proyecto/releases/download/v2.2.2/proyecto_2.2.2_linux_arm64.tar.gz"
        sha256 "ee687ebf235e86d0801d33fffa9ea2c662db4cf566d5575f3ef6c96d42bf09d1"

        def install
          bin.install "proyecto"
        end
      end
    end
  end

  def caveats
    <<~EOS
      proyecto --help
    EOS
  end

  test do
    system "#{bin}/proyecto --version"
  end
end
