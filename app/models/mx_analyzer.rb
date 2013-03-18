class MxAnalyzer < Analyzer
  def process!
    @result ||= @values.map do |v|
      v.inject(0, :+).to_f/v.size
    end
  end

  def result
    return {type: 'Array', annotation: 'MX = ', result: @result}
  end

end