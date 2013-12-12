require "rspec/core/formatters/base_text_formatter"

class CustomFormatter < RSpec::Core::Formatters::BaseTextFormatter
begin
  def initialize(output)
    super(output)
  end

  def example_started(proxy)
    output << "examplgjgjhgjh YGYUGYUGYUGYUGUYGYUGUYGUYGUYGUYGUYGUYGUYGUYGUYGUYGYUG e he he : " << proxy.description
  end

  def example_passed(proxy)
    output << "*" << proxy.description
  end
end


end