module KubeDSL::DSL::Batch::V1
  class JobStatus < ::KubeDSL::DSLObject
    value_fields :active, :completion_time, :failed, :start_time, :succeeded
    array_field(:condition) { KubeDSL::DSL::Batch::V1::JobCondition.new }

    def serialize
      {}.tap do |result|
        result[:active] = active
        result[:completionTime] = completion_time
        result[:failed] = failed
        result[:startTime] = start_time
        result[:succeeded] = succeeded
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def kind_sym
      :job_status
    end
  end
end
