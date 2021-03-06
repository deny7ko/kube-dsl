module KubeDSL::DSL::V1
  class ConfigMapNodeConfigSource < ::KubeDSL::DSLObject
    value_fields :kubelet_config_key, :name, :namespace, :resource_version, :uid

    def serialize
      {}.tap do |result|
        result[:kubeletConfigKey] = kubelet_config_key
        result[:name] = name
        result[:namespace] = namespace
        result[:resourceVersion] = resource_version
        result[:uid] = uid
      end
    end

    def kind_sym
      :config_map_node_config_source
    end
  end
end
