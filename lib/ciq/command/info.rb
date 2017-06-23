require "ciq/manifest"
require "ciq/manifest_parser"

module Ciq
  module Command
    class Info
      attr_reader :options

      def initialize(options)
        @options = options
      end

      def run
        puts "Reading manifest"
        parser = ManifestParser.new(manifest_path)

        begin
          manifest = parser.parse
        rescue CiqError => e
          puts e.message
          return
        end

        puts "App Name: #{manifest.app_name}"
        puts "App Id:   #{manifest.app_id}"
        puts "App Type: #{manifest.app_type}"
        puts "Supported Products: #{manifest.supported_products.join(',')}"
      end

      private

      def manifest_path
        options.fetch(:file, "manifest.xml")
      end
    end
  end
end
