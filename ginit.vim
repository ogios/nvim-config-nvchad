" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont! JetBrainsMonoNL Nerd Font Mono:12
endif


call GuiWindowFrameless(1)
GuiWindowOpacity 0.9
