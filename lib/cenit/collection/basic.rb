module Cenit
  module Collection
    require File.expand_path(File.join(*%w[ basic build ]), File.dirname(__FILE__))
    require "cenit/client"

    @basic = Cenit::Collection::Basic::Build.new

    # Include Collection Gem dependency
    # require "cenit/collection/[My Dependency Collection]/build"
    # Collection dependency
    # @basic.register_dep(Cenit::Collection::[My Dependency Collection]::Build.new)

    def self.push_collection (config)
      Cenit::Client.push(@basic.shared_collection.to_json, config)
    end

    def self.show_collection
      @basic.shared_collection
    end

    def self.pull_collection (parameters,config)
      @basic.shared_collection
    end

    def self.push_sample(model, config)
      Cenit::Client.push(@basic.sample_model(model).to_json, config)
    end

    def self.import(data)
      @basic.import_data(data)
    end
  end
end