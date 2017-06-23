require "ciq/command/info"
require "ciq/command/compile"

require "thor"

module Ciq
  class CLI < Thor
    class_option :verbose, type: :boolean
    class_option :dry_run, type: :boolean, desc: "Print the ConnectIQ commands that would be run, but don't run any"

    desc "info", "Display information about the project"
    def info
      Command::Info.new(project, options).run
    end

    def compile(build_configurations = nil)
      Command::Compile.new(project, build_configurations).run
    end

    private

    def project
      @project ||= begin
        parser = ManifestParser.new

        manifest = parser.parse
        project_loader = LoadProject.new(manifest)
        project = project_loader.call
      rescue CiqError => e
        # TODO handle the error properly
        puts e.message
        nil
      end
    end
  end
end
