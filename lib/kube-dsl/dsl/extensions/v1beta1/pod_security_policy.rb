module KubeDSL::DSL::Extensions::V1beta1
  class PodSecurityPolicy < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Extensions::V1beta1::PodSecurityPolicySpec.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
        result[:kind] = "PodSecurityPolicy"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind_sym
      :pod_security_policy
    end
  end
end
