# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'DROP TRIGGER' CQL3 statement
    #
    class DropTrigger < Statement

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement
      #
      # @return [CQLBuilder::Statements::DropTrigger]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Adds ON clause to the statement
      #
      # @return [CQLBuilder::Statements::DropTrigger]
      #
      def on(table)
        self << Clauses::On.new(name: table)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP TRIGGER", maybe_if, name.to_s, maybe_on]
      end

      private

      def maybe_if
        ifs = clauses(:if)
        ifs.any? ? ["IF", ifs.join(" AND ")] : nil
      end

      def maybe_on
        table = clauses(:on).last
        table ? "ON #{table}" : nil
      end

    end # class DropTrigger

  end # module Statements

end # module CQLBuilder