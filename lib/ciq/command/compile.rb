module Ciq
  module Command
    class Compile
      attr_reader :project, :build_configurations

      def initialize(project, build_configurations = [])
        @project = project
        @build_configurations = build_configurations
      end

      def run
        build_configurations.each do |build_config|
          build(build_config)
        end
      end

      private

      def build(build_config)
        # TODO run against monkeyc
      end
    end
  end
end
