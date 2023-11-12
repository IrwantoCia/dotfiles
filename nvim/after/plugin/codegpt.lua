-- vim global
-- vim.g["codegpt_commands_defaults"] = {
--   ["completion"] = {
--     model = "gpt-4",
--   }
-- }

vim.g["codegpt_commands_defaults"] = {
  ["completion"] = {
    model = "gpt-4",
    user_message_template = "I have the following {{language}} code snippet: ```{{filetype}}\n{{text_selection}}```\nComplete the rest. Use best practices and write really good documentation. {{language_instructions}} Only return the code snippet and nothing else.",
    language_instructions = {
      cpp = "Use modern C++ features.",
      java = "Use modern Java syntax. Use var when applicable.",
      js = "Use modern JavaScript syntax. Use const when applicable.",
    },
  },
  ["code_edit"] = {
    model = "gpt-4",
    user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\n{{command_args}}. {{language_instructions}} Only return the code snippet and nothing else.",
    language_instructions = {
      cpp = "Use modern C++ syntax.",
    },
  },
  ["explain"] = {
    user_message_template = "Explain the following {{language}} code: ```{{filetype}}\n{{text_selection}}``` Explain as if you were explaining to another developer.",
    callback_type = "text_popup",
  },
  ["question"] = {
    user_message_template = "I have a question about the following {{language}} code: ```{{filetype}}\n{{text_selection}}``` {{command_args}}",
    callback_type = "text_popup",
  },
  ["debug"] = {
    user_message_template = "Analyze the following {{language}} code for bugs: ```{{filetype}}\n{{text_selection}}```",
    callback_type = "text_popup",
  },
  ["doc"] = {
    model = "gpt-4",
    user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nWrite really good documentation using best practices for the given language. Attention paid to documenting parameters, return types, any exceptions or errors. {{language_instructions}} Only return the code snippet and nothing else.",
    language_instructions = {
      cpp = "Use doxygen style comments for functions.",
      java = "Use JavaDoc style comments for functions.",
      js = "Use JSDoc style comments for functions.",
    },
  },
  ["opt"] = {
    user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nOptimize this code. {{language_instructions}} Only return the code snippet and nothing else.",
    language_instructions = {
      cpp = "Use modern C++.",
    },
  },
  ["tests"] = {
    user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nWrite really good unit tests using best practices for the given language. {{language_instructions}} Only return the unit tests. Only return the code snippet and nothing else. ",
    callback_type = "code_popup",
    language_instructions = {
      cpp = "Use modern C++ syntax. Generate unit tests using the gtest framework.",
      java = "Generate unit tests using the junit framework.",
    },
  },
  ["chat"] = {
    system_message_template = "You are a general assistant to a software developer.",
    user_message_template = "{{command_args}}",
    callback_type = "text_popup",
  },
}
