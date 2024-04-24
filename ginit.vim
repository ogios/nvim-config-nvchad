" Enable Mouse
set mouse=a
set guifontwide=JetBrainsMonoNL\ Nerd\ Font\ Mono:12
set guifontwide=JetBrainsMonoNL\ Nerd\ Font\ Mono:10

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont! JetBrainsMonoNL Nerd Font Mono:12
    GuiFont! JetBrainsMonoNL Nerd Font Mono:10
endif
