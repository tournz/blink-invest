class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  def sumproduct(a, b)
    sum, i, n = 0, 0, a.size
    while i < n
      sum += a[i] * b[i]
      i += 1
    end
    sum
  end

end
