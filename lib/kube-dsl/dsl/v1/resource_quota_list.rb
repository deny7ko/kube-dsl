module KubeDSL::DSL::V1
  class ResourceQuotaList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::ResourceQuota.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ResourceQuotaList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :resource_quota_list
    end
  end
end
