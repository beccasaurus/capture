# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{capture}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["remi"]
  s.date = %q{2009-04-26}
  s.description = %q{easily capture writes to STDOUT, Files, or any IO}
  s.email = %q{remi@remitaylor.com}
  s.files = ["Rakefile", "VERSION.yml", "README.rdoc", "lib/capture.rb", "spec/capture_spec.rb", "spec/spec_helper.rb", "spec/spec.opts"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/remi/capture}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{easily capture writes to STDOUT, Files, or any IO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
