module KubeDSL::DSL::Node
  class Overhead
    extend ::KubeDSL::ValueFields

    object_field(:pod_fixed) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:podFixed] = pod_fixed.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :overhead
    end
  end
end
