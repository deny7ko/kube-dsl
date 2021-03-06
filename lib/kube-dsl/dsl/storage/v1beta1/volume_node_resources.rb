module KubeDSL::DSL::Storage::V1beta1
  class VolumeNodeResources < ::KubeDSL::DSLObject
    value_fields :count

    def serialize
      {}.tap do |result|
        result[:count] = count
      end
    end

    def kind_sym
      :volume_node_resources
    end
  end
end
