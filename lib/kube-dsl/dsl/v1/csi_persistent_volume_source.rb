module KubeDSL::DSL::V1
  class CSIPersistentVolumeSource < ::KubeDSL::DSLObject
    value_fields :driver, :fs_type, :read_only, :volume_handle
    object_field(:controller_expand_secret_ref) { KubeDSL::DSL::V1::SecretReference.new }
    object_field(:controller_publish_secret_ref) { KubeDSL::DSL::V1::SecretReference.new }
    object_field(:node_publish_secret_ref) { KubeDSL::DSL::V1::SecretReference.new }
    object_field(:node_stage_secret_ref) { KubeDSL::DSL::V1::SecretReference.new }
    object_field(:volume_attributes) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:driver] = driver
        result[:fsType] = fs_type
        result[:readOnly] = read_only
        result[:volumeHandle] = volume_handle
        result[:controllerExpandSecretRef] = controller_expand_secret_ref.serialize
        result[:controllerPublishSecretRef] = controller_publish_secret_ref.serialize
        result[:nodePublishSecretRef] = node_publish_secret_ref.serialize
        result[:nodeStageSecretRef] = node_stage_secret_ref.serialize
        result[:volumeAttributes] = volume_attributes.serialize
      end
    end

    def kind_sym
      :csi_persistent_volume_source
    end
  end
end
