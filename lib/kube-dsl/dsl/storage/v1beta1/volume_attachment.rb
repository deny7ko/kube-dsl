module KubeDSL::DSL::Storage::V1beta1
  class VolumeAttachment < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Storage::V1beta1::VolumeAttachmentSpec.new }
    object_field(:status) { KubeDSL::DSL::Storage::V1beta1::VolumeAttachmentStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "storage.k8s.io/v1beta1"
        result[:kind] = "VolumeAttachment"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :volume_attachment
    end
  end
end
