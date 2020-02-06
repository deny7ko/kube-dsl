module KubeDSL::DSL::Extensions
  class AllowedFlexVolume
    extend ::KubeDSL::ValueFields
    value_fields :driver

    def serialize
      {}.tap do |result|
        result[:driver] = driver
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end