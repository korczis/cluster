# encoding: utf-8
$LOAD_PATH.push File.expand_path('../lib/', __FILE__)
require 'cluster/version'

Gem::Specification.new do |s|
  s.name = 'cluster'
  s.version = Cluster::VERSION
  s.licenses = ['MIT']

  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.authors = [
    'Tomas Korcak <korczis@gmail.com>'
  ]

  s.summary = 'CLI for running your own CoreOS/Kubernetes cluster'
  s.description = 'CLI for running your own CoreOS/Kubernetes cluster'
  s.email = 'korczis@gmail.com'
  s.extra_rdoc_files = %w(LICENSE README.md)

  s.files = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  s.homepage = 'http://github.com/korczis/cluster'
  s.require_paths = ['lib']

  # Development Dependencies
  # s.add_development_dependency 'bundler', "~> 1.14"

  # Dependencies
  s.add_dependency 'gli', '~> 2.15'
  s.add_dependency 'os', '~> 1.0'
end
