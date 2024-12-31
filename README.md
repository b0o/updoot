updoot ![status: alpha](https://img.shields.io/badge/status-alpha-red?style=flat) [![version](https://img.shields.io/github/v/tag/b0o/updoot?style=flat&color=yellow&label=version&sort=semver)](https://github.com/b0o/updoot/releases) [![license: MIT](https://img.shields.io/github/license/b0o/updoot?style=flat&color=green)](https://opensource.org/licenses/MIT)
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

    $UPDOOT_CACHE_DIR (directory) [$HOME/.cache/updoot]
      Directory to use for log/runtime/temp files.

Dependencies:
  Global:
     - moment-cli (https://www.npmjs.com/package/moment-cli)
     - termcolors (https://gist.github.com/08007d77853fcea5ca669e6800844c06)
     - git (https://git-scm.com)

Available Providers: (* indicates provider is enabled by default)
  - yarn
    Fast, reliable, and secure dependency management for Node.js
    Dependencies:
      - yarn (arch-repo: yarn) (https://yarnpkg.com)

  * archlinux
    Updates Arch Linux & performs routine maintenence like updating mirrorlist & managing .pac{new,save} files
    Dependencies:
      Primary: (at least one; ordered by precedence)
        - yay (aur: yay) (https://github.com/Jguer/yay)
        - paru (aur: paru) (https://github.com/Morganamilo/paru)
      Required:
        - pacman
        - sudo (arch-repo: sudo) (https://www.sudo.ws)
      Optional:
        - archlinux-news
          Automatically check for unread RSS items from the archlinux.org news feed
          Dependencies:
            - curl (arch-repo: curl) (https://curl.haxx.se)
            - xmlstarlet (arch-repo: xmlstarlet) (https://xmlstar.sourceforge.net)
        - reflector (arch-repo: reflector) (https://xyne.archlinux.ca/projects/reflector)
          Finds the fastest mirrors and updates mirrorlist for pacman.
        - pacdiff (arch-repo: pacman-contrib) (https://git.archlinux.org/pacman-contrib.git/about)
          A simple program to merge or remove pacnew/pacsave files.

    Options:
      General:
      :h   display usage information
      :a   enable all tasks (default)

      Enable tasks exclusively:
      :n   archlinux-news
      :y   yay
      :u   paru
      :p   pacman
      :m   archlinux-mirrors
      :d   pacdiff

      Exclude tasks:
      :N   archlinux-news
      :Y   yay
      :U   paru
      :P   pacman
      :M   archlinux-mirrors
      :D   pacdiff

    Environment Variables:
      $UPDOOT_ARCHLINUX_MIRROR_COUNTRY (country name) [United States]
        Country to select mirrors from.
        Must match the format used in /etc/pacman.d/mirrorlist
      $UPDOOT_ARCHLINUX_PREFERRED_HELPER ("yay", "paru", "none", or "") [paru]

  - cabal
    A system for building and packaging Haskell libraries and programs
    Dependencies:
      - cabal-install (arch-repo: cabal-install) (https://github.com/haskell/cabal/blob/master/cabal-install/README.md)

  - nvim
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

  * pip
    A package manager for the Python programming language
    Dependencies:
      Primary:
        - pip (arch-repo: python-pip) (https://pip.pypa.io)
      Optional:
        - pipx (https://github.com/pipxproject/pipx)

  - dummy_user

  - nix
    A purely functional package manager
    Dependencies:
      Required:
        - nix (aur: nix) (https://nixos.org/nix)
        - sudo [if root is needed to manage nix] (arch-repo: sudo) (https://www.sudo.ws)
      Optional:
        - home-manager (https://github.com/rycee/home-manager)

  * asdf
    Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more
    Dependencies:
      - asdf (aur: asdf-vm) (https://github.com/asdf-vm/asdf)

  * pnpm
    Fast, disk space efficient package manager for Node.js
    Dependencies:
      - pnpm (aur: pnpm) (https://pnpm.io/)

  * mise
    mise-en-place - The front-end to your dev env
    Dependencies:
      - mise (https://mise.jdx.dev/)

  * uv
    An extremely fast Python package and project manager, written in Rust.
    Dependencies:
      - uv (https://docs.astral.sh/uv/)

  * gem
    A package manager for the Ruby programming language
    Dependencies:
      - gem (arch-repo: rubygems) (https://rubygems.org/)

  * aqua
    Declarative CLI Version Manager. Unify tool versions in teams, projects, and CI. Easy, painless, and secure.
    Dependencies:
      - aqua (https://aquaproj.github.io/)

  - cpan
    A repository of software modules written in the Perl programming language
    Dependencies:
      - cpan (arch-repo: perl) (https://www.perl.org)

  * tpm
    Tmux Plugin Manager
    Dependencies:
      - tmux (arch-repo: tmux) (https://github.com/tmux/tmux)
      - tpm (https://github.com/tmux-plugins/tpm)

    Environment Variables:
      $UPDOOT_TPM_PATH [$XDG_CONFIG_HOME/tmux/plugins//tpm]
      Path to the tpm plugin's directory
      If not set, the tpm provider will try to find your tpm directory.

  - opam
    A package manager for the OCaml programming language
    Dependencies:
      - opam (arch-repo: opam) (https://opam.ocaml.org/)

  * npm
    A package manager for Node.js / JavaScript
    Dependencies:
      - npm (arch-repo: npm) (https://npmjs.com)

  * zsh
    A very advanced and programmable command interpreter (shell) for UNIX
    Dependencies:
      Primary: (at least one)
        - oh-my-zsh (https://github.com/ohmyzsh/ohmyzsh)
        and/or
        - zinit (https://github.com/zdharma/zinit)
      Required:
        - zsh (arch-repo: zsh) (https://zsh.org)

  * gh
    GitHub CLI extensions.
    Dependencies:
      - gh (arch-repo: github-cli) (https://github.com/cli/cli)

  - go
    A package manager for the Go programming language
    Dependencies:
      Primary:
        - go (arch-repo: go) (https://golang.org/)
      Optional:
        - gobin (https://github.com/myitcv/gobin)
          The gobin command installs/runs main packages
          Required for path@version packages, as described in UPDOOT_GO_GOPACKAGES_PATH

    Environment Variables:
      $UPDOOT_GO_GOPACKAGES_PATH (directory) [$HOME/.gopackages]
        Path to a Bash script file exporting the following variables:

        - GO_BIN_PKGS (array) [required]
          Array items consist of a Go package path, optionally followed by an @, optionally followed by a version.
          A package followed by an @ with no version implies the latest version.
          A package not followed by an @ will be fetched with go get rather than gobin

        - GOBIN (path) [optional]
          See https://golang.org/cmd/go/#hdr-Environment_variables
          If unset,

        - GO_UPDATE_BEHAVIOR (string) [default: replace]
          One of the following values:

          - purge: All executables in GOBIN will be removed and new executables
                   will be moved in. This has the effect of only keeping
                   executables from packages that appear in GO_BIN_PKGS after an
                   update, so any executables from manually installed packages or
                   packages that are removed from the GO_BIN_PKGS array will be
                   removed.

          - replace: New executables will replace old ones in GOBIN

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


(c) 2019-2024 Maddison Hellstrom <https://github.com/b0o>

MIT License (https://mit-license.org)
```

