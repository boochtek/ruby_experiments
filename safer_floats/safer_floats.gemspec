lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "safer_floats"
  spec.version       = "0.9.0"
  spec.authors       = ["Craig Buchek"]
  spec.email         = ["craig@boochtek.com"]

  spec.summary       = "Raise an exception when trying to test floats for equality"
  spec.description   = "Raise an exception when trying to test floating point numbers for equality. " \
                       "Prevents you from getting the wrong answer for things like `0.1 + 0.2 == 0.3`."
  spec.homepage      = "https://github.com/boochtek/ruby_experiments"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    %x[git ls-files -z].split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
