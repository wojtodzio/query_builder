# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_gte" do

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:cql_gte, 4] }

    let(:input)  { :foo }
    let(:output) { "foo >= 4" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:cql_gte, :bar] }

    let(:input)  { :foo }
    let(:output) { "foo >= 'bar'" }
  end

end # describe QueryBuilder::CQL::Operators.cql_gte
