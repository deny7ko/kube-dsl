module KubeDSL::DSL::Extensions::V1beta1
  class FSGroupStrategyOptions < ::KubeDSL::DSLObject
    value_fields :rule
    array_field(:range) { KubeDSL::DSL::Extensions::V1beta1::IDRange.new }

    def serialize
      {}.tap do |result|
        result[:rule] = rule
        result[:ranges] = ranges.map(&:serialize)
      end
    end

    def kind_sym
      :fs_group_strategy_options
    end
  end
end
