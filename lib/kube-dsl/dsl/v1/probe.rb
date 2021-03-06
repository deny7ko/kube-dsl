module KubeDSL::DSL::V1
  class Probe < ::KubeDSL::DSLObject
    value_fields :failure_threshold, :initial_delay_seconds, :period_seconds, :success_threshold, :timeout_seconds
    object_field(:exec) { KubeDSL::DSL::V1::ExecAction.new }
    object_field(:http_get) { KubeDSL::DSL::V1::HTTPGetAction.new }
    object_field(:tcp_socket) { KubeDSL::DSL::V1::TCPSocketAction.new }

    def serialize
      {}.tap do |result|
        result[:failureThreshold] = failure_threshold
        result[:initialDelaySeconds] = initial_delay_seconds
        result[:periodSeconds] = period_seconds
        result[:successThreshold] = success_threshold
        result[:timeoutSeconds] = timeout_seconds
        result[:exec] = exec.serialize
        result[:httpGet] = http_get.serialize
        result[:tcpSocket] = tcp_socket.serialize
      end
    end

    def kind_sym
      :probe
    end
  end
end
