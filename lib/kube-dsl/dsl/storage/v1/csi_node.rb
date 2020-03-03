module KubeDSL::DSL::Storage::V1
  class CSINode < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Storage::V1::CSINodeSpec.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "storage.k8s.io/v1"
        result[:kind] = "CSINode"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind
      :csi_node
    end
  end
end