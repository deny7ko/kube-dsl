module KubeDSL::DSL::V1
  class RBDPersistentVolumeSource < ::KubeDSL::DSLObject
    value_fields :fs_type, :image, :keyring, :monitors, :pool, :read_only, :user
    object_field(:secret_ref) { KubeDSL::DSL::V1::SecretReference.new }

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:image] = image
        result[:keyring] = keyring
        result[:monitors] = monitors
        result[:pool] = pool
        result[:readOnly] = read_only
        result[:user] = user
        result[:secretRef] = secret_ref.serialize
      end
    end

    def kind_sym
      :rbd_persistent_volume_source
    end
  end
end
