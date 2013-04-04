class NormalityAnalyzer < Analyzer
  def process_line(line)
    sample_cdf = line.sort.map { |x| cdf(line, x)}
    mx = line.inject(0, :+).to_f/line.size
    dx = line.inject(0){ |memo, obj| memo += (obj-mx)**2}.to_f / (line.size-1)
    ideal_cdf = line.sort.map { |x| 0.5+0.5*(Math.erf((x.to_f - mx)/Math.sqrt(2*dx))) }
    kolmogorov_statistic = sample_cdf.zip(ideal_cdf).map {|a, b| (a - b).abs }.max
    lambda_value = kolmogorov_statistic * Math.sqrt(line.size)
    alpha = 0.05
    threshold_value = Math.sqrt(-0.5 * Math.log(alpha/2))
    lambda_value <= threshold_value
    # return [sample_cdf, kolmogorov_statistic, lambda_value, threshold_value]
  end

  def cdf(t, x)
    count = 0.0
    t.each { |value| count += 1.0 if value <= x }
    prob = count / t.size
  end

  def process!
     @result = @values.map { |line| process_line(line)}
  end

  def result
    return {type: 'Array', annotation: "Normality: ", result: @result}
  end
end