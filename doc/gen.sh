#!/usr/bin/env bash
set -euo pipefail

declare -xg base basedir basename reporoot

base="$(realpath "${BASH_SOURCE[0]}")"
basedir="$(dirname "$base")"
basename="$(basename "$base")"
reporoot="$(realpath "$basedir/..")"

declare -a readme=()

mapfile -t readme << "EOF"
updoot ![status: alpha](https://img.shields.io/badge/status-alpha-red?style=flat) [![version](https://img.shields.io/github/v/tag/b0o/updoot?style=flat&color=yellow&label=version&sort=semver)](https://github.com/b0o/updoot/releases) [![license: gpl-3.0-or-later](https://img.shields.io/github/license/b0o/updoot?style=flat&color=green)](https://opensource.org/licenses/GPL-3.0)
===


```
EOF

#shellcheck disable=2016
mapfile -tO ${#readme[@]} readme <<< "$(
  "${reporoot}/updoot" -H |& sed -e 's|'"$XDG_CONFIG_HOME"'|$XDG_CONFIG_HOME|g; s|'"$HOME"'|$HOME|g; s/\s*$//'
)"

mapfile -tO ${#readme[@]} readme << "EOF"
```

EOF

printf '%s\n' "${readme[@]}" > "$reporoot/README.md"
