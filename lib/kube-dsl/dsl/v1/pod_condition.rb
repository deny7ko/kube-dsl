module KubeDSL::DSL::V1
  class PodCondition < ::KubeDSL::DSLObject
    value_fields :last_probe_time, :last_transition_time, :message, :reason, :status, :type

    def serialize
      {}.tap do |result|
        result[:lastProbeTime] = last_probe_time
        result[:lastTransitionTime] = last_transition_time
        result[:message] = message
        result[:reason] = reason
        result[:status] = status
        result[:type] = type
      end
    end

    def kind_sym
      :pod_condition
    end
  end
end
