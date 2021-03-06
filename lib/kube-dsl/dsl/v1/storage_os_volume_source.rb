module KubeDSL::DSL::V1
  class StorageOSVolumeSource < ::KubeDSL::DSLObject
    value_fields :fs_type, :read_only, :volume_name, :volume_namespace
    object_field(:secret_ref) { KubeDSL::DSL::V1::LocalObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:readOnly] = read_only
        result[:volumeName] = volume_name
        result[:volumeNamespace] = volume_namespace
        result[:secretRef] = secret_ref.serialize
      end
    end

    def kind_sym
      :storage_os_volume_source
    end
  end
end
