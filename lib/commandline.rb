require 'post2zendesk'

put_text_inside_me = Post2Zendesk.new

def comment_via_stdin_or_pipe
  return (STDIN.tty? ? ARGV[1] : STDIN.read)
end

comment = comment_via_stdin_or_pipe

put_text_inside_me.updateticket(ARGV[0], comment)
put_text_inside_me.printreply
