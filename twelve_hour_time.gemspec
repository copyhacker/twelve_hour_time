# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twelve_hour_time/version'

Gem::Specification.new do |gem|
  gem.name          = "twelve_hour_time"
  gem.version       = TwelveHourTime::VERSION
  gem.authors       = [ "Nick Muerdter", "Maurice Aubrey", "Jonathan Vaught" ]
  gem.email         = [ "jonathan.vaught@gmail.com" ]
  gem.description   = %q{ AM/PM 12 Hour Time Helper }
  gem.summary       = %q{ AM/PM 12 Hour Time Helper }
  gem.homepage      = "http://github.com/copyhacker/twelve_hour_time"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = [ "lib" ]
  
  gem.add_development_dependency 'actionpack', '>= 3.0.0'
  gem.add_development_dependency "test-unit"
end
