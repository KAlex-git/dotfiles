local status_ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

nvim_web_devicons.set_icon {
  sh = {
    icon = "",
    color = "#1DC123",
    cterm_color = "59",
    name = "Sh",
  },
  lua = {
    icon = " ",
    color = "#1DC123",
    cterm_color = "59",
    name = "Sh",
  },
  [".gitattributes"] = {
    icon = "",
    color = "#e24329",
    cterm_color = "59",
    name = "GitAttributes",
  },
  [".gitconfig"] = {
    icon = "",
    color = "#e24329",
    cterm_color = "59",
    name = "GitConfig",
  },
  [".gitignore"] = {
    icon = "",
    color = "#e24329",
    cterm_color = "59",
    name = "GitIgnore",
  },
  [".gitlab-ci.yml"] = {
    icon = "",
    color = "#e24329",
    cterm_color = "166",
    name = "GitlabCI",
  },
  [".gitmodules"] = {
    icon = "",
    color = "#e24329",
    cterm_color = "59",
    name = "GitModules",
  },
  ["diff"] = {
    icon = "",
    color = "#e24329",
    cterm_color = "59",
    name = "Diff",
  },
    ["py"] = {
    icon = " ",
    color = "#ffbc03",
    cterm_color = "61",
    name = "Py",
  },
    ["tex"] = {
    icon = "ﭨ",
    color = "#3D6117",
    cterm_color = "58",
    name = "Tex",
  },
  ["toml"] = {
    icon = " ",
    color = "#6d8086",
    cterm_color = "66",
    name = "Toml",
  },
  ["ts"] = {
    icon = " ",
    color = "#519aba",
    cterm_color = "67",
    name = "Ts",
  },
  ["txt"] = {
    icon = " ",
    color = "#89e051",
    cterm_color = "113",
    name = "Txt",
  },
  ["yaml"] = {
    icon = " ",
    color = "#6d8086",
    cterm_color = "66",
    name = "Yaml",
  },

  ["markdown"] = {
    icon = " ",
    color = "#519aba",
    cterm_color = "67",
    name = "Markdown",
  },
  ["vim"] = {
    icon = " ",
    color = "#519aba",
    cterm_color = "67",
    name = "Vim",
  },
  ["pdf"] = {
    icon = " ",
    color = "#519aba",
    cterm_color = "67",
    name = "Pdf",
  },

}
