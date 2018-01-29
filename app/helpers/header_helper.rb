module HeaderHelper
  def header
    @header ||= {
      background: true,
      logo: true,
      loggin: true
    }
  end
end
