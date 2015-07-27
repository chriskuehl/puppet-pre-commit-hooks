Gem::Specification.new do |s|
    s.name = '__fake_gem'
    s.version = '0'
    s.authors = 'Chris Kuehl'
    s.summary = 'pre-commit hooks for Puppet projects'
    s.description = 'pre-commit hooks for Puppet projects'
    s.add_dependency 'puppet-lint', '1.1.0'
    s.add_dependency 'puppet', '3.8.1'

    s.bindir = 'ruby-stubs'
    s.executables = ['puppet-validate', 'erb-validate']
    s.files = Dir['bin/*']
end
