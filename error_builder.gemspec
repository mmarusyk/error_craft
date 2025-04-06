# frozen_string_literal: true

require_relative "lib/error_builder/version"

Gem::Specification.new do |spec|
  spec.name = "error_builder"
  spec.version = ErrorBuilder::VERSION
  spec.authors = ["Mykhailo Marusyk"]
  spec.email = ["misha.marusyk@gmail.com"]

  spec.summary = "A flexible Ruby gem for building structured error objects."
  spec.description = "error_builder provides a customizable way to format and structure error messages as arrays or \
hashes. It supports multiple formats, including string, array, and nested hash representations."
  spec.homepage = "https://github.com/mmarusyk/error_builder"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mmarusyk/error_builder"
  spec.metadata["changelog_uri"] = "https://github.com/mmarusyk/error_builder/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_runtime_dependency "zeitwerk", "~> 2.7.2"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
