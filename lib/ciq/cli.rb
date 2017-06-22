require "ciq/command/info"

require "thor"

module Ciq
  class CLI < Thor
    class_option :verbose, type: :boolean

    desc "manifest", "Display information from the manifest"
    option :file, default: "manifest.xml", desc: "The path to a ConnecIQ manifest file"
    def info
      Command::Info.new(options).run
    end
  end
end
