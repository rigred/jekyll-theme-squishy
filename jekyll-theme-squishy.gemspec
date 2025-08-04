# jekyll-theme-0xcats.gemspec
Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-squishy"
  spec.version       = "0.1.0"
  spec.authors       = ["Rigo Reddig"]
  spec.email         = ["rigo.reddig@gmail.com"]

  spec.summary       = "An ultra-lightweight, dark theme for Jekyll."
  spec.homepage      = "https://github.com/your-username/jekyll-theme-squishy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
end