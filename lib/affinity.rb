module Affinity

  class << self
    def normal_pdf(mu,sigma,x)
      (1/(sigma * Math.sqrt(2*Math::PI))) * Math.exp(-((x-mu)**2)/(2*sigma**2))
    end

    def linspace(initVal, last, num)
      arr = [*initVal..num]
      arr = arr.collect{|i| i.to_f*last/num}
      return arr
    end

    def overlap(mu_1, sigma_1, mu_2, sigma_2)
      pdf_delta = lambda {|x| normal_pdf(x, sigma_1, mu_1) - normal_pdf(x, sigma_2, mu_2)}
      Integration.integrate(0, 99, {:tolerance=>1e-10}, &pdf_delta);
    end

    # def gaussian_overlap(xs, xf, yf, ys)
    #   x = linspace(-1,1,20)
    #   # HACK! just a cheap linspace -- should be improved
    #   # x = [-1        , -0.97979798, -0.95959596, -0.93939394, -0.91919192,
    #   #      -0.8989899 , -0.87878788, -0.85858586, -0.83838384, -0.81818182,
    #   #      -0.7979798 , -0.77777778, -0.75757576, -0.73737374, -0.71717172,
    #   #      -0.6969697 , -0.67676768, -0.65656566, -0.63636364, -0.61616162,
    #   #      -0.5959596 , -0.57575758, -0.55555556, -0.53535354, -0.51515152,
    #   #      -0.49494949, -0.47474747, -0.45454545, -0.43434343, -0.41414141,
    #   #      -0.39393939, -0.37373737, -0.35353535, -0.33333333, -0.31313131,
    #   #      -0.29292929, -0.27272727, -0.25252525, -0.23232323, -0.21212121,
    #   #      -0.19191919, -0.17171717, -0.15151515, -0.13131313, -0.11111111,
    #   #      -0.09090909, -0.07070707, -0.05050505, -0.03030303, -0.01010101,
    #   #      0.01010101,  0.03030303,  0.05050505,  0.07070707,  0.09090909,
    #   #      0.11111111,  0.13131313,  0.15151515,  0.17171717,  0.19191919,
    #   #      0.21212121,  0.23232323,  0.25252525,  0.27272727,  0.29292929,
    #   #      0.31313131,  0.33333333,  0.35353535,  0.37373737,  0.39393939,
    #   #      0.41414141,  0.43434343,  0.45454545,  0.47474747,  0.49494949,
    #   #      0.51515152,  0.53535354,  0.55555556,  0.57575758,  0.5959596 ,
    #   #      0.61616162,  0.63636364,  0.65656566,  0.67676768,  0.6969697 ,
    #   #      0.71717172,  0.73737374,  0.75757576,  0.77777778,  0.7979798 ,
    #   #      0.81818182,  0.83838384,  0.85858586,  0.87878788,  0.8989899 ,
    #   #      0.91919192,  0.93939394,  0.95959596,  0.97979798,  1        ]
    #
    #   # NEED TO IMPLEMENT BASIC TRAPIZODIAL INTEGRATION
    #   dataXs = []
    #   for i in x
    #     dataXs.push(normalpdf(xs[0],xs[1], xs[i]))
    #   end
    #   dataXf = []
    #   for i in x
    #     dataXf.push(normalpdf(xf[0],xf[1], xs[i]))
    #   end
    #   pX = Array.new(100) {Array.new(100) {0}}
    #   for i in 0..99
    #     for j in 0..99
    #       pX[i][j] = dataXs[i] * dataXf[j]
    #     end
    #   end
    #   dataYs = []
    #   for i in x
    #     dataYs.push(normalpdf(ys[0],ys[1], xs[i]))
    #   end
    #   dataYf = []
    #   for i in x
    #     dataYf.push(normalpdf(yf[0],yf[1], xs[i]))
    #   end
    #   pY = Array.new(100) {Array.new(100) {0}}
    #   for i in 0..99
    #     for j in 0..99
    #       pY[i][j] = dataYs[i] * dataYf[j]
    #     end
    #   end
    #   int = 0
    #   for i in 0..99
    #     for j in 0..99
    #       int += [pX[i][j], pY[i][j]].min
    #     end
    #   end
    #   print int
    #   return int
    # end

    def distance(xf, xs, yf, ys)
      Math.sqrt((xf[0] - yf[0])**2 + (xs[0] - ys[0])**2)
    end

    def score(user, bill)
      fu = [user.fiscal_mean, user.fiscal_var]
      fb = [bill.fiscal_mean, bill.fiscal_var]
      su = [user.social_mean, user.social_var]
      sb = [bill.social_mean, bill.social_var]
      lambda1 = 1
      lambda2 = 1
      information = overlap(fu, su, fb, sb)
      information = ((information-0.5)**2)/0.25
      d = Analytic.distance(fu, su, fb, sb)
      d = ((d-0.5)**2)/0.25
      s = (lambda1 * information + lambda2 * d)/2
      return s
    end
  end


end
  
