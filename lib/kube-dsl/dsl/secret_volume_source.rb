module KubeDSL::DSL
  class SecretVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :default_mode, :optional, :secret_name
    array_field(:item) { KubeDSL::DSL::KeyToPath.new }

    def serialize
      {}.tap do |result|
        result[:defaultMode] = default_mode
        result[:optional] = optional
        result[:secretName] = secret_name
        result[:items] = items.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end