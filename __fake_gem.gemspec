Gem::Specification.new do |s|
    s.name = '__fake_gem'
    s.version = '0'
    s.authors = 'Chris Kuehl'
    s.summary = 'pre-commit hooks for Puppet projects'
    s.description = 'pre-commit hooks for Puppet projects'

    s.bindir = 'ruby-stubs'
    s.executables = ['puppet-validate', 'erb-validate', 'epp-validate']
    s.files = Dir['bin/*']
end
