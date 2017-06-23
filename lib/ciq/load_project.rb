module Ciq
  class LoadProject
    attr_reader :manifest

    def initialize(manifest)
      @manifest = manifest
    end

    def call
      Project.new(manifest, sources, resources, tests)
    end

    private

    def sources
      @sources ||= Dir.glob(File.join("source", "**", "*.mc"))
    end

    def resources
      @resources ||= Dir.glob(File.join("resources", "**", "*.xml"))
    end

    def tests
      @tests ||= Dir.glob(File.join("test", "**", "*.mc"))
    end
  end
end
