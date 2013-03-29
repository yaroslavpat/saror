class HistogramAnalyzer < Analyzer
  #def process!
  #  @n = Math.log2(@values[0].length).to_int + 1
  #  @values.map!(&:sort)
  #  @d = @values.each_index.map { |row| @values[row].last - @values[row].first }
  #  @ni = @values.each_index { |row| @values[row].map { |col| @ni[row][col]+=1 if @values[row][col]  } }
  #  # @h = @values.map
  #  @result = @values
  #end
  def process!
    segments_amount = Math.log2(@values[0].size).ceil

    @result = @values.map do |row|
      min_level = row.min
      values_area = row.max - min_level
      histogram_step = values_area.to_f / segments_amount
      if row.max == min_level
        histogram_step = 1
      end

      histogram = Array.new(segments_amount, 0)
      row.each do |value|
        histogram_index = ((value - min_level).to_f / histogram_step).floor
        histogram_index = segments_amount - 1 if histogram_index >= segments_amount
        Rails.logger.debug "hi: #{histogram_index}; sgs: #{segments_amount}, val: #{value}, min: #{min_level}, hs: #{histogram_step}"
        histogram[histogram_index] += 1
      end

      histogram.map { |value| value.to_f / row.size }
    end
  end

  def result
    return {type: 'Array', annotation: "Histogram: ", result: @result}
  end
end