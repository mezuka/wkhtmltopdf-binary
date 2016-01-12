require File.join(File.dirname(__FILE__), 'lib', 'version')

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'wkhtmltopdf-binpath'
  s.licenses    = ['MIT']
  s.description = 'Provides binaries for WKHTMLTOPDF project in an easily accessible package.'
  s.homepage    = 'https://github.com/mezuka/wkhtmltopdf-binary'
  s.email       = 'mezuka@mezuka.com'
  s.version = WkhtmltopdfBinary::VERSION
  s.summary = 'Provides binaries for WKHTMLTOPDF.'
  s.authors = ['Mezuka LLC']
  s.required_ruby_version = '>= 1.8.7'
  s.required_rubygems_version = ">= 1.3.6"
  s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  s.add_development_dependency 'bundler', '~> 1.5'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
end
