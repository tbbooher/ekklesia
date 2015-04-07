module Affinity

  class << self

    def normal_pdf(x, mu, sigma)
      (1/(sigma*Math.sqrt(2*Math::PI)))*Math.exp(-(x-mu)**2/(2.0*sigma**2))
    end

    def linspace(initVal, last, num)
      arr = [*initVal..num]
      arr = arr.collect{|i| i.to_f*last/num}
      return arr
    end

    def overlap(mu_1, sigma_1, mu_2, sigma_2)
      pdf_delta = lambda {|x| normal_pdf(x, mu_1, sigma_1) - normal_pdf(x, mu_2, sigma_2)}
      # Integration.integrate(0, 99, {:tolerance=>1e-10}, &pdf_delta);
      simpsons_rule(pdf_delta, 0, 99)
    end

    # def simpsons_rule_try_1(f, int_start, int_end, n_points = 100)
    #   l = f.length
    #   if (l > 1) # If the input provided is a vector
    #     n_points=l-1
    #     h=(int_end-int_start)/n_points
    #     h/3*(f[0]+2*(f[2..l].step(2)).sum+4*(f[1..l].step(2)).sum+f[l])
    #   else # If the input provided is an anonymous function
    #     h = (int_end-int_start)/n_points
    #     xi = (int_start..int_end).step(h)
    #     h/3*(f(xi[0])+2*(f(xi[2..l-2].step(2))).sum+4*(f(xi[1..l].step(2))).sum+f(xi[l]))
    #   end
    # end

    def simpsons_rule(f, a, b, n = 20)
      h = (b-a)/n
      k = 0.0
      x = a + h
      1.upto(n/2+1).each do
        k += 4*f.call(x)
        x += 2*h
      end
      x = a + 2*h
      1.upto(n/2) do
        k += 2*f.call(x)
        x += 2*h
      end
      (h/3)*(f.call(a)+f.call(b)+k)
    end

    def distance(xf, xs, yf, ys)
      Math.sqrt((xf[0] - yf[0])**2 + (xs[0] - ys[0])**2)
    end

    # def score(user, bill)
    #   fu = [user.fiscal_mean, user.fiscal_var]
    #   fb = [bill.fiscal_mean, bill.fiscal_var]
    #   su = [user.social_mean, user.social_var]
    #   sb = [bill.social_mean, bill.social_var]
    #   lambda1 = 1
    #   lambda2 = 1
    #   information = overlap(fu, su, fb, sb)
    #   information = ((information-0.5)**2)/0.25
    #   d = Analytic.distance(fu, su, fb, sb)
    #   d = ((d-0.5)**2)/0.25
    #   s = (lambda1 * information + lambda2 * d)/2
    #   return s
    # end
    end
end
  
