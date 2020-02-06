module KubeDSL::DSL::Autoscaling
  class HorizontalPodAutoscalerSpec
    extend ::KubeDSL::ValueFields
    value_fields :max_replicas, :min_replicas
    array_field(:metric) { KubeDSL::DSL::Autoscaling::MetricSpec.new }
    object_field(:scale_target_ref) { KubeDSL::DSL::Autoscaling::CrossVersionObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:maxReplicas] = max_replicas
        result[:minReplicas] = min_replicas
        result[:metrics] = metrics.map(&:serialize)
        result[:scaleTargetRef] = scale_target_ref.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end