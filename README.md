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
    sha: <insert current sha>
    hooks:
        - id: puppet-validate
        - id: erb-validate
        - id: epp-validate
        - id: puppet-lint
    args:
        -   --fail-on-warnings
```

3. Run `pre-commit install` to add pre-commit git hooks.

4. Run `pre-commit run --all-files` to test everything works.
