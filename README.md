Salve o script

Abra o Agendador de Tarefas do Windows.

Clique em Criar Tarefa → dê um nome (ex: LimpezaAutomatica).

Aba Gatilhos → escolha diário ou semanal.

Aba Ações → Novo →

Programa/script: powershell.exe

Adicionar argumentos: -ExecutionPolicy Bypass -File "C:\Caminho\LimpezaNotebook.ps1"

Aba Configurações → marque Executar com privilégios mais altos.

Salve e pronto!# Script_Limpeza_Automatica_Notebook_and_PC-s
