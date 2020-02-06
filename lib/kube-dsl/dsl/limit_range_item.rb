module KubeDSL::DSL
  class LimitRangeItem
    extend ::KubeDSL::ValueFields
    value_fields :type
    object_field(:default) { ::KubeDSL::KeyValueFields.new }
    object_field(:default_request) { ::KubeDSL::KeyValueFields.new }
    object_field(:max) { ::KubeDSL::KeyValueFields.new }
    object_field(:max_limit_request_ratio) { ::KubeDSL::KeyValueFields.new }
    object_field(:min) { ::KubeDSL::KeyValueFields.new }

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:default] = default.serialize
        result[:defaultRequest] = default_request.serialize
        result[:max] = max.serialize
        result[:maxLimitRequestRatio] = max_limit_request_ratio.serialize
        result[:min] = min.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end