module KubeDSL::DSL::Storage::V1beta1
  class CSIDriver < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Storage::V1beta1::CSIDriverSpec.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "storage.k8s.io/v1beta1"
        result[:kind] = "CSIDriver"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind_sym
      :csi_driver
    end
  end
end
