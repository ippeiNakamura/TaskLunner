# -*- encoding: utf-8 -*-
# stub: holiday_jp 0.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "holiday_jp".freeze
  s.version = "0.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Masaki Komagata".freeze]
  s.date = "2020-12-09"
  s.description = "Japanese Holidays from 1970 to 2050.".freeze
  s.email = ["komagata@gmail.com".freeze]
  s.homepage = "http://github.com/komagata/holiday_jp".freeze
  s.rubygems_version = "3.2.3".freeze
  s.summary = "Japanese Holidays.".freeze

  s.installed_by_version = "3.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["< 3.0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<test-unit>.freeze, ["= 3.0.9"])
  else
    s.add_dependency(%q<bundler>.freeze, ["< 3.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, ["= 3.0.9"])
  end
end
