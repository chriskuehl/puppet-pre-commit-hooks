Gem::Specification.new do |s|
    s.name = 'pre_commit_fake_gem'
    s.version = '0'
    s.authors = 'Chris Kuehl'
    s.summary = 'pre-commit hooks for Puppet projects'
    s.description = 'pre-commit hooks for Puppet projects'

    s.bindir = 'ruby-stubs'
    s.executables = ['bolt-validate', 'erb-validate', 'epp-validate', 'g10k-validate', 'puppet-validate', 'puppet-strings', 'r10k-validate', 'ruby-validate']
end
