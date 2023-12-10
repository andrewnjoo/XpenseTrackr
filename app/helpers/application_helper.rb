module ApplicationHelper
  def index_link
    link_to "Back to Home", root_path, class: "block mb-2 text-blue-500 hover:text-blue-700"
  end
end
