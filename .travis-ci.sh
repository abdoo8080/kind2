# Install z3.
if [ "$TRAVIS_OS_NAME" = "linux" ]; then
  z3_version="z3-4.7.1-x64-ubuntu-14.04"
  install_dir="/usr/bin/z3"
  echo "deb http://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/ ./" >> /etc/apt/sources.list
  wget https://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/Release.key -O- | sudo apt-key add
  sudo apt-get install libzmq3-dev
elif [ "$TRAVIS_OS_NAME" = "osx" ]; then 
  z3_version="z3-4.7.1-x64-osx-10.11.6"
  install_dir="/usr/local/bin/z3"
  brew install zeromq
fi

wget "https://github.com/Z3Prover/z3/releases/download/z3-4.7.1/${z3_version}.zip"
unzip "${z3_version}.zip"
sudo cp "${z3_version}/bin/z3" $install_dir

# Retrieve opam.
wget -qq https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh -O - | sh -s
opam init
y

# Install ocaml packages needed for Kind 2.
opam install -t -v .
