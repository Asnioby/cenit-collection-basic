require "cenit/collection/basic/version"

module Cenit
  module Collection
    require "cenit/collection/basic/build"
    require "cenit/client"

    # bundle exec irb -I lib -r 'cenit/collection/basic'
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :connection_token => "My Conn Token", :connection_key => "My Conn Key"}
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :user_token => "My User Token", :user_key => "My User Key"}
    # Cenit::Collection::Basic.push_collection config
    # Cenit::Collection::Basic.shared_collection

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
      Cenit::Client.push(@basic.sample_data(model).to_json, config)
    end
  end
end