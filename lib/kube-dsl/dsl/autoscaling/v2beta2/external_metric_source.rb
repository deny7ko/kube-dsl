module KubeDSL::DSL::Autoscaling::V2beta2
  class ExternalMetricSource < ::KubeDSL::DSLObject
    object_field(:metric) { KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier.new }
    object_field(:target) { KubeDSL::DSL::Autoscaling::V2beta2::MetricTarget.new }

    def serialize
      {}.tap do |result|
        result[:metric] = metric.serialize
        result[:target] = target.serialize
      end
    end

    def kind_sym
      :external_metric_source
    end
  end
end
