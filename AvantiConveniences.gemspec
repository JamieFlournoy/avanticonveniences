# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{AvantiConveniences}
  s.version = "1.0.4"


  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jamie Flournoy"]
  s.date = %q{2009-03-20}
  s.description = %q{AvantiConveniences is a set of convenience code for Ruby on Rails applications.}
  s.email = ["jamie@pervasivecode.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/arg_checks.rb", "lib/avanti_conveniences.rb", "lib/hash_extensions.rb", "lib/string_extensions.rb", "lib/text_formatter.rb", "lib/uri_extensions.rb", "test/test_arg_checks.rb", "test/test_avanti_conveniences.rb", "test/test_hash_extensions.rb", "test/test_string_extensions.rb", "test/test_text_formatter.rb", "test/test_uri_extensions.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://www.pervasivecode.com/blog/avanticonveniences/}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{avanticonveniences}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{AvantiConveniences is a set of convenience code for Ruby on Rails applications.}
  s.test_files = ["test/test_arg_checks.rb", "test/test_avanti_conveniences.rb", "test/test_hash_extensions.rb", "test/test_string_extensions.rb", "test/test_text_formatter.rb", "test/test_uri_extensions.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 1.2.6"])
      s.add_runtime_dependency(%q<text-hyphen>, [">= 1.0.0"])
      s.add_development_dependency(%q<hoe>, [">= 1.11.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 1.2.6"])
      s.add_dependency(%q<text-hyphen>, [">= 1.0.0"])
      s.add_dependency(%q<hoe>, [">= 1.11.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 1.2.6"])
    s.add_dependency(%q<text-hyphen>, [">= 1.0.0"])
    s.add_dependency(%q<hoe>, [">= 1.11.0"])
  end
end
