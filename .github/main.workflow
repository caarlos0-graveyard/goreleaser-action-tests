workflow "Release" {
  on = "push"
  resolves = ["goreleaser"]
}

action "goreleaser" {
  uses = "docker://goreleaser/goreleaser:v0.98.0-action"
  secrets = ["GITHUB_TOKEN"]
  args = "release"
}
