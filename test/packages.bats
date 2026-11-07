#!/usr/bin/env bats

render() {
  chezmoi --source "$BATS_TEST_DIRNAME/.." --config "$BATS_TEST_TMPDIR/chezmoi.toml" \
    --persistent-state "$BATS_TEST_TMPDIR/state" execute-template --init \
    --promptBool "Install Dell XPS 14 hardware packages (DisplayLink, IR face login)=$1" \
    < "$BATS_TEST_DIRNAME/../.chezmoi.toml.tmpl" > "$BATS_TEST_TMPDIR/chezmoi.toml"
  chezmoi --source "$BATS_TEST_DIRNAME/.." --config "$BATS_TEST_TMPDIR/chezmoi.toml" \
    --persistent-state "$BATS_TEST_TMPDIR/state" execute-template \
    < "$BATS_TEST_DIRNAME/../run_onchange_before_10-install-packages.sh.tmpl"
}

@test "package script installs common packages without XPS hardware by default" {
  run render false
  [ "$status" -eq 0 ]
  [[ "$output" == *'"rclone"'* ]]
  [[ "$output" == *'"rubymine"'* ]]
  [[ "$output" != *'"displaylink"'* ]]
  bash -n <(echo "$output")
}

@test "package script adds XPS hardware packages when asked" {
  run render true
  [[ "$output" == *'"intel-ucode"'* ]]
  [[ "$output" == *'"howdy"'* ]]
  bash -n <(echo "$output")
}

@test "package script never switches the Omarchy channel" {
  run render true
  [[ "$output" != *'omarchy-dev'* ]]
}
