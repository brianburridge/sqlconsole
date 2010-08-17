# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sqlconsole}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Burridge"]
  s.date = %q{2010-08-17}
  s.description = %q{This gem eliminates the need to switch back and forth between dbconsole and console. Within console you can simply type 'sql "select * from users"'}
  s.email = %q{bburridg@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/sqlconsole.rb",
     "test/helper.rb",
     "test/test_sqlconsole.rb"
  ]
  s.homepage = %q{http://github.com/bburridg/sqlconsole}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{adds dbconsole like functionality within standard rails console}
  s.test_files = [
    "test/helper.rb",
     "test/test_sqlconsole.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<awesome_print>, [">= 0.2.1"])
    else
      s.add_dependency(%q<awesome_print>, [">= 0.2.1"])
    end
  else
    s.add_dependency(%q<awesome_print>, [">= 0.2.1"])
  end
end

