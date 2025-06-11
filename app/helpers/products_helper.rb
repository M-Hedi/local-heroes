module ProductsHelper
  def formatted_price(amount)
    if amount.to_f == amount.to_i
      amount.to_i.to_s
    else
      '%.2f' % amount
    end
  end
end
