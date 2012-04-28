require "fpm-rake/version"

module FPM
  module Rake
    def fpm(opts)
      f = FPM::Command.new('')

      opts.each do |k,v|
        if [ :dependencies, :provides, :conflicts, :replaces, :config_files ].include?(k)
          v.each {|item| f.send("#{k}=", item) }
        else
          f.send("#{k}=", v)
        end
      end

      f.execute
    end

  end
end
