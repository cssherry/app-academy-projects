module ApplicationHelper
  def content_for_yield(content_symbol, contents)
    "<% content_for #{content_symbol} do %>
        #{contents}
     <% end %>".html_safe
  end
end
