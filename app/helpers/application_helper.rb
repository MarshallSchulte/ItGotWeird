module ApplicationHelper

# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "It Got Weird"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
