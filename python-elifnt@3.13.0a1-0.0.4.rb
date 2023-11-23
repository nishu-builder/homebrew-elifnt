class PythonElifntAT3130a1004 < Formula
    desc "The Elifnt dialect of Python"
    homepage "https://python-elifnt.org/"
    url "https://github.com/nishu-builder/cpython-elifnt/archive/v0.0.4.tar.gz"
    sha256 "0862e0bd41f730456b32697655cbfbf049d515e3223608031452a847b23601ea"
    version "3.13.0a1-0.0.4"

    # setuptools remembers the build flags python is built with and uses them to
    # build packages later. Xcode-only systems need different flags.
    pour_bottle? only_if: :clt_installed

    depends_on "pkg-config" => :build
    depends_on "mpdecimal"
    depends_on "openssl@3"
    depends_on "sqlite"
    depends_on "xz"

    uses_from_macos "bzip2"
    uses_from_macos "expat"
    uses_from_macos "libedit"
    uses_from_macos "libffi", since: :catalina
    uses_from_macos "libxcrypt"
    uses_from_macos "ncurses"
    uses_from_macos "unzip"
    uses_from_macos "zlib"

    on_linux do
        depends_on "berkeley-db@5"
        depends_on "libnsl"
    end

    def install
        system "./configure", "--prefix=#{prefix}"
        system "make"
        system "make", "install"
    end

    test do
        system bin/"python-elifnt", "-c", "print('Hello from Elifnt', None?.a)"
    end
end
