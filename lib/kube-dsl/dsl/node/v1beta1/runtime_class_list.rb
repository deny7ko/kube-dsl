module KubeDSL::DSL::Node::V1beta1
  class RuntimeClassList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Node::V1beta1::RuntimeClass.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "node.k8s.io/v1beta1"
        result[:kind] = "RuntimeClassList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :runtime_class_list
    end
  end
end
