local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
  pre_hook = function(ctx)
    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
}

-- Usage
-- Either use the command CommentToggle, e.g.:
--
-- CommentToggle comment/uncomment current line
-- 67,69CommentToggle comment/uncomment a range
-- '<,'>CommentToggle comment/uncomment a visual selection
-- Or use the default mappings:
--
-- gcc comment/uncomment current line, this does not take a count, if you want a count use the gc{count}{motion}
-- gc{motion} comment/uncomment selection defined by a motion (as lines are commented, any comment toggling actions will default to a linewise):
-- gcip comment/uncomment a paragraph
-- gc4w comment/uncomment current line
-- gc4j comment/uncomment 4 lines below the current line
-- dic delete comment block
-- gcic uncomment commented block
