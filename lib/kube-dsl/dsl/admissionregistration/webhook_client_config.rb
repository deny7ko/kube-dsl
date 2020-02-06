module KubeDSL::DSL::Admissionregistration
  class WebhookClientConfig
    extend ::KubeDSL::ValueFields
    value_fields :ca_bundle, :url
    object_field(:service) { KubeDSL::DSL::Admissionregistration::ServiceReference.new }

    def serialize
      {}.tap do |result|
        result[:caBundle] = ca_bundle
        result[:url] = url
        result[:service] = service.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end