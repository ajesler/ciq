module Ciq
  class Project
    attr_reader :manifest, :sources, :resources, :tests

    def initialize(manifest, sources, resources, tests)
      @manifest = manifest
      @sources = sources
      @resources = resources
      @tests = tests
    end
  end
end
