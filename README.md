Puppet pre-commit hooks
=========

[pre-commit hooks](http://pre-commit.com/) for use on Puppet projects.

Provides the following hooks:

* **puppet-validate:** uses `puppet parser validate` to check the syntax of
  Puppet manifests.

* **puppet-lint:** uses [`puppet-lint`](http://puppet-lint.com/) to check for
  stylistic issues with your Puppet manifests.

* **erb-validate:** compiles and syntax-checks Ruby erb templates.

* **epp-validate:** validates and syntax-checks [Puppet's epp templates][epp].


[epp]: https://docs.puppet.com/puppet/latest/lang_template_epp.html

## Usage

1. Install [pre-commit](http://pre-commit.com/), if you haven't already.

2. Add the following lines to a file named `.pre-commit-config.yaml` in the
   root of your git repository:

    ```yaml
    -   repo: https://github.com/chriskuehl/puppet-pre-commit-hooks.git
        sha: v2.0
        hooks:
        -   id: puppet-validate
        -   id: erb-validate
        -   id: epp-validate
        -   id: puppet-lint
            args:
            -   --fail-on-warnings
    ```

    You'll almost certainly want to adjust the puppet-lint args for your
    project. I find the following most helpful:

    ```yaml
            -   --no-80chars-check
            -   --no-documentation-check
            -   --no-puppet_url_without_modules-check
    ```

3. Run `pre-commit install` to add pre-commit git hooks.

4. Test the hooks work properly with `pre-commit run --all-files`.

To use the future parser with validation, just pass it as an argument
to the `puppet-validate` hook:

```yaml
    -   id: puppet-validate
        args: --parser=future
```

Any other arguments to `puppet-validate` will be fed directly to
`puppet parser validate`, as long as they are in the format `--arg=value`.

By default, the latest versions of `puppet` and `puppet-lint` are used. If
you'd like to use a different version, you can pass `additional_dependencies`
when definining the hooks.

For example, if you're still using Puppet 3, you can use:

```yaml
hooks:
-   id: puppet-validate
    additional_dependencies: ['puppet:<4']
```

To see what dependencies you might want to change, take a look at
`hooks.yaml` in this repo.
