module KubeDSL::DSL::Authorization
  class SelfSubjectRulesReviewSpec
    extend ::KubeDSL::ValueFields
    value_fields :namespace

    def serialize
      {}.tap do |result|
        result[:namespace] = namespace
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end