!function(e){e.jgrid=e.jgrid||{},e.extend(e.jgrid,{defaults:{recordtext:"Ver {0} - {1} de {2}",emptyrecords:"Nenhum registro para visualizar",loadtext:"Carregando...",pgtext:"P\xe1gina {0} de {1}"},search:{caption:"Procurar...",Find:"Procurar",Reset:"Resetar",odata:[{oper:"eq",text:"igual"},{oper:"ne",text:"diferente"},{oper:"lt",text:"menor"},{oper:"le",text:"menor ou igual"},{oper:"gt",text:"maior"},{oper:"ge",text:"maior ou igual"},{oper:"bw",text:"inicia com"},{oper:"bn",text:"n\xe3o inicia com"},{oper:"in",text:"est\xe1 em"},{oper:"ni",text:"n\xe3o est\xe1 em"},{oper:"ew",text:"termina com"},{oper:"en",text:"n\xe3o termina com"},{oper:"cn",text:"cont\xe9m"},{oper:"nc",text:"n\xe3o cont\xe9m"},{oper:"nu",text:"nulo"},{oper:"nn",text:"n\xe3o nulo"}],groupOps:[{op:"AND",text:"todos"},{op:"OR",text:"qualquer um"}],operandTitle:"Click to select search operation.",resetTitle:"Reset Search Value"},edit:{addCaption:"Incluir",editCaption:"Alterar",bSubmit:"Enviar",bCancel:"Cancelar",bClose:"Fechar",saveData:"Os dados foram alterados! Salvar altera\xe7\xf5es?",bYes:"Sim",bNo:"N\xe3o",bExit:"Cancelar",msg:{required:"Campo obrigat\xf3rio",number:"Por favor, informe um n\xfamero v\xe1lido",minValue:"valor deve ser igual ou maior que ",maxValue:"valor deve ser menor ou igual a",email:"este e-mail n\xe3o \xe9 v\xe1lido",integer:"Por favor, informe um valor inteiro",date:"Por favor, informe uma data v\xe1lida",url:"n\xe3o \xe9 uma URL v\xe1lida. Prefixo obrigat\xf3rio ('http://' or 'https://')",nodefined:" n\xe3o est\xe1 definido!",novalue:" um valor de retorno \xe9 obrigat\xf3rio!",customarray:"Fun\xe7\xe3o customizada deve retornar um array!",customfcheck:"Fun\xe7\xe3o customizada deve estar presente em caso de valida\xe7\xe3o customizada!"}},view:{caption:"Ver Registro",bClose:"Fechar"},del:{caption:"Apagar",msg:"Apagar registro(s) selecionado(s)?",bSubmit:"Apagar",bCancel:"Cancelar"},nav:{edittext:" ",edittitle:"Alterar registro selecionado",addtext:" ",addtitle:"Incluir novo registro",deltext:" ",deltitle:"Apagar registro selecionado",searchtext:" ",searchtitle:"Procurar registros",refreshtext:"",refreshtitle:"Recarregando tabela",alertcap:"Aviso",alerttext:"Por favor, selecione um registro",viewtext:"",viewtitle:"Ver linha selecionada"},col:{caption:"Mostrar/Esconder Colunas",bSubmit:"Enviar",bCancel:"Cancelar"},errors:{errcap:"Erro",nourl:"Nenhuma URL definida",norecords:"Sem registros para exibir",model:"Comprimento de colNames <> colModel!"},formatter:{integer:{thousandsSeparator:" ",defaultValue:"0"},number:{decimalSeparator:",",thousandsSeparator:" ",decimalPlaces:2,defaultValue:"0,00"},currency:{decimalSeparator:",",thousandsSeparator:".",decimalPlaces:2,prefix:"R$ ",suffix:"",defaultValue:"0,00"},date:{dayNames:["Dom","Seg","Ter","Qua","Qui","Sex","S\xe1b","Domingo","Segunda","Ter\xe7a","Quarta","Quinta","Sexta","S\xe1bado"],monthNames:["Jan","Fev","Mar","Abr","Mai","Jun","Jul","Ago","Set","Out","Nov","Dez","Janeiro","Fevereiro","Mar\xe7o","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"],AmPm:["am","pm","AM","PM"],S:function(e){return e<11||e>13?["\xba","\xba","\xba","\xba"][Math.min((e-1)%10,3)]:"\xba"},srcformat:"Y-m-d",newformat:"d/m/Y",parseRe:/[#%\\\/:_;.,\t\s-]/,masks:{ISO8601Long:"Y-m-d H:i:s",ISO8601Short:"Y-m-d",ShortDate:"n/j/Y",LongDate:"l, F d, Y",FullDateTime:"l, F d, Y g:i:s A",MonthDay:"F d",ShortTime:"g:i A",LongTime:"g:i:s A",SortableDateTime:"Y-m-d\\TH:i:s",UniversalSortableDateTime:"Y-m-d H:i:sO",YearMonth:"F, Y"},reformatAfterEdit:!1},baseLinkUrl:"",showAction:"",target:"",checkbox:{disabled:!0},idName:"id"}})}(jQuery);