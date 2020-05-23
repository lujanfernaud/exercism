# frozen_string_literal: true

module Tournament
  class Match
    class Team
      attr_reader :name

      ATTRIBUTES = %i[name played won drawn lost points].freeze

      def initialize(args = {})
        args = { name: "" }.merge(args)

        ATTRIBUTES.each do |attr|
          instance_variable_set("@#{attr}", args.fetch(attr, 0))
        end
      end

      def to_h
        ATTRIBUTES.map { |attr| [attr, instance_variable_get("@#{attr}")] }.to_h
      end
    end
  end
end
