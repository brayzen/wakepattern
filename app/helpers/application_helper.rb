module ApplicationHelper
  def load_traits_list
    @TRAITS ||= YAML::load_file("#{Rails.root}/app/constants/traits.yml")
  end
end
