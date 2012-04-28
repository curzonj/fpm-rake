# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fpm/rake/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jordan Curzon"]
  gem.email         = ["curzonj@gmail.com"]
  gem.description   = %q{add fpm method to rake}
  gem.summary       = %q{add fpm method to rake}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fpm-rake"
  gem.require_paths = ["lib"]
  gem.version       = FPM::Rake::VERSION
end
