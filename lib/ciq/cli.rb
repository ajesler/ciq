require "ciq/command/info"

require "thor"

module Ciq
  class CLI < Thor
    class_option :verbose, type: :boolean
    class_option :dry_run, type: :boolean, desc: "Print the ConnectIQ commands that would be run, but don't run any"

    desc "info", "Display information about the project"
    def info
      Command::Info.new(options).run
    end
  end
end
