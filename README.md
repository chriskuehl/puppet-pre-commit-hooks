Puppet pre-commit hooks
=========

[pre-commit hooks](http://pre-commit.com/) for use on Puppet projects.

Provides the following hooks:

* **epp-validate:** validates and syntax-checks [Puppet's epp templates][epp].

* **erb-validate:** compiles and syntax-checks [Ruby erb templates][erb].

* **g10k-validate:** uses [g10k][g10k] to validate [Puppetfile][puppetfile] syntax.

* **puppet-lint:** uses [`puppet-lint`](http://puppet-lint.com/) to check for
  stylistic issues with Puppet manifests.

* **puppet-validate:** uses [`puppet parser validate`][puppet-parser] to check the syntax of
  Puppet manifests.

* **r10k-validate:** uses [r10k][r10k] to validate [Puppetfile][puppetfile] syntax.

* **ruby-validate:** uses [`ruby -c`][ruby-c] to validate the syntax of ruby code.


[epp]: https://docs.puppet.com/puppet/latest/lang_template_epp.html
[erb]: https://puppet.com/docs/puppet/latest/lang_template_erb.html
[g10k]: https://github.com/xorpaul/g10k
[puppetfile]: https://puppet.com/docs/pe/latest/puppetfile.html
[puppet-parser]: https://puppet.com/docs/puppet/latest/man/parser.html#EXAMPLES
[r10k]: https://github.com/puppetlabs/r10k
[rubocop]: https://github.com/rubocop-hq/rubocop
[ruby-c]: https://ruby-doc.org/docs/ruby-doc-bundle/Manual/man-1.4/options.html
[yamllint]: https://github.com/adrienverge/yamllint

## Usage

1. Install [pre-commit](http://pre-commit.com/), if you haven't already.

2. Add the following lines to a file named `.pre-commit-config.yaml` in the
   root of your git repository:

    ```yaml
    - repo: https://github.com/chriskuehl/puppet-pre-commit-hooks.git
      sha: v2.1.0
      hooks:
        - id: epp-validate
        - id: erb-validate
        - id: puppet-lint
          args:
            -   --fail-on-warnings
        - id: puppet-validate
        - id: r10k-validate
        - id: ruby-validate
    ```

    You'll almost certainly want to adjust the puppet-lint args for your
    project. I find the following most helpful:

    ```yaml
         - --no-80chars-check
         - --no-documentation-check
         - --no-puppet_url_without_modules-check
    ```

    To check ruby *style* as well as *syntax*, you may find it useful
    to add a hook for [`rubocop`][rubocop]:

    ```yaml
    - repo: https://github.com/jumanjihouse/pre-commit-hooks
      rev: 1.11.0
      hooks:
        - id: reek
        - id: rubocop
    ```

    To check yaml syntax, you may want to add a hook for [`yamllint`][yamllint]:

    ```yaml
    - repo: 'https://github.com/adrienverge/yamllint'
      rev: v1.15.0
      hooks:
        - id: 'yamllint'
    ```

3. Run `pre-commit install` to add pre-commit git hooks.

4. Test the hooks work properly with `pre-commit run --all-files`.

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
