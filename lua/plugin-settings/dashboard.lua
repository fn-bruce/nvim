-- dashboard
vim.g.dashboard_footer_icon = '🐬 '
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
  last_session = {
    description = {'  Last Session                            SPC s l'},
    command =  'SessionLoad'},
  find_history = {
    description = {'  Recently Opened Files                   SPC f h'},
    command =  'DashboardFindHistory'},
  find_file  = {
    description = {'  Find File                               SPC f f'},
    command = 'Telescope find_files find_command=rg,--hidden,--files,--glob,!.git'},
  new_file = {
    description = {'  File Browser                            SPC f b'},
    command =  'Telescope file_browser'},
  find_word = {
    description = {'  Find Word                               SPC f w'},
    command = 'DashboardFindWord'},
}
