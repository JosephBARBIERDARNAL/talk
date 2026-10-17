library(ellmer)

list_files <- tool(
  function(path = ".") list.files(path, recursive = TRUE, all.files = TRUE, no.. = TRUE),
  name = "list_files",
  description = "List files under a directory.",
  arguments = list(path = type_string("Directory to list.", required = FALSE))
)

chat <- chat_anthropic()
chat$register_tool(list_files)

live_console(chat)
