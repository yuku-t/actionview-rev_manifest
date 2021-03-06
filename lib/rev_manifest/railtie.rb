require "rev_manifest/helper"

module RevManifest
  class Railtie < ::Rails::Railtie
    config.rev_manifest = ActiveSupport::OrderedOptions.new

    config.rev_manifest.enable = false
    config.rev_manifest.sources = :all

    initializer "rev_manifest.config", group: :all do |app|
      RevManifest.enabled = app.config.rev_manifest.enable
      RevManifest.sources = app.config.rev_manifest.sources
      ActionView::Base.send(:prepend, RevManifest::Helper)
    end
  end
end
