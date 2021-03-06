module KubeDSL::DSL::Storage::V1alpha1
  class VolumeAttachmentSpec < ::KubeDSL::DSLObject
    value_fields :attacher, :node_name
    object_field(:source) { KubeDSL::DSL::Storage::V1alpha1::VolumeAttachmentSource.new }

    def serialize
      {}.tap do |result|
        result[:attacher] = attacher
        result[:nodeName] = node_name
        result[:source] = source.serialize
      end
    end

    def kind_sym
      :volume_attachment_spec
    end
  end
end
