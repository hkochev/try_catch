class ApiConstraint
  attr_reader :version, :default

  def initialize(options)
    @version = options.fetch(:version, 1)
    @default = options.fetch(:default, nil)
  end

  def matches?(request)
    default || request.headers.fetch(:accept).include?("version=#{version}")
  end
end
