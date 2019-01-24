workflow "New workflow" {
  on = "push"
  resolves = ["docker://goreleaser/goreleaser"]
}

action "docker://goreleaser/goreleaser" {
  uses = "docker://goreleaser/goreleaser"
  secrets = ["GITHUB_TOKEN"]
}
