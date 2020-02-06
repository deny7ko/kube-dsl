module KubeDSL::DSL
  class ContainerStateTerminated
    extend ::KubeDSL::ValueFields
    value_fields :container_id, :exit_code, :finished_at, :message, :reason, :signal, :started_at

    def serialize
      {}.tap do |result|
        result[:containerID] = container_id
        result[:exitCode] = exit_code
        result[:finishedAt] = finished_at
        result[:message] = message
        result[:reason] = reason
        result[:signal] = signal
        result[:startedAt] = started_at
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end