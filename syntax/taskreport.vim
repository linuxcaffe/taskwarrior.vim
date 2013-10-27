if exists('b:task_report_labels')
    syntax match taskwarrior_tablehead /.*\%1l/
endif

if search('[^\x00-\xff]') == 0
    let exp = 'syntax match taskwarrior_%s /\%%>1l\%%%dc.*\%%<%dc/'
else
    let exp = 'syntax match taskwarrior_%s /\%%>1l\%%%dv.*\%%<%dv/'
endif

if exists('b:task_columns') && exists('b:task_report_columns')
    for i in range(0, len(b:task_report_columns)-1)
        if exists('b:task_columns['.(i+1).']')
            execute printf(exp, b:task_report_columns[i] , b:task_columns[i]+1, b:task_columns[i+1]+1)
        endif
    endfor
endif

highlight default link taskwarrior_tablehead   Tabline
highlight default link taskwarrior_id          VarId
highlight default link taskwarrior_project     String
highlight default link taskwarrior_Status      Include
highlight default link taskwarrior_priority    Class
highlight default link taskwarrior_due         Todo
highlight default link taskwarrior_end         Keyword
highlight default link taskwarrior_description Normal
highlight default link taskwarrior_entry_age   Special
highlight default link taskwarrior_depends     Todo
highlight default link taskwarrior_tags        Keyword
highlight default link taskwarrior_uuid        VarId
highlight default link taskwarrior_urgency     Todo
highlight default link taskwarrior_field       Search
