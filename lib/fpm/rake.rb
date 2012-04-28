require "fpm/rake/version"

module FPM
  module Rake
    class Watcher 
      attr_accessor :msgs

      def <<(data)
        (self.msgs ||= []) << data
      end
    end

    def fpm(opts)
      watch = Watcher.new
      ch = Cabin::Channel.get
      ch.subscribe watch

      f = FPM::Command.new('')

      opts.each do |k,v|
        if [ :dependencies, :provides, :conflicts, :replaces, :config_files ].include?(k)
          v.each {|item| f.send("#{k}=", item) }
        else
          f.send("#{k}=", v)
        end
      end

      f.execute

      # return the path to the package
      watch.msgs.last[:path]
    end

  end
end
