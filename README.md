Puppet pre-commit hooks
=========

[pre-commit hooks](http://pre-commit.com/) for use on Puppet projects.

Provides the following hooks:

* **puppet-validate:** uses `puppet parser validate` to check the syntax of
  Puppet manifests.

* **puppet-lint:** uses [`puppet-lint`](http://puppet-lint.com/) to check for
  stylistic issues with your Puppet manifests.

* **erb-validate:** compiles and syntax-checks Ruby erb templates.

## Usage

1. Install [pre-commit](http://pre-commit.com/), if you haven't already.

2. Add the following lines to a file named `.pre-commit-config.yaml` in the
   root of your git repository:

        -   repo: https://github.com/chriskuehl/puppet-pre-commit-hooks.git
            sha: <insert current sha>
            hooks:
            -   id: puppet-validate
            -   id: erb-validate
            -   id: puppet-lint
                args:
                -   --fail-on-warnings
                -   --no-80chars-check

   You'll almost certainly want to adjust the puppet-lint args for your
   project. I find the following most helpful:

        -   --fail-on-warnings
        -   --no-documentation-check
        -   --no-puppet_url_without_modules-check


3. Run `pre-commit install` to add pre-commit git hooks. You can also run
   `pre-commit run --all-files`, which is useful as part of your tests.

To use the future parser with validation, just pass it as an argument
to the `puppet-validate` hook:

    -   id: puppet-validate
        args: [--parser=future]

Any other arguments to `puppet-validate` will be fed directly to
`puppet parser validate`, as long as they are in the format `--arg=value`.
