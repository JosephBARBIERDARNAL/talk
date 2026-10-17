library(ellmer)

list_files <- tool(
  function(path = ".") list.files(path, recursive = TRUE, all.files = TRUE, no.. = TRUE),
  name = "list_files",
  description = "List files under a directory.",
  arguments = list(path = type_string("Directory to list.", required = FALSE))
)

read_file <- tool(
  function(path) paste(readLines(path, warn = FALSE), collapse = "\n"),
  name = "read_file",
  description = "Read a text file.",
  arguments = list(path = type_string("Path to the text file to read."))
)

chat <- chat_anthropic()
chat$register_tools(list(list_files, read_file))

live_console(chat)
