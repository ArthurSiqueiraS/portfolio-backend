def assign_default_portfolio(item)
  if item.portfolio.nil?
    item.portfolio = Portfolio.first
  end
end