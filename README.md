updoot ![status: alpha](https://img.shields.io/badge/status-alpha-red?style=flat) [![version](https://img.shields.io/github/v/tag/b0o/updoot?style=flat&color=yellow&label=version&sort=semver)](https://github.com/b0o/updoot/releases) [![license: gpl-3.0-or-later](https://img.shields.io/github/license/b0o/updoot?style=flat&color=green)](https://opensource.org/licenses/GPL-3.0)
===


```
updoot v0.0.1
https://github.com/b0o/updoot

Unify the update process for your entire system.

Usage:
  updoot [options] [--] [provider-spec ...]

  Where [provider-spec] is one of:
    ++provider   inclusive: enable this provider in addition to the default providers
     +provider

      provider   exclusive: enable this provider, disabling default providers

    --provider   ignore this provider from the default providers
     -provider   (after --, see below)

  A lone -- indicates the end of the options, thereafter allowing the use of a single leading - to
  ignore providers as described above.

Options:
  -h       show brief usage information
  -H       show detailed usage information
  -V       show program version
  -s       enable strict mode
  -v       enable verbose output

Screencast:
  https://asciinema.org/a/191154

Environment Variables:
  Global:
    $UPDOOT_PROVIDERS_ENABLED (string array)
      The providers to be enabled by default.

    $UPDOOT_LOG_MAXAGE (int) [30]
      Maximum age of log files in days

    $UPDOOT_STRICT (bool, 0 or 1) [1]
      If true, a failure in any part of any update will end the entire update process.
      If false, certain tolerable errors will be treated as warnings.

    $UPDOOT_VERBOSE (bool, 0 or 1) [0]
      If true, output additional status information to stderr.

    $UPDOOT_CACHE_DIR (directory) [/home/maddy/.cache/update]
      Directory in which to place log/runtime files

Dependencies:
  Global:
     - moment-cli (https://www.npmjs.com/package/moment-cli)
     - termcolors (https://gist.github.com/08007d77853fcea5ca669e6800844c06)
     - git (https://git-scm.com)

Available Providers: (* indicates provider is enabled by default)
  * npm
    A package manager for Node.js / JavaScript
    Dependencies:
      - npm (arch-repo: npm) (https://npmjs.com)

  * go
    A package manager for the Go programming language
    Dependencies:
      Primary:
        - go (arch-repo: go) (https://golang.org/)
      Optional:
        - gobin (https://github.com/myitcv/gobin)
          The gobin command installs/runs main packages
          Required for path@version packages, as described in UPDOOT_GO_GOPACKAGES_PATH

    Environment Variables:
      $UPDOOT_GO_GOPACKAGES_PATH (directory) [/home/maddy/.gopackages]
        Path to a POSIX shell file containing an array named GO_BIN_PKGS
        Array items consist of a Go package path, optionally followed by an @, optionally followed by a version.
        A package followed by an @ with no version implies the latest version.
        A package not followed by an @ will be fetched with go get rather than gobin

  * zsh
    A very advanced and programmable command interpreter (shell) for UNIX
    Dependencies:
      Primary: (at least one)
        - oh-my-zsh (https://github.com/ohmyzsh/ohmyzsh)
        and/or
        - zinit (https://github.com/zdharma/zinit)
      Required:
        - zsh (arch-repo: zsh) (https://zsh.org)

  - dummy_fail

  * gem
    A package manager for the Ruby programming language
    Dependencies:
      - gem (arch-repo: rubygems) (https://rubygems.org/)

  * rust
    A multi-paradigm system programming language
    Dependencies:
      Primary: (at least one)
        - rustup (arch-repo: rustup) (https://rustup.rs/) (recommended)
          Rust toolchain installer
          Includes: cargo, rustup
        or
        - rust (arch-repo: rust) (https://www.rust-lang.org/)
          Rust toolchain
          Includes: cargo
      cargo crates:
        - cargo-update (https://github.com/nabijaczleweli/cargo-update)
          A cargo subcommand for checking and applying updates to installed executables

  * pip
    A package manager for the Python programming language
    Dependencies:
      Primary:
        - pip (arch-repo: python-pip) (https://pip.pypa.io)
      Optional:
        - pipx (https://github.com/pipxproject/pipx)

  * yarn
    Fast, reliable, and secure dependency management for Node.js
    Dependencies:
      - yarn (arch-repo: yarn) (https://yarnpkg.com)

  - dummy

  * asdf
    Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more
    Dependencies:
      - asdf (aur: asdf-vm) (https://github.com/asdf-vm/asdf)

  * archlinux
    Updates Arch Linux & performs routine maintenence like updating mirrorlist & managing .pac{new,save} files
    Dependencies:
      Primary: (at least one; ordered by precedence)
        - yay (aur: yay) (https://github.com/Jguer/yay)
        or
        - pacman
      Required:
        - sudo (arch-repo: sudo) (https://www.sudo.ws)
      Optional:
        - archlinux-news
          Automatically check for unread RSS items from the archlinux.org news feed
          Dependencies:
            - curl (arch-repo: curl) (https://curl.haxx.se)
            - xmlstarlet (arch-repo: xmlstarlet) (https://xmlstar.sourceforge.net)
        - powerpill (aur: powerpill) (https://xyne.archlinux.ca/projects/powerpill)
          Pacman wrapper for faster downloads.
        - reflector (arch-repo: reflector) (https://xyne.archlinux.ca/projects/reflector)
          Finds the fastest mirrors and updates mirrorlist for pacman and powerpill.
        - pacdiff (arch-repo: pacman-contrib) (https://git.archlinux.org/pacman-contrib.git/about)
          A simple program to merge or remove pacnew/pacsave files.

    Options:
      General:
      :h   display usage information
      :a   enable all tasks (default)

      Enable tasks exclusively:
      :n   archlinux-news
      :y   yay
      :p   pacman
      :m   archlinux-mirrors
      :d   pacdiff

      Exclude tasks:
      :N   archlinux-news
      :Y   yay
      :P   pacman
      :M   archlinux-mirrors
      :D   pacdiff
      :L   powerpill

    Environment Variables:
      $UPDOOT_ARCHLINUX_MIRROR_COUNTRY (country name) [United States]
        Country to select mirrors from.
        Must match the format used in /etc/pacman.d/mirrorlist

  * cabal
    A system for building and packaging Haskell libraries and programs
    Dependencies:
      - cabal-install (arch-repo: cabal-install) (https://github.com/haskell/cabal/blob/master/cabal-install/README.md)

  - cpan
    A repository of software modules written in the Perl programming language
    Dependencies:
      - cpan (arch-repo: perl) (https://www.perl.org)

  * opam
    A package manager for the OCaml programming language
    Dependencies:
      - opam (arch-repo: opam) (https://opam.ocaml.org/)

  * nvim
    The Neovim text editor
    Dependencies:
      - nvim (arch-repo: neovim) (https://neovim.io)

    Note:
      Expects your neovim configuration to define the following functions:
        - PluginCleanHeadless()
        - PluginUpdateHeadless()
        - PluginInstallHeadless()

    Options:
      General:
      :h   display usage information
      :a   enable all tasks

      Enable tasks inclusively:
      :c   clean
      :i   install

      Enable tasks exclusively:
      :C   clean
      :u   update
      :I   install

      Exclude tasks:
      :U   update


(c) 2019-2020 Maddison Hellstrom <https://github.com/b0o>

GPL-3.0-or-later License (https://www.gnu.org/licenses/gpl-3.0.txt)
```

