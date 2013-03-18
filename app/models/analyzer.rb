class Analyzer
  def initialize(values)
    @values = values
  end

  def values= values
    @values = values
    @result = nil
  end
end