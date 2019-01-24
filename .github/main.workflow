workflow "Release" {
  on = "push"
  resolves = ["goreleaser"]
}

action "tag-filter" {
  needs = ["env"]
  uses = "docker://alpine"
  args = ["sh", "-c", "echo $GITHUB_REF | grep -Eq refs/tags.*"]
}

action "goreleaser" {
  uses = "docker://goreleaser/goreleaser:v0.98.0-action"
  secrets = ["GITHUB_TOKEN"]
  args = "release"
  needs = ["tag-filter"]
}
