!function(e){e.jgrid=e.jgrid||{},e.extend(e.jgrid,{defaults:{recordtext:"{0} - {1} \u5171 {2} \u689d",emptyrecords:"\u6c92\u6709\u8a18\u9304",loadtext:"\u8f09\u5165\u4e2d...",pgtext:" {0} \u5171 {1} \u9801"},search:{caption:"\u641c\u5c0b...",Find:"\u641c\u5c0b",Reset:"\u91cd\u8a2d",odata:[{oper:"eq",text:"\u7b49\u65bc "},{oper:"ne",text:"\u4e0d\u7b49\u65bc "},{oper:"lt",text:"\u5c0f\u65bc "},{oper:"le",text:"\u5c0f\u65bc\u7b49\u65bc "},{oper:"gt",text:"\u5927\u65bc "},{oper:"ge",text:"\u5927\u65bc\u7b49\u65bc "},{oper:"bw",text:"\u958b\u59cb\u65bc "},{oper:"bn",text:"\u4e0d\u958b\u59cb\u65bc "},{oper:"in",text:"\u5728\u5176\u4e2d "},{oper:"ni",text:"\u4e0d\u5728\u5176\u4e2d "},{oper:"ew",text:"\u7d50\u675f\u65bc "},{oper:"en",text:"\u4e0d\u7d50\u675f\u65bc "},{oper:"cn",text:"\u5305\u542b "},{oper:"nc",text:"\u4e0d\u5305\u542b "},{oper:"nu",text:"is null"},{oper:"nn",text:"is not null"}],groupOps:[{op:"AND",text:"\u6240\u6709"},{op:"OR",text:"\u4efb\u4e00"}],operandTitle:"Click to select search operation.",resetTitle:"Reset Search Value"},edit:{addCaption:"\u65b0\u589e\u8a18\u9304",editCaption:"\u7de8\u8f2f\u8a18\u9304",bSubmit:"\u63d0\u4ea4",bCancel:"\u53d6\u6d88",bClose:"\u95dc\u9589",saveData:"\u8cc7\u6599\u5df2\u6539\u8b8a\uff0c\u662f\u5426\u5132\u5b58\uff1f",bYes:"\u662f",bNo:"\u5426",bExit:"\u53d6\u6d88",msg:{required:"\u6b64\u6b04\u5fc5\u8981",number:"\u8acb\u8f38\u5165\u6709\u6548\u7684\u6578\u5b57",minValue:"\u503c\u5fc5\u9808\u5927\u65bc\u7b49\u65bc ",maxValue:"\u503c\u5fc5\u9808\u5c0f\u65bc\u7b49\u65bc ",email:"\u4e0d\u662f\u6709\u6548\u7684e-mail\u5730\u5740",integer:"\u8acb\u8f38\u5165\u6709\u6548\u6574\u6570",date:"\u8acb\u8f38\u5165\u6709\u6548\u6642\u9593",url:"\u7db2\u5740\u7121\u6548\u3002\u524d\u7db4\u5fc5\u9808\u70ba ('http://' \u6216 'https://')",nodefined:" \u672a\u5b9a\u7fa9\uff01",novalue:" \u9700\u8981\u50b3\u56de\u503c\uff01",customarray:"\u81ea\u8a02\u51fd\u6578\u61c9\u50b3\u56de\u9663\u5217\uff01",customfcheck:"\u81ea\u8a02\u6aa2\u67e5\u61c9\u6709\u81ea\u8a02\u51fd\u6578\uff01"}},view:{caption:"\u67e5\u770b\u8a18\u9304",bClose:"\u95dc\u9589"},del:{caption:"\u522a\u9664",msg:"\u522a\u9664\u5df2\u9078\u8a18\u9304\uff1f",bSubmit:"\u522a\u9664",bCancel:"\u53d6\u6d88"},nav:{edittext:"",edittitle:"\u7de8\u8f2f\u5df2\u9078\u5217",addtext:"",addtitle:"\u65b0\u589e\u5217",deltext:"",deltitle:"\u522a\u9664\u5df2\u9078\u5217",searchtext:"",searchtitle:"\u641c\u5c0b\u8a18\u9304",refreshtext:"",refreshtitle:"\u91cd\u65b0\u6574\u7406\u8868\u683c",alertcap:"\u8b66\u544a",alerttext:"\u8acb\u9078\u64c7\u5217",viewtext:"",viewtitle:"\u6aa2\u8996\u5df2\u9078\u5217"},col:{caption:"\u9078\u64c7\u6b04",bSubmit:"\u78ba\u5b9a",bCancel:"\u53d6\u6d88"},errors:{errcap:"\u932f\u8aa4",nourl:"\u672a\u8a2d\u5b9aURL",norecords:"\u7121\u9700\u8981\u8655\u7406\u7684\u8a18\u9304",model:"colNames \u548c colModel \u9577\u5ea6\u4e0d\u540c\uff01"},formatter:{integer:{thousandsSeparator:" ",defaultValue:"0"},number:{decimalSeparator:".",thousandsSeparator:" ",decimalPlaces:2,defaultValue:"0.00"},currency:{decimalSeparator:".",thousandsSeparator:" ",decimalPlaces:2,prefix:"",suffix:"",defaultValue:"0.00"},date:{dayNames:["\u65e5","\u4e00","\u4e8c","\u4e09","\u56db","\u4e94","\u516d","\u661f\u671f\u65e5","\u661f\u671f\u4e00","\u661f\u671f\u4e8c","\u661f\u671f\u4e09","\u661f\u671f\u56db","\u661f\u671f\u4e94","\u661f\u671f\u516d"],monthNames:["\u4e00","\u4e8c","\u4e09","\u56db","\u4e94","\u516d","\u4e03","\u516b","\u4e5d","\u5341","\u5341\u4e00","\u5341\u4e8c","\u4e00\u6708","\u4e8c\u6708","\u4e09\u6708","\u56db\u6708","\u4e94\u6708","\u516d\u6708","\u4e03\u6708","\u516b\u6708","\u4e5d\u6708","\u5341\u6708","\u5341\u4e00\u6708","\u5341\u4e8c\u6708"],AmPm:["\u4e0a\u5348","\u4e0b\u5348","\u4e0a\u5348","\u4e0b\u5348"],S:function(e){return e<11||e>13?["st","nd","rd","th"][Math.min((e-1)%10,3)]:"th"},srcformat:"Y-m-d",newformat:"m-d-Y",parseRe:/[#%\\\/:_;.,\t\s-]/,masks:{ISO8601Long:"Y-m-d H:i:s",ISO8601Short:"Y-m-d",ShortDate:"Y/j/n",LongDate:"l, F d, Y",FullDateTime:"l, F d, Y g:i:s A",MonthDay:"F d",ShortTime:"g:i A",LongTime:"g:i:s A",SortableDateTime:"Y-m-d\\TH:i:s",UniversalSortableDateTime:"Y-m-d H:i:sO",YearMonth:"F, Y"},reformatAfterEdit:!1},baseLinkUrl:"",showAction:"",target:"",checkbox:{disabled:!0},idName:"id"}})}(jQuery);