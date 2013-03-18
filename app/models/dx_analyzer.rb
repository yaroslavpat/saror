class DxAnalyzer < Analyzer
  def process!
    @result ||= @values.map do |v|
      mx = v.inject(0, :+).to_f/v.size
      v.inject(0){|memo, obj| memo += (obj-mx)**2}.to_f / (v.size-1)
    end
  end

  def result
    return {type: 'Array', annotation: 'DX = ', result: @result}
  end
end
