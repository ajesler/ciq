require "ciq/manifest"
require "ciq/manifest_parser"
require "ciq/project"
require "ciq/load_project"

module Ciq
  module Command
    class Info
      attr_reader :project, :options

      def initialize(project, options)
        @project = project
        @options = options
      end

      def run
        puts "App Name: #{project.manifest.app_name}"
        puts "App Id:   #{project.manifest.app_id}"
        puts "App Type: #{project.manifest.app_type}"
        puts "Supported Products: #{project.manifest.supported_products.join(', ')}"
        puts
        puts "Sources: #{project.sources.join(', ')}"
        puts "Resources: #{project.resources.join(', ')}"
        puts "Tests: #{project.tests.join(', ')}"
      end
    end
  end
end
