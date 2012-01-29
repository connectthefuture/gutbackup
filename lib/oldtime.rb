libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

ENV["BUNDLE_GEMFILE"] = File.expand_path("../../Gemfile", __FILE__)
require "bundler/setup"
Bundler.require

module Oldtime
  autoload :VERSION, "oldtime/version"
  autoload :UI, "oldtime/ui"
  autoload :Core, "oldtime/core"

  Error = Class.new Exception
  FatalError = Class.new Exception

  class << self
    attr_accessor :ui

    def ui
      @ui ||= UI.new
    end
  end
end

Rc = Optimism.require "oldtime/rc"

module Kernel
private

  include Oldtime::Core

  def configure(data, &blk)
    Rc << Optimism(data, &blk)
  end

  def backup(instance=:default, &blk)
    Rc.backup_blks[instance] = blk
  end

  def restore(instance=:default, &blk)
    Rc.restore_blks[instance] = blk
  end
end