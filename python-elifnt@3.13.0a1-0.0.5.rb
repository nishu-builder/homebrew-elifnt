class PythonElifntAT3130a1005 < Formula
    desc "The Elifnt dialect of Python"
    homepage "https://python-elifnt.org/"
    url "https://github.com/nishu-builder/cpython-elifnt/archive/v0.0.5.tar.gz"
    sha256 "e682319c82b86679fc165d4cddd0c326e10004142a39356298fb2d85b4e5b81d"
    version "3.13.0a1-0.0.5"

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
