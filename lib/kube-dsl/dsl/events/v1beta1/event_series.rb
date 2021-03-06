module KubeDSL::DSL::Events::V1beta1
  class EventSeries < ::KubeDSL::DSLObject
    value_fields :count, :last_observed_time, :state

    def serialize
      {}.tap do |result|
        result[:count] = count
        result[:lastObservedTime] = last_observed_time
        result[:state] = state
      end
    end

    def kind_sym
      :event_series
    end
  end
end
