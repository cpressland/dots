user = ENV['USER']

eval_file = -> (path) {
  instance_eval(File.read(File.expand_path(path)))
}

eval_file.call("~/.homebrew/Brewfile.common")
eval_file.call("~/.homebrew/Brewfile.devops")

case user
when 'cpressland'
  eval_file.call("~/.homebrew/Brewfile.personal")
when 'chrispressland'
  eval_file.call("~/.homebrew/Brewfile.work")
  eval_file.call("~/.homebrew/Brewfile.vscode")
end
