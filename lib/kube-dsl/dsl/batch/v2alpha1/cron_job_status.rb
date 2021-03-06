module KubeDSL::DSL::Batch::V2alpha1
  class CronJobStatus < ::KubeDSL::DSLObject
    value_fields :last_schedule_time
    array_field(:active) { KubeDSL::DSL::V1::ObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:lastScheduleTime] = last_schedule_time
        result[:active] = actives.map(&:serialize)
      end
    end

    def kind_sym
      :cron_job_status
    end
  end
end
