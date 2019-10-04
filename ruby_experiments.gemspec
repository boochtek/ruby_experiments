lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "ruby_experiments"
  spec.version       = "0.1.0"
  spec.authors       = ["Craig Buchek"]
  spec.email         = ["craig@boochtek.com"]

  spec.summary       = "A set of experiments in Ruby; mostly changes to the core libraries."
  spec.description   = "A set of experiments in Ruby." \
                       "Most of the experiments are changes to the core library." \
                       "We might include some changes to Ruby's syntax as well." \
                       "Some of these experiments are meant to test out some functionality," \
                       "with the end goal of adding the functionality to Ruby itself." \
                       "Others are merely thought experiments."
  spec.homepage      = "https://github.com/boochtek/ruby_experiments"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    %x[git ls-files -z].split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.dependency "safer_floats", "0.9.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
