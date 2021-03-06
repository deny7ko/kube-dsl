module KubeDSL::DSL::Apiextensions::V1
  class ServiceReference < ::KubeDSL::DSLObject
    value_fields :name, :namespace, :path, :port

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:namespace] = namespace
        result[:path] = path
        result[:port] = port
      end
    end

    def kind_sym
      :service_reference
    end
  end
end
