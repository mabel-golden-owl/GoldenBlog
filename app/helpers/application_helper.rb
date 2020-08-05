module ApplicationHelper
  def post_rate(post)
    return 0 if post.blank?

    rates_sum = post.rates.inject(0) { |sum, rate| sum + rate.value.to_f }
    post.rates.size.positive? ? rates_sum / post.rates.size : 0
  end
end
