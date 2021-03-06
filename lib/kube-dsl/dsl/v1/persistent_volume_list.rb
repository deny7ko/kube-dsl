module KubeDSL::DSL::V1
  class PersistentVolumeList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::PersistentVolume.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "PersistentVolumeList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :persistent_volume_list
    end
  end
end
