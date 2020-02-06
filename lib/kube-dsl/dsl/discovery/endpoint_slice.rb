module KubeDSL::DSL::Discovery
  class EndpointSlice
    extend ::KubeDSL::ValueFields
    value_fields :address_type
    array_field(:endpoint) { KubeDSL::DSL::Discovery::Endpoint.new }
    array_field(:port) { KubeDSL::DSL::Discovery::EndpointPort.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "discovery.k8s.io/v1beta1"
        result[:kind] = "EndpointSlice"
        result[:addressType] = address_type
        result[:endpoints] = endpoints.map(&:serialize)
        result[:ports] = ports.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end