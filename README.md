taskwarrior.vim
===============
_a vim interface for [Taskwarrior](https://taskwarrior.org)_

![screenshot](https://raw.githubusercontent.com/linuxcaffe/taskwarrior.vim/master/screenshot.gif)

## Introduction

**This project was origionally developed by [blindFS/vim-taskwarrior](https://github.com/blindFS/vim-taskwarrior) with some design and badgerring by djp,
then renamed, maintained and improved by [xarthurx/taskwarrior.vim](https://github.com/xarthurx/taskwarrior.vim) now forked by [linuxcaffe/taskwarrior.vim](https://github.com/linuxcaffe/taskwarrior.vim) for maintenance and development.**

----
[taskwarrior.vim](https://github.com/linuxcaffe/taskwarrior.vim) is a vim plugin that extends Taskwarrior with an interactive
interface. It features a rich set of mappings and commands, is easy to customize,
and makes adding, modifying, sorting, reporting and marking done, fast, easy and fun!

## Things added by xarthurx's fork

* Support for native Windows 10 by calling *TaskWarrior* from *WSL* (*TaskWarrior* need to be installed inside *WSL*).
* Fix `del` and `undo` bug by ignoring confirmation from shell.
* Various small bugs has been fixed by browsing the issue list from the original repo.
* Fix an issue that treat multiple tags connected with `<space>` as a single tag.
* Fix an issue that not be able to cancel modification process.
* Merge multiple calls of shell cmd to improve performance in *WSL* environment.


## Prerequisites:

This plugin requires Taskwarrior 2.3.0 or higher. see: https://taskwarrior.org/download/

Neovim version 0.3 is suggested.
Vim version 8.x might have issues for shortcut keys. (https://github.com/xarthurx/taskwarrior.vim/issues/1)

Suggested plugins

* [vim-airline](https://github.com/bling/vim-airline) for [better statusline information](https://github.com/farseer90718/vim-taskwarrior#screenshot).
* [unite.vim](https://github.com/Shougo/unite.vim) for easier bookmark/history operations.


## Installation:

Either [download zip file](https://github.com/farseer90718/vim-taskwarrior/archive/master.zip)
and extract in ~/.vim or use your favorite plugin manager.

- [Pathogen](https://github.com/tpope/vim-pathogen)
    - `git clone https://github.com/linuxcaffe/taskwarrior.vim ~/.vim/bundle/taskwarrior.vim`
- [Vundle](https://github.com/gmarik/vundle)
    1. Add `Plugin 'linuxcaffe/taskwarrior.vim'` to .vimrc
    2. Run `:BundleInstall`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
    1. Add `NeoBundle 'linuxcaffe/taskwarrior.vim'` to .vimrc
    2. Run `:NeoBundleInstall`
- [vim-plug](https://github.com/junegunn/vim-plug)
    1. Add `Plug 'linuxcaffe/taskwarrior.vim'` to .vimrc
    2. Run `:PlugInstall`


### Native Windows Support with WSL

Since TaskWarrior does not provide a [native Windows version](https://github.com/GothenburgBitFactory/taskwarrior/issues/2159), native Windows VIM users need to install it inside *WSL* environment. The plugin will take care of the rest.

## Options

### Default map:

```vim
nnoremap <buffer> +       ... " start task
nnoremap <buffer> -       ... " stop task
nnoremap <buffer> <       ... " sort by this column ascending.(if already ascending then decrease its priority)
nnoremap <buffer> >       ... " sort by this column descending.(if already descending then decrease its priority)
nnoremap <buffer> <CR>    ... " show task info
nnoremap <buffer> <F1>    ... " show vim-tw.txt help
nnoremap <buffer> <left>  ... " skip left to the previous non-empty column
nnoremap <buffer> <right> ... " skip right to the next non-empty column
nnoremap <buffer> <TAB>   ... " move right the next column
nnoremap <buffer> <S-TAB> ... " move left to the previous column
nnoremap <buffer> <Space> ... " select/remove current task to/from selected list
nnoremap <buffer> a       ... " create new task
nnoremap <buffer> A       ... " add annotation
nnoremap <buffer> B       ... " create a bookmark for current combination
nnoremap <buffer> c       ... " execute a task command for selected task(s)
nnoremap <buffer> d       ... " task done (completed)
nnoremap <buffer> D       ... " delete field/annotation/task
nnoremap <buffer> f       ... " change filter
nnoremap <buffer> H       ... " cycle column format left
nnoremap <buffer> J       ... " next historical entry
nnoremap <buffer> K       ... " previous historical entry
nnoremap <buffer> L       ... " cycle column format right
nnoremap <buffer> m       ... " modify current field
nnoremap <buffer> M       ... " modify current task with (customizable) prompts
nnoremap <buffer> o       ... " open the annotation as a file
nnoremap <buffer> p       ... " duplicate selected task(s)
nnoremap <buffer> q       ... " quit
nnoremap <buffer> r       ... " change report (use config option for custom reports)
nnoremap <buffer> R       ... " refresh the report/ clear selected list
nnoremap <buffer> s       ... " sort by this column primarily.(if already of the highest priority then switch the polarity)
nnoremap <buffer> S       ... " task sync
nnoremap <buffer> u       ... " undo last change.
nnoremap <buffer> x       ... " delete annotation.
nnoremap <buffer> X       ... " clear all completed tasks

vnoremap <buffer> <CR>    ... " show information about visual selected tasks
vnoremap <buffer> <Space> ... " add visual selected tasks to selected list
vnoremap <buffer> d       ... " set done to all visual selected tasks
vnoremap <buffer> D       ... " delete all visual selected tasks

```
### Commands:

```vim
:TW [args]            " task [filter report arguments]
:TWAdd                " add new tasks interactively
:TWAnnotate           " add an annotation
:TWBookmark           " list bookmarks using unite.vim
:TWBookmarkClear      " clear bookmarks
:TWComplete           " mark task done
:TWDelete             " deleta a task
:TWDeleteAnnotation   " delete an annotation
:TWDeleteCompleted    " clear all completed tasks
:TWEditTaskrc         " edit ~/.taskrc
:TWEditVitrc          " edit ~/.vitrc
:TWHistory            " list history records using unite.vim
:TWHistoryClear       " clear history
:TWModifyInteractive  " make changes to a task interactively (use with caution!)
:TWReportInfo         " run the info report
:TWReportSort [args]  " overide the sort method, reset to default if no arguments passed
:TWSync               " synchronise with taskd server
:TWToggleHLField      " toggle highlight field option
:TWToggleReadonly     " toggle readonly option
:TWUndo               " undo the previous modification
```
----
### User options:

```vim
" default task report type
let g:task_report_name     = 'list'
" custom reports have to be listed explicitly to make them available
let g:task_report_command  = []
" whether the field under the cursor is highlighted
let g:task_highlight_field = 1
" can not make change to task data when set to 1
let g:task_readonly        = 0
" vim built-in term for task undo in gvim
let g:task_gui_term        = 1
" allows user to override task configurations. Seperated by space. Defaults to ''
let g:task_rc_override     = 'rc.defaultwidth=999'
" default fields to ask when adding a new task
let g:task_default_prompt  = ['due', 'description']
" whether the info window is splited vertically
let g:task_info_vsplit     = 0
" info window size
let g:task_info_size       = 15
" info window position
let g:task_info_position   = 'belowright'
" directory to store log files defaults to taskwarrior data.location
let g:task_log_directory   = '~/.task'
" max number of historical entries
let g:task_log_max         = '20'
" forward arrow shown on statusline
let g:task_left_arrow      = ' <<'
" backward arrow ...
let g:task_left_arrow      = '>> '


" for native windows, the following two commands are used

```vim
let g:taskwarrior_cmd      = 'wsl task'
let g:task_grep            = 'findstr'
```

If you experience line-wrapping issues, add the following line to your .vimrc
```
let g:task_rc_override = 'rc.defaultwidth=0'
```
If you experience task truncation (taskwarrior.vim not showing enough tasks) add the following line to your .vimrc
```vim
let g:task_rc_override = 'rc.defaultheight=0'
```
----
### Syntax highlightling:

Default scheme:

```vim
highlight default link taskwarrior_Status      Include
highlight default link taskwarrior_depends     Todo
highlight default link taskwarrior_description Normal
highlight default link taskwarrior_due         Todo
highlight default link taskwarrior_end         Keyword
highlight default link taskwarrior_entry       Special
highlight default link taskwarrior_field       IncSearch
highlight default link taskwarrior_id          VarId
highlight default link taskwarrior_priority    Class
highlight default link taskwarrior_project     String
highlight default link taskwarrior_selected    Visual
highlight default link taskwarrior_tablehead   Tabline
highlight default link taskwarrior_tags        Keyword
highlight default link taskwarrior_urgency     Todo
highlight default link taskwarrior_uuid        VarId
```

Feel free to change any of above by something like below in your `vimrc`.

```vim
hi taskwarrior_xxx  guibg = xxx guifg = xxx ctermbg = xxx ctermfg = xxx
```


## Acknowledgement:

* [vim-airline](https://github.com/bling/vim-airline) by bling
* [unite.vim](https://github.com/Shougo/unite.vim)   by Shougo
* [webapi-vim](https://github.com/mattn/webapi-vim)  by mattn

## License:

[MIT](https://raw.github.com/xarthurx/taskwarrior.vim/master/LICENSE.txt)

