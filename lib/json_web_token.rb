class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, 'df3d0bab2a056c834fdfceb4875ccb88c6f09e3089b3af67d3667874de3382056fd1e79eed09084519040c710cfc2822b736afb65d6937f251ca0c93f8e4092a')
    end

    def decode(token) 
      body = JWT.decode(token, 'df3d0bab2a056c834fdfceb4875ccb88c6f09e3089b3af67d3667874de3382056fd1e79eed09084519040c710cfc2822b736afb65d6937f251ca0c93f8e4092a')[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end