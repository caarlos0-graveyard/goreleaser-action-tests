workflow "Release" {
  on = "push"
  resolves = ["goreleaser"]
}

action "is-tag" {
  uses = "actions/bin/filter@master"
  args = "tag"
}

action "goreleaser" {
  uses = "docker://goreleaser/goreleaser:v0.98.0-action"
  secrets = ["GITHUB_TOKEN"]
  args = "release"
  needs = ["is-tag"]
}
