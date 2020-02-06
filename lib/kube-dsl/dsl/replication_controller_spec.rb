module KubeDSL::DSL
  class ReplicationControllerSpec
    extend ::KubeDSL::ValueFields

    value_fields :min_ready_seconds, :replicas
    object_field(:template) { KubeDSL::DSL::PodTemplateSpec.new }
    object_field(:selector) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:minReadySeconds] = min_ready_seconds
        result[:replicas] = replicas
        result[:template] = template.serialize
        result[:selector] = selector.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :replication_controller_spec
    end
  end
end
