FROM scratch
ADD goreleaser-action-tests /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/goreleaser-action-tests"]
