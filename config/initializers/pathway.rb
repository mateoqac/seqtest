class Contract < Dry::Validation::Contract
  params {}
end

module Pathway
  class Operation
    plugin :dry_validation, auto_wire_options: true

    contract Contract
  end
end
