module Affinity

  # Input: User_F_Mean User_F_Std User_S_Mean User_S_Std Bill_F_Mean Bill_F_Std Bill_S_Mean Bill_S_Std
  #
  def calculate_affinity(User_F_Mean, User_F_Std, User_S_Mean, User_S_Std, Bill_F_Mean, Bill_F_Std, Bill_S_Mean, Bill_S_Std)


  end

  def distance(x_f, x_s, y_f, y_s)
    Math.sqrt((x_f[0] - y_f[0])**2 + (x_s[0] - y_s[0])**2)/Math.sqrt(8)
  end

  def score(user, bill)
    f_u = user[0]
    f_b = bill[0]
    s_u = user[1]
    s_b = bill[1]
    lambda1 = 1
    lambda2 = 1
    information = gaussian_overlap(f_u, s_u, f_b, s_b)
    #Apply U Fonction
    information = ((information-0.5)**2)/0.25
    distance = self.distance(f_u, s_u, f_b, s_b)
    distance = ((distance-0.5)**2)/0.25
    (lambda1 * information + lambda2 * distance)/2
  end

  def gaussian_overlap(x_f, x_s, y_f, y_s)
    pXs = stats.norm(loc=x_s[0], scale=x_s[1])
    pXf = stats.norm(loc=x_f[0], scale=x_f[1])
    pYs = stats.norm(loc=y_s[0], scale=y_s[1])
    pYf = stats.norm(loc=y_f[0], scale=y_f[1])
    x = np.linspace(-1, 1, 100)
    dataXs = pXs.cdf(x)
    dataXs /= dataXs.sum()
    dataXf = pXf.cdf(x)
    dataXf /= dataXf.sum()
    pX = np.zeros((100, 100))
    for i in range(100) :
      for j in range(100) :
        pX[i][j] = dataXs[i] * dataXf[j]
        dataYs = pYs.cdf(x)
        dataYs /= dataYs.sum()
        dataYf = pYf.cdf(x)
        dataYf /= dataYf.sum()
        pY = np.zeros((100, 100))
        for i in range(100) :
          for j in range(100) :
            pY[i][j] = dataYs[i] * dataYf[j]
            int = 0
            for i in range(100) :
              for j in range(100) :
                int += min(pX[i][j], pY[i][j])
                return int
              end
            end
          end
        end
      end
    end
  end


end
  
