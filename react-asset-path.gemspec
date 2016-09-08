
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name    = "react-asset-path"
  spec.version = '0.0.1'

  spec.authors = ["Aurélien Malisart"]
  spec.email   = ["aurelien.malisart@gmail.com"]

  spec.summary     = "Use Rails' asset_path inside ReactJS components"
  spec.description = "Use Rails' asset_path inside ReactJS components"
  spec.homepage    = "https://github.com/aurels/react-asset-path"
  spec.license     = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'react-rails'
end
