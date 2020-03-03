module KubeDSL::DSL::Rbac::V1alpha1
  class ClusterRoleList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Rbac::V1alpha1::ClusterRole.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1alpha1"
        result[:kind] = "ClusterRoleList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :cluster_role_list
    end
  end
end