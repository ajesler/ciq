require "ciq/manifest"
require "ciq/manifest_parser"
require "ciq/project"
require "ciq/load_project"

module Ciq
  module Command
    class Info
      attr_reader :options

      def initialize(options)
        @options = options
      end

      def run
        parser = ManifestParser.new

        begin
          manifest = parser.parse
          project_loader = LoadProject.new(manifest)
          project = project_loader.call
        rescue CiqError => e
          puts e.message
          return
        end

        puts "App Name: #{manifest.app_name}"
        puts "App Id:   #{manifest.app_id}"
        puts "App Type: #{manifest.app_type}"
        puts "Supported Products: #{manifest.supported_products.join(', ')}"
        puts
        puts "Sources: #{project.sources.join(', ')}"
        puts "Resources: #{project.resources.join(', ')}"
        puts "Tests: #{project.tests.join(', ')}"
      end

      private

      def manifest_path
        options.fetch(:file, "manifest.xml")
      end
    end
  end
end
