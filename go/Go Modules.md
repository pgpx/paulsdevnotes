# Go Modules

* [Reference](https://go.dev/ref/mod)
* <https://blog.golang.org/using-go-modules>
* <https://blog.golang.org/publishing-go-modules>

* Discovering availabile updates ([ref](https://go.dev/doc/modules/managing-dependencies#discovering_updates)): `go list -m -u all`
* Synchronizing your code’s dependencies ([ref](https://go.dev/doc/modules/managing-dependencies#synchronizing)): `go mod tidy`

Using private Go modules: ([blog](https://1729.org.uk/posts/gitlab-private-go-modules/)):

* Include `.git` in the module path (so that Go acceses the Git repo directly instead of trying a Go proxy):
  * In `go.mod` of the private module: `module my-git-server.com/myproject/my-module-repo.git`
  * Same in the `go.mod` of the importing module. 
* Add the Git server to `GOPRIVATE` (so that it is not proxied): `export GOPRIVATE=my-git-server.com/*`
* Add Git credentials, e.g. to `~/.netrc` for GitLab CI: `echo -e "machine my-gitlab-servercom\nlogin gitlab-ci-token\npassword ${CI_JOB_TOKEN}" > ~/.netrc`

## Go mod commands in CI

* [Go Modules in a Monorepo - Keeping the go.mod/go.sum Stable](https://medium.com/compass-true-north/catching-up-with-the-world-go-modules-in-a-monorepo-c3d1393d6024)
    1. `go mod tidy` on Git pre-push: keeps go.mod files clean by removing unused dependencies, so pre-push check blocks `git push` if any uncommitted changes are detected in the go.mod or go.sum as a result.
    2. `go mod tidy` in CI - for redundancy, same `go mod tidy` check again in CI to ensure check was run.
    3. `go test -mod=readonly` in CI: When we run the suite of Go unit tests, we have the `-mod=readonly` flag on for the `go test` command. This flag causes the `go test` command to fail if it’s missing a dependency and wants to update the go.mod file.
    4. `go.mod` updates pushed up for review in a cron job - runs a suite of Go commands (such as `go test` and `go mod tidy`, as well as linting and other tooling). If any go.mod or go.sum changes are found after running these commands, then a pull request containing those changes is generated and pushed up for review.
