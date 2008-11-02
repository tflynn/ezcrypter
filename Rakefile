require 'rake'
require 'rake/gempackagetask'
require 'rake/clean'
require 'rake/testtask'
require 'find'

name = 'ezcrypter'
version = '0.7.1'

@gem_spec = Gem::Specification.new do |s|
  s.name = name
  s.version = version
  s.summary = "Wraps EZCrypto library with convenience methods"
  s.description = "ezcrypter is derived from mack-encryption (markbates) "
  s.author = "Tracy Flynn"
  # s.email = "mark@mackframework.com"
  # s.homepage = "http://www.mackframework.com"

  s.test_files = FileList['test/**/*']

  s.files = FileList['lib/**/*.*', 'README', 'doc/**/*.*', 'bin/**/*.*']
  s.require_paths << 'lib'
  
  s.add_dependency("ezcrypto", "0.7")
  
  s.extra_rdoc_files = ["README"]
  s.has_rdoc = true
  s.required_ruby_version = ">= 1.8.6"
  #s.rubyforge_project = "magrathea"
end

Rake::GemPackageTask.new(@gem_spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
  rm_f FileList['pkg/**/*.*']
end

desc "Run test code"
Rake::TestTask.new(:default) do |t|
  t.libs << "spec"
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = true
end

task :install => [:package] do
  sh %{gem install pkg/#{name}-#{version}.gem}
end

task :uninstall do
  sh %{gem uninstall #{name}}
end
