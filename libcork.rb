require 'formula'

class Libcork < Formula
  homepage 'https://github.com/redjack/libcork/'
  version '0.13.1'
  url 'https://github.com/redjack/libcork.git', :branch => 'master'
  head 'https://github.com/redjack/libcork.git', :branch => 'develop'

  depends_on 'cmake' => :build
  depends_on 'check' => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make install"
    end
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/cork-hash", "homebrew-test") do |stdin, stdout, _|
      assert_equal "0xa2ac878d\n", stdout.read
    end
  end

end
