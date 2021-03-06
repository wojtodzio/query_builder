# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE INDEX' CQL3 statement
    #
    class CreateIndex < Base

      include Modifiers::AddColumn
      include Modifiers::IfNotExists
      include Modifiers::WithOptions
      include Modifiers::Using

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "CREATE", maybe_custom, "INDEX", maybe_if, maybe_name,
          "ON", context.table.to_s, maybe_columns, maybe_using, maybe_with
        ]
      end

      private

      def maybe_name
        context.name.to_s if context.name
      end

      def maybe_custom
        "CUSTOM" unless maybe_name
      end

    end # class CreateIndex

  end # module Statements

end # module QueryBuilder::CQL
