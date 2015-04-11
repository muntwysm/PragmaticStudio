Gem::Specification.new do |s|
  s.name         = "Games"
  s.version      = "1.00"
  s.author       = "Christopher Walton"
  s.email        = "chrissw0489@gmail.com"
  s.homepage     = "http://www.twitter.com/thechriswalton"
  s.summary      = "INSERT SUMMARY HERE"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>= 2.0'#'>=1.9'
  s.add_development_dependency 'rspec'
end