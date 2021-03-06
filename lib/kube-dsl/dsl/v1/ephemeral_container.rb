module KubeDSL::DSL::V1
  class EphemeralContainer < ::KubeDSL::DSLObject
    value_fields :args, :command, :image, :image_pull_policy, :name, :stdin, :stdin_once, :target_container_name, :termination_message_path, :termination_message_policy, :tty, :working_dir
    array_field(:env) { KubeDSL::DSL::V1::EnvVar.new }
    array_field(:env_from) { KubeDSL::DSL::V1::EnvFromSource.new }
    array_field(:port) { KubeDSL::DSL::V1::ContainerPort.new }
    array_field(:volume_device) { KubeDSL::DSL::V1::VolumeDevice.new }
    array_field(:volume_mount) { KubeDSL::DSL::V1::VolumeMount.new }
    object_field(:lifecycle) { KubeDSL::DSL::V1::Lifecycle.new }
    object_field(:liveness_probe) { KubeDSL::DSL::V1::Probe.new }
    object_field(:readiness_probe) { KubeDSL::DSL::V1::Probe.new }
    object_field(:resources) { KubeDSL::DSL::V1::ResourceRequirements.new }
    object_field(:security_context) { KubeDSL::DSL::V1::SecurityContext.new }
    object_field(:startup_probe) { KubeDSL::DSL::V1::Probe.new }

    def serialize
      {}.tap do |result|
        result[:args] = args
        result[:command] = command
        result[:image] = image
        result[:imagePullPolicy] = image_pull_policy
        result[:name] = name
        result[:stdin] = stdin
        result[:stdinOnce] = stdin_once
        result[:targetContainerName] = target_container_name
        result[:terminationMessagePath] = termination_message_path
        result[:terminationMessagePolicy] = termination_message_policy
        result[:tty] = tty
        result[:workingDir] = working_dir
        result[:env] = envs.map(&:serialize)
        result[:envFrom] = env_froms.map(&:serialize)
        result[:ports] = ports.map(&:serialize)
        result[:volumeDevices] = volume_devices.map(&:serialize)
        result[:volumeMounts] = volume_mounts.map(&:serialize)
        result[:lifecycle] = lifecycle.serialize
        result[:livenessProbe] = liveness_probe.serialize
        result[:readinessProbe] = readiness_probe.serialize
        result[:resources] = resources.serialize
        result[:securityContext] = security_context.serialize
        result[:startupProbe] = startup_probe.serialize
      end
    end

    def kind_sym
      :ephemeral_container
    end
  end
end
