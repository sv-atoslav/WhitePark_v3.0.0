!function(e){"object"==typeof exports&&"object"==typeof module?e(require("../../lib/codemirror")):"function"==typeof define&&define.amd?define(["../../lib/codemirror"],e):e(CodeMirror)}(function(e){"use strict";e.defineMode("verilog",function(n,t){function i(e){for(var n={},t=e.split(" "),i=0;i<t.length;++i)n[t[i]]=!0;return n}function r(e,n){var t=e.peek();if(/[,;:\.]/.test(t))return f=e.next(),null;if(_.test(t))return f=e.next(),"bracket";if("`"==t)return e.next(),e.eatWhile(/[\w\$_]/)?"def":null;if("$"==t)return e.next(),e.eatWhile(/[\w\$_]/)?"meta":null;if("#"==t)return e.next(),e.eatWhile(/[\d_.]/),"def";if('"'==t)return e.next(),n.tokenize=a(t),n.tokenize(e,n);if("/"==t){if(e.next(),e.eat("*"))return n.tokenize=o,o(e,n);if(e.eat("/"))return e.skipToEnd(),"comment";e.backUp(1)}if(e.match(E)||e.match(b)||e.match(z)||e.match(j)||e.match(q)||e.match(k)||e.match(E))return"number";if(e.eatWhile(x))return"meta";if(e.eatWhile(/[\w\$_]/)){var i=e.current();return w[i]?(W[i]&&(f="newblock"),S[i]&&(f="newstatement"),p=i,"keyword"):"variable"}return e.next(),null}function a(e){return function(n,t){for(var i,a=!1,o=!1;null!=(i=n.next());){if(i==e&&!a){o=!0;break}a=!a&&"\\"==i}return(o||!a&&!h)&&(t.tokenize=r),"string"}}function o(e,n){for(var t,i=!1;t=e.next();){if("/"==t&&i){n.tokenize=r;break}i="*"==t}return"comment"}function s(e,n,t,i,r){this.indented=e,this.column=n,this.type=t,this.align=i,this.prev=r}function l(e,n,t){var i=e.indented,r=new s(i,n,t,null,e.context);return e.context=r}function c(e){var n=e.context.type;return")"!=n&&"]"!=n&&"}"!=n||(e.indented=e.context.indented),e.context=e.context.prev}function u(e,n){if(e==n)return!0;var t=n.split(";");for(var i in t)if(e==t[i])return!0;return!1}function d(){var e=[];for(var n in W)if(W[n]){var t=W[n].split(";");for(var i in t)e.push(t[i])}return new RegExp("[{}()\\[\\]]|("+e.join("|")+")$")}var f,p,m=n.indentUnit,g=t.statementIndentUnit||m,y=t.dontAlignCalls,v=t.noIndentKeywords||[],h=t.multiLineStrings,w=i("accept_on alias always always_comb always_ff always_latch and assert assign assume automatic before begin bind bins binsof bit break buf bufif0 bufif1 byte case casex casez cell chandle checker class clocking cmos config const constraint context continue cover covergroup coverpoint cross deassign default defparam design disable dist do edge else end endcase endchecker endclass endclocking endconfig endfunction endgenerate endgroup endinterface endmodule endpackage endprimitive endprogram endproperty endspecify endsequence endtable endtask enum event eventually expect export extends extern final first_match for force foreach forever fork forkjoin function generate genvar global highz0 highz1 if iff ifnone ignore_bins illegal_bins implements implies import incdir include initial inout input inside instance int integer interconnect interface intersect join join_any join_none large let liblist library local localparam logic longint macromodule matches medium modport module nand negedge nettype new nexttime nmos nor noshowcancelled not notif0 notif1 null or output package packed parameter pmos posedge primitive priority program property protected pull0 pull1 pulldown pullup pulsestyle_ondetect pulsestyle_onevent pure rand randc randcase randsequence rcmos real realtime ref reg reject_on release repeat restrict return rnmos rpmos rtran rtranif0 rtranif1 s_always s_eventually s_nexttime s_until s_until_with scalared sequence shortint shortreal showcancelled signed small soft solve specify specparam static string strong strong0 strong1 struct super supply0 supply1 sync_accept_on sync_reject_on table tagged task this throughout time timeprecision timeunit tran tranif0 tranif1 tri tri0 tri1 triand trior trireg type typedef union unique unique0 unsigned until until_with untyped use uwire var vectored virtual void wait wait_order wand weak weak0 weak1 while wildcard wire with within wor xnor xor"),x=/[\+\-\*\/!~&|^%=?:]/,_=/[\[\]{}()]/,k=/\d[0-9_]*/,b=/\d*\s*'s?d\s*\d[0-9_]*/i,z=/\d*\s*'s?b\s*[xz01][xz01_]*/i,j=/\d*\s*'s?o\s*[xz0-7][xz0-7_]*/i,q=/\d*\s*'s?h\s*[0-9a-fxz?][0-9a-fxz?_]*/i,E=/(\d[\d_]*(\.\d[\d_]*)?E-?[\d_]+)|(\d[\d_]*\.\d[\d_]*)/i,M=/^((\w+)|[)}\]])/,C=/[)}\]]/,I=i("case checker class clocking config function generate interface module packageprimitive program property specify sequence table task"),W={};for(var $ in I)W[$]="end"+$;W.begin="end",W.casex="endcase",W.casez="endcase",W["do"]="while",W.fork="join;join_any;join_none",W.covergroup="endgroup";for(var L in v){var $=v[L];W[$]&&(W[$]=undefined)}var S=i("always always_comb always_ff always_latch assert assign assume else export for foreach forever if import initial repeat while");return{electricInput:d(),startState:function(e){return{tokenize:null,context:new s((e||0)-m,0,"top",!1),indented:0,startOfLine:!0}},token:function(e,n){var t=n.context;if(e.sol()&&(null==t.align&&(t.align=!1),n.indented=e.indentation(),n.startOfLine=!0),e.eatSpace())return null;f=null,p=null;var i=(n.tokenize||r)(e,n);if("comment"==i||"meta"==i||"variable"==i)return i;if(null==t.align&&(t.align=!0),f==t.type)c(n);else if(";"==f&&"statement"==t.type||t.type&&u(p,t.type))for(t=c(n);t&&"statement"==t.type;)t=c(n);else if("{"==f)l(n,e.column(),"}");else if("["==f)l(n,e.column(),"]");else if("("==f)l(n,e.column(),")");else if(t&&"endcase"==t.type&&":"==f)l(n,e.column(),"statement");else if("newstatement"==f)l(n,e.column(),"statement");else if("newblock"==f)if("function"!=p||!t||"statement"!=t.type&&"endgroup"!=t.type)if("task"==p&&t&&"statement"==t.type);else{var a=W[p];l(n,e.column(),a)}else;return n.startOfLine=!1,i},indent:function(n,t){if(n.tokenize!=r&&null!=n.tokenize)return e.Pass;var i=n.context,a=t&&t.charAt(0);"statement"==i.type&&"}"==a&&(i=i.prev);var o=!1,s=t.match(M);return s&&(o=u(s[0],i.type)),"statement"==i.type?i.indented+("{"==a?0:g):C.test(i.type)&&i.align&&!y?i.column+(o?0:1):")"!=i.type||o?i.indented+(o?0:m):i.indented+g},blockCommentStart:"/*",blockCommentEnd:"*/",lineComment:"//"}}),e.defineMIME("text/x-verilog",{name:"verilog"}),e.defineMIME("text/x-systemverilog",{name:"systemverilog"})});