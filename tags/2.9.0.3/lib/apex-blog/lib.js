/* SyntaxHighlighter
 * http://alexgorbatchev.com/SyntaxHighlighter
 * SyntaxHighlighter is donationware. If you are using it, please donate.
 * http://alexgorbatchev.com/SyntaxHighlighter/donate.html
 * @version
 * 3.0.83 (July 02 2010)
 * @copyright
 * Copyright (C) 2004-2010 Alex Gorbatchev.
 * @license
 * Dual licensed under the MIT and GPL licenses.
 */
var XRegExp;if(XRegExp)throw Error("can't load XRegExp twice in the same frame");(function(e){function c(e,t){if(!XRegExp.isRegExp(e))throw TypeError("type RegExp expected");var n=e._xregexp;return e=XRegExp(e.source,h(e)+(t||"")),n&&(e._xregexp={source:n.source,captureNames:n.captureNames?n.captureNames.slice(0):null}),e}function h(e){return(e.global?"g":"")+(e.ignoreCase?"i":"")+(e.multiline?"m":"")+(e.extended?"x":"")+(e.sticky?"y":"")}function p(e,t,n,r){var o=s.length,u,a,f;i=!0;try{while(o--){f=s[o];if(n&f.scope&&(!f.trigger||f.trigger.call(r))){f.pattern.lastIndex=t,a=f.pattern.exec(e);if(a&&a.index===t){u={output:f.handler.call(r,a,n),match:a};break}}}}catch(l){throw l}finally{i=!1}return u}function d(e,t,n){if(Array.prototype.indexOf)return e.indexOf(t,n);for(var r=n||0;r<e.length;r++)if(e[r]===t)return r;return-1}XRegExp=function(t,r){var s=[],u=XRegExp.OUTSIDE_CLASS,a=0,f,h,d,v,m;if(XRegExp.isRegExp(t)){if(r!==e)throw TypeError("can't supply flags when constructing one RegExp from another");return c(t)}if(i)throw Error("can't call the XRegExp constructor within token definition functions");r=r||"",f={hasNamedCapture:!1,captureNames:[],hasFlag:function(e){return r.indexOf(e)>-1},setFlag:function(e){r+=e}};while(a<t.length)h=p(t,a,u,f),h?(s.push(h.output),a+=h.match[0].length||1):(d=o.exec.call(l[u],t.slice(a)))?(s.push(d[0]),a+=d[0].length):(v=t.charAt(a),v==="["?u=XRegExp.INSIDE_CLASS:v==="]"&&(u=XRegExp.OUTSIDE_CLASS),s.push(v),a++);return m=RegExp(s.join(""),o.replace.call(r,n,"")),m._xregexp={source:t,captureNames:f.hasNamedCapture?f.captureNames:null},m},XRegExp.version="1.5.1",XRegExp.INSIDE_CLASS=1,XRegExp.OUTSIDE_CLASS=2;var t=/\$(?:(\d\d?|[$&`'])|{([$\w]+)})/g,n=/[^gimy]+|([\s\S])(?=[\s\S]*\1)/g,r=/^(?:[?*+]|{\d+(?:,\d*)?})\??/,i=!1,s=[],o={exec:RegExp.prototype.exec,test:RegExp.prototype.test,match:String.prototype.match,replace:String.prototype.replace,split:String.prototype.split},u=o.exec.call(/()??/,"")[1]===e,a=function(){var e=/^/g;return o.test.call(e,""),!e.lastIndex}(),f=RegExp.prototype.sticky!==e,l={};l[XRegExp.INSIDE_CLASS]=/^(?:\\(?:[0-3][0-7]{0,2}|[4-7][0-7]?|x[\dA-Fa-f]{2}|u[\dA-Fa-f]{4}|c[A-Za-z]|[\s\S]))/,l[XRegExp.OUTSIDE_CLASS]=/^(?:\\(?:0(?:[0-3][0-7]{0,2}|[4-7][0-7]?)?|[1-9]\d*|x[\dA-Fa-f]{2}|u[\dA-Fa-f]{4}|c[A-Za-z]|[\s\S])|\(\?[:=!]|[?*+]\?|{\d+(?:,\d*)?}\??)/,XRegExp.addToken=function(e,t,n,r){s.push({pattern:c(e,"g"+(f?"y":"")),handler:t,scope:n||XRegExp.OUTSIDE_CLASS,trigger:r||null})},XRegExp.cache=function(e,t){var n=e+"/"+(t||"");return XRegExp.cache[n]||(XRegExp.cache[n]=XRegExp(e,t))},XRegExp.copyAsGlobal=function(e){return c(e,"g")},XRegExp.escape=function(e){return e.replace(/[-[\]{}()*+?.,\\^$|#\s]/g,"\\$&")},XRegExp.execAt=function(e,t,n,r){var i=c(t,"g"+(r&&f?"y":"")),s;return i.lastIndex=n=n||0,s=i.exec(e),r&&s&&s.index!==n&&(s=null),t.global&&(t.lastIndex=s?i.lastIndex:0),s},XRegExp.freezeTokens=function(){XRegExp.addToken=function(){throw Error("can't run addToken after freezeTokens")}},XRegExp.isRegExp=function(e){return Object.prototype.toString.call(e)==="[object RegExp]"},XRegExp.iterate=function(e,t,n,r){var i=c(t,"g"),s=-1,o;while(o=i.exec(e))t.global&&(t.lastIndex=i.lastIndex),n.call(r,o,++s,e,t),i.lastIndex===o.index&&i.lastIndex++;t.global&&(t.lastIndex=0)},XRegExp.matchChain=function(e,t){return function n(e,r){var i=t[r].regex?t[r]:{regex:t[r]},s=c(i.regex,"g"),o=[],u;for(u=0;u<e.length;u++)XRegExp.iterate(e[u],s,function(e){o.push(i.backref?e[i.backref]||"":e[0])});return r===t.length-1||!o.length?o:n(o,r+1)}([e],0)},RegExp.prototype.apply=function(e,t){return this.exec(t[0])},RegExp.prototype.call=function(e,t){return this.exec(t)},RegExp.prototype.exec=function(t){var n,r,i,s;this.global||(s=this.lastIndex),n=o.exec.apply(this,arguments);if(n){!u&&n.length>1&&d(n,"")>-1&&(i=RegExp(this.source,o.replace.call(h(this),"g","")),o.replace.call((t+"").slice(n.index),i,function(){for(var t=1;t<arguments.length-2;t++)arguments[t]===e&&(n[t]=e)}));if(this._xregexp&&this._xregexp.captureNames)for(var f=1;f<n.length;f++)r=this._xregexp.captureNames[f-1],r&&(n[r]=n[f]);!a&&this.global&&!n[0].length&&this.lastIndex>n.index&&this.lastIndex--}return this.global||(this.lastIndex=s),n},RegExp.prototype.test=function(e){var t,n;return this.global||(n=this.lastIndex),t=o.exec.call(this,e),t&&!a&&this.global&&!t[0].length&&this.lastIndex>t.index&&this.lastIndex--,this.global||(this.lastIndex=n),!!t},String.prototype.match=function(e){XRegExp.isRegExp(e)||(e=RegExp(e));if(e.global){var t=o.match.apply(this,arguments);return e.lastIndex=0,t}return e.exec(this)},String.prototype.replace=function(e,n){var r=XRegExp.isRegExp(e),i,s,u,a;return r?(e._xregexp&&(i=e._xregexp.captureNames),e.global||(a=e.lastIndex)):e+="",Object.prototype.toString.call(n)==="[object Function]"?s=o.replace.call(this+"",e,function(){if(i){arguments[0]=new String(arguments[0]);for(var t=0;t<i.length;t++)i[t]&&(arguments[0][i[t]]=arguments[t+1])}return r&&e.global&&(e.lastIndex=arguments[arguments.length-2]+arguments[0].length),n.apply(null,arguments)}):(u=this+"",s=o.replace.call(u,e,function(){var e=arguments;return o.replace.call(n+"",t,function(t,n,r){if(!n){var o=+r;return o<=e.length-3?e[o]:(o=i?d(i,r):-1,o>-1?e[o+1]:t)}switch(n){case"$":return"$";case"&":return e[0];case"`":return e[e.length-1].slice(0,e[e.length-2]);case"'":return e[e.length-1].slice(e[e.length-2]+e[0].length);default:var s="";n=+n;if(!n)return t;while(n>e.length-3)s=String.prototype.slice.call(n,-1)+s,n=Math.floor(n/10);return(n?e[n]||"":"$")+s}})})),r&&(e.global?e.lastIndex=0:e.lastIndex=a),s},String.prototype.split=function(t,n){if(!XRegExp.isRegExp(t))return o.split.apply(this,arguments);var r=this+"",i=[],s=0,u,a;if(n===e||+n<0)n=Infinity;else{n=Math.floor(+n);if(!n)return[]}t=XRegExp.copyAsGlobal(t);while(u=t.exec(r)){if(t.lastIndex>s){i.push(r.slice(s,u.index)),u.length>1&&u.index<r.length&&Array.prototype.push.apply(i,u.slice(1)),a=u[0].length,s=t.lastIndex;if(i.length>=n)break}t.lastIndex===u.index&&t.lastIndex++}return s===r.length?(!o.test.call(t,"")||a)&&i.push(""):i.push(r.slice(s)),i.length>n?i.slice(0,n):i},XRegExp.addToken(/\(\?#[^)]*\)/,function(e){return o.test.call(r,e.input.slice(e.index+e[0].length))?"":"(?:)"}),XRegExp.addToken(/\((?!\?)/,function(){return this.captureNames.push(null),"("}),XRegExp.addToken(/\(\?<([$\w]+)>/,function(e){return this.captureNames.push(e[1]),this.hasNamedCapture=!0,"("}),XRegExp.addToken(/\\k<([\w$]+)>/,function(e){var t=d(this.captureNames,e[1]);return t>-1?"\\"+(t+1)+(isNaN(e.input.charAt(e.index+e[0].length))?"":"(?:)"):e[0]}),XRegExp.addToken(/\[\^?]/,function(e){return e[0]==="[]"?"\\b\\B":"[\\s\\S]"}),XRegExp.addToken(/^\(\?([imsx]+)\)/,function(e){return this.setFlag(e[1]),""}),XRegExp.addToken(/(?:\s+|#.*)+/,function(e){return o.test.call(r,e.input.slice(e.index+e[0].length))?"":"(?:)"},XRegExp.OUTSIDE_CLASS,function(){return this.hasFlag("x")}),XRegExp.addToken(/\./,function(){return"[\\s\\S]"},XRegExp.OUTSIDE_CLASS,function(){return this.hasFlag("s")})})();if(typeof SyntaxHighlighter=="undefined")var SyntaxHighlighter=function(){function t(e,t){return e.className.indexOf(t)!=-1}function n(e,n){t(e,n)||(e.className+=" "+n)}function r(e,t){e.className=e.className.replace(t,"")}function i(e){var t=[];for(var n=0;n<e.length;n++)t.push(e[n]);return t}function s(e){return e.split(/\r?\n/)}function o(e){var t="highlighter_";return e.indexOf(t)==0?e:t+e}function u(t){return e.vars.highlighters[o(t)]}function a(e){return document.getElementById(o(e))}function f(t){e.vars.highlighters[o(t.id)]=t}function l(e,t,n){if(e==null)return null;var r=n!=1?e.childNodes:[e.parentNode],i={"#":"id",".":"className"}[t.substr(0,1)]||"nodeName",s,o;s=i!="nodeName"?t.substr(1):t.toUpperCase();if((e[i]||"").indexOf(s)!=-1)return e;for(var u=0;r&&u<r.length&&o==null;u++)o=l(r[u],t,n);return o}function c(e,t){return l(e,t,!0)}function h(e,t,n){n=Math.max(n||0,0);for(var r=n;r<e.length;r++)if(e[r]==t)return r;return-1}function p(e){return(e||"")+Math.round(Math.random()*1e6).toString()}function d(e,t){var n={},r;for(r in e)n[r]=e[r];for(r in t)n[r]=t[r];return n}function v(e){var t={"true":!0,"false":!1}[e];return t==null?e:t}function m(e,t,n,r,i){var s=(screen.width-n)/2,o=(screen.height-r)/2;i+=", left="+s+", top="+o+", width="+n+", height="+r,i=i.replace(/^,/,"");var u=window.open(e,t,i);return u.focus(),u}function g(e,t,n,r){function i(e){e=e||window.event,e.target||(e.target=e.srcElement,e.preventDefault=function(){this.returnValue=!1}),n.call(r||window,e)}e.attachEvent?e.attachEvent("on"+t,i):e.addEventListener(t,i,!1)}function y(t){window.alert(e.config.strings.alert+t)}function b(t,n){var r=e.vars.discoveredBrushes,i=null;if(r==null){r={};for(var s in e.brushes){var o=e.brushes[s],u=o.aliases;if(u==null)continue;o.brushName=s.toLowerCase();for(var a=0;a<u.length;a++)r[u[a]]=s}e.vars.discoveredBrushes=r}return i=e.brushes[r[t]],i==null&&n&&y(e.config.strings.noBrush+t),i}function w(e,t){var n=s(e);for(var r=0;r<n.length;r++)n[r]=t(n[r],r);return n.join("\r\n")}function E(e){return e.replace(/^[ ]*[\n]+|[\n]*[ ]*$/g,"")}function S(e){var t,n={},r=new XRegExp("^\\[(?<values>(.*?))\\]$"),i=new XRegExp("(?<name>[\\w-]+)\\s*:\\s*(?<value>[\\w-%#]+|\\[.*?\\]|\".*?\"|'.*?')\\s*;?","g");while((t=i.exec(e))!=null){var s=t.value.replace(/^['"]|['"]$/g,"");if(s!=null&&r.test(s)){var o=r.exec(s);s=o.values.length>0?o.values.split(/\s*,\s*/):[]}n[t.name]=s}return n}function x(t,n){return t==null||t.length==0||t=="\n"?t:(t=t.replace(/</g,"&lt;"),t=t.replace(/ {2,}/g,function(t){var n="";for(var r=0;r<t.length-1;r++)n+=e.config.space;return n+" "}),n!=null&&(t=w(t,function(e){if(e.length==0)return"";var t="";return e=e.replace(/^(&nbsp;| )+/,function(e){return t=e,""}),e.length==0?t:t+'<code class="'+n+'">'+e+"</code>"})),t)}function T(e,t){var n=e.toString();while(n.length<t)n="0"+n;return n}function N(e,t){var n="";for(var r=0;r<t;r++)n+=" ";return e.replace(/\t/g,n)}function C(e,t){function u(e,t,n){return e.substr(0,t)+i.substr(0,n)+e.substr(t+1,e.length)}var n=s(e),r="	",i="";for(var o=0;o<50;o++)i+="                    ";return e=w(e,function(e){if(e.indexOf(r)==-1)return e;var n=0;while((n=e.indexOf(r))!=-1){var i=t-n%t;e=u(e,n,i)}return e}),e}function k(t){var n=/<br\s*\/?>|&lt;br\s*\/?&gt;/gi;return e.config.bloggerMode==1&&(t=t.replace(n,"\n")),e.config.stripBrs==1&&(t=t.replace(n,"")),t}function L(e){return e.replace(/^\s+|\s+$/g,"")}function A(e){var t=s(k(e)),n=new Array,r=/^\s*/,i=1e3;for(var o=0;o<t.length&&i>0;o++){var u=t[o];if(L(u).length==0)continue;var a=r.exec(u);if(a==null)return e;i=Math.min(a[0].length,i)}if(i>0)for(var o=0;o<t.length;o++)t[o]=t[o].substr(i);return t.join("\n")}function O(e,t){return e.index<t.index?-1:e.index>t.index?1:e.length<t.length?-1:e.length>t.length?1:0}function M(t,n){function r(e,t){return e[0]}var i=0,s=null,o=[],u=n.func?n.func:r;while((s=n.regex.exec(t))!=null){var a=u(s,n);typeof a=="string"&&(a=[new e.Match(a,s.index,n.css)]),o=o.concat(a)}return o}function _(t){var n=/(.*)((&gt;|&lt;).*)/;return t.replace(e.regexLib.url,function(e){var t="",r=null;if(r=n.exec(e))e=r[1],t=r[2];return'<a href="'+e+'">'+e+"</a>"+t})}function D(){var e=document.getElementsByTagName("script"),t=[];for(var n=0;n<e.length;n++)e[n].type=="syntaxhighlighter"&&t.push(e[n]);return t}function P(e){var t="<![CDATA[",n="]]>",r=L(e),i=!1,s=t.length,o=n.length;r.indexOf(t)==0&&(r=r.substring(s),i=!0);var u=r.length;return r.indexOf(n)==u-o&&(r=r.substring(0,u-o),i=!0),i?r:e}function H(e){var t=e.target,i=c(t,".syntaxhighlighter"),s=c(t,".container"),o=document.createElement("textarea"),a;if(!s||!i||l(s,"textarea"))return;a=u(i.id),n(i,"source");var f=s.childNodes,h=[];for(var p=0;p<f.length;p++)h.push(f[p].innerText||f[p].textContent);h=h.join("\r"),h=h.replace(/\u00a0/g," "),o.appendChild(document.createTextNode(h)),s.appendChild(o),o.focus(),o.select(),g(o,"blur",function(e){o.parentNode.removeChild(o),r(i,"source")})}typeof require!="undefined"&&typeof XRegExp=="undefined"&&(XRegExp=require("XRegExp").XRegExp);var e={defaults:{"class-name":"","first-line":1,"pad-line-numbers":!1,highlight:null,title:null,"smart-tabs":!0,"tab-size":4,gutter:!0,toolbar:!0,"quick-code":!0,collapse:!1,"auto-links":!0,light:!1,unindent:!0,"html-script":!1},config:{space:"&nbsp;",useScriptTags:!0,bloggerMode:!1,stripBrs:!1,tagName:"pre",strings:{expandSource:"expand source",help:"?",alert:"SyntaxHighlighter\n\n",noBrush:"Can't find brush for: ",brushNotHtmlScript:"Brush wasn't configured for html-script option: ",aboutDialog:"@ABOUT@"}},vars:{discoveredBrushes:null,highlighters:{}},brushes:{},regexLib:{multiLineCComments:/\/\*[\s\S]*?\*\//gm,singleLineCComments:/\/\/.*$/gm,singleLinePerlComments:/#.*$/gm,doubleQuotedString:/"([^\\"\n]|\\.)*"/g,singleQuotedString:/'([^\\'\n]|\\.)*'/g,multiLineDoubleQuotedString:new XRegExp('"([^\\\\"]|\\\\.)*"',"gs"),multiLineSingleQuotedString:new XRegExp("'([^\\\\']|\\\\.)*'","gs"),xmlComments:/(&lt;|<)!--[\s\S]*?--(&gt;|>)/gm,url:/\w+:\/\/[\w-.\/?%&=:@;#]*/g,phpScriptTags:{left:/(&lt;|<)\?(?:=|php)?/g,right:/\?(&gt;|>)/g,eof:!0},aspScriptTags:{left:/(&lt;|<)%=?/g,right:/%(&gt;|>)/g},scriptScriptTags:{left:/(&lt;|<)\s*script.*?(&gt;|>)/gi,right:/(&lt;|<)\/\s*script\s*(&gt;|>)/gi}},toolbar:{getHtml:function(t){function s(t,n){return e.toolbar.getButtonHtml(t,n,e.config.strings[n])}var n='<div class="toolbar">',r=e.toolbar.items,i=r.list;for(var o=0;o<i.length;o++)n+=(r[i[o]].getHtml||s)(t,i[o]);return n+="</div>",n},getButtonHtml:function(e,t,n){return'<span><a href="#" class="toolbar_item command_'+t+" "+t+'">'+n+"</a></span>"},handler:function(t){function i(e){var t=new RegExp(e+"_(\\w+)"),n=t.exec(r);return n?n[1]:null}var n=t.target,r=n.className||"",s=u(c(n,".syntaxhighlighter").id),o=i("command");s&&o&&e.toolbar.items[o].execute(s),t.preventDefault()},items:{list:["expandSource","help"],expandSource:{getHtml:function(t){if(t.getParam("collapse")!=1)return"";var n=t.getParam("title");return e.toolbar.getButtonHtml(t,"expandSource",n?n:e.config.strings.expandSource)},execute:function(e){var t=a(e.id);r(t,"collapsed")}},help:{execute:function(t){var n=m("","_blank",500,250,"scrollbars=0"),r=n.document;r.write(e.config.strings.aboutDialog),r.close(),n.focus()}}}},findElements:function(t,n){var r=n?[n]:i(document.getElementsByTagName(e.config.tagName)),s=e.config,o=[];s.useScriptTags&&(r=r.concat(D()));if(r.length===0)return o;for(var u=0;u<r.length;u++){var a={target:r[u],params:d(t,S(r[u].className))};if(a.params["brush"]==null)continue;o.push(a)}return o},highlight:function(t,n){var r=this.findElements(t,n),i="innerHTML",s=null,o=e.config;if(r.length===0)return;for(var u=0;u<r.length;u++){var n=r[u],a=n.target,f=n.params,l=f.brush,c;if(l==null)continue;if(f["html-script"]=="true"||e.defaults["html-script"]==1)s=new e.HtmlScript(l),l="htmlscript";else{var h=b(l);if(!h)continue;s=new h}c=a[i],o.useScriptTags&&(c=P(c)),(a.title||"")!=""&&(f.title=a.title),f.brush=l,s.init(f),n=s.getDiv(c),(a.id||"")!=""&&(n.id=a.id),a.parentNode.replaceChild(n,a)}},all:function(t){g(window,"load",function(){e.highlight(t)})}};return e.Match=function(e,t,n){this.value=e,this.index=t,this.length=e.length,this.css=n,this.brushName=null},e.Match.prototype.toString=function(){return this.value},e.HtmlScript=function(t){function f(e,t){for(var n=0;n<e.length;n++)e[n].index+=t}function l(e,t){var i=e.code,s=[],o=r.regexList,u=e.index+e.left.length,a=r.htmlScript,l;for(var c=0;c<o.length;c++)l=M(i,o[c]),f(l,u),s=s.concat(l);a.left!=null&&e.left!=null&&(l=M(e.left,a.left),f(l,e.index),s=s.concat(l)),a.right!=null&&e.right!=null&&(l=M(e.right,a.right),f(l,e.index+e[0].lastIndexOf(e.right)),s=s.concat(l));for(var h=0;h<s.length;h++)s[h].brushName=n.brushName;return s}var n=b(t),r,i=new e.brushes.Xml,s=null,o=this,u="getDiv getHtml init".split(" ");if(n==null)return;r=new n;for(var a=0;a<u.length;a++)(function(){var e=u[a];o[e]=function(){return i[e].apply(i,arguments)}})();if(r.htmlScript==null){y(e.config.strings.brushNotHtmlScript+t);return}i.regexList.push({regex:r.htmlScript.code,func:l})},e.Highlighter=function(){},e.Highlighter.prototype={getParam:function(e,t){var n=this.params[e];return v(n==null?t:n)},create:function(e){return document.createElement(e)},findMatches:function(e,t){var n=[];if(e!=null)for(var r=0;r<e.length;r++)typeof e[r]=="object"&&(n=n.concat(M(t,e[r])));return this.removeNestedMatches(n.sort(O))},removeNestedMatches:function(e){for(var t=0;t<e.length;t++){if(e[t]===null)continue;var n=e[t],r=n.index+n.length;for(var i=t+1;i<e.length&&e[t]!==null;i++){var s=e[i];if(s===null)continue;if(s.index>r)break;s.index==n.index&&s.length>n.length?e[t]=null:s.index>=n.index&&s.index<r&&(e[i]=null)}}return e},figureOutLineNumbers:function(e){var t=[],n=parseInt(this.getParam("first-line"));return w(e,function(e,r){t.push(r+n)}),t},isLineHighlighted:function(e){var t=this.getParam("highlight",[]);return typeof t!="object"&&t.push==null&&(t=[t]),h(t,e.toString())!=-1},getLineHtml:function(e,t,n){var r=["line","number"+t,"index"+e,"alt"+(t%2==0?1:2).toString()];return this.isLineHighlighted(t)&&r.push("highlighted"),t==0&&r.push("break"),'<div class="'+r.join(" ")+'">'+n+"</div>"},getLineNumbersHtml:function(t,n){var r="",i=s(t).length,o=parseInt(this.getParam("first-line")),u=this.getParam("pad-line-numbers");u==1?u=(o+i-1).toString().length:isNaN(u)==1&&(u=0);for(var a=0;a<i;a++){var f=n?n[a]:o+a,t=f==0?e.config.space:T(f,u);r+=this.getLineHtml(a,f,t)}return r},getCodeLinesHtml:function(t,n){t=L(t);var r=s(t),i=this.getParam("pad-line-numbers"),o=parseInt(this.getParam("first-line")),t="",u=this.getParam("brush");for(var a=0;a<r.length;a++){var f=r[a],l=/^(&nbsp;|\s)+/.exec(f),c=null,h=n?n[a]:o+a;l!=null&&(c=l[0].toString(),f=f.substr(c.length),c=c.replace(" ",e.config.space)),f=L(f),f.length==0&&(f=e.config.space),t+=this.getLineHtml(a,h,(c!=null?'<code class="'+u+' spaces">'+c+"</code>":"")+f)}return t},getTitleHtml:function(e){return e?"<caption>"+e+"</caption>":""},getMatchesHtml:function(e,t){function s(e){var t=e?e.brushName||i:i;return t?t+" ":""}var n=0,r="",i=this.getParam("brush","");for(var o=0;o<t.length;o++){var u=t[o],a;if(u===null||u.length===0)continue;a=s(u),r+=x(e.substr(n,u.index-n),a+"plain")+x(u.value,a+u.css),n=u.index+u.length+(u.offset||0)}return r+=x(e.substr(n),s()+"plain"),r},getHtml:function(t){var n="",r=["syntaxhighlighter"],i,s,u;return this.getParam("light")==1&&(this.params.toolbar=this.params.gutter=!1),className="syntaxhighlighter",this.getParam("collapse")==1&&r.push("collapsed"),(gutter=this.getParam("gutter"))==0&&r.push("nogutter"),r.push(this.getParam("class-name")),r.push(this.getParam("brush")),t=E(t).replace(/\r/g," "),i=this.getParam("tab-size"),t=this.getParam("smart-tabs")==1?C(t,i):N(t,i),this.getParam("unindent")&&(t=A(t)),gutter&&(u=this.figureOutLineNumbers(t)),s=this.findMatches(this.regexList,t),n=this.getMatchesHtml(t,s),n=this.getCodeLinesHtml(n,u),this.getParam("auto-links")&&(n=_(n)),typeof navigator!="undefined"&&navigator.userAgent&&navigator.userAgent.match(/MSIE/)&&r.push("ie"),n='<div id="'+o(this.id)+'" class="'+r.join(" ")+'">'+(this.getParam("toolbar")?e.toolbar.getHtml(this):"")+'<table border="0" cellpadding="0" cellspacing="0">'+this.getTitleHtml(this.getParam("title"))+"<tbody>"+"<tr>"+(gutter?'<td class="gutter">'+this.getLineNumbersHtml(t)+"</td>":"")+'<td class="code">'+'<div class="container">'+n+"</div>"+"</td>"+"</tr>"+"</tbody>"+"</table>"+"</div>",n},getDiv:function(t){t===null&&(t=""),this.code=t;var n=this.create("div");return n.innerHTML=this.getHtml(t),this.getParam("toolbar")&&g(l(n,".toolbar"),"click",e.toolbar.handler),this.getParam("quick-code")&&g(l(n,".code"),"dblclick",H),n},init:function(t){this.id=p(),f(this),this.params=d(e.defaults,t||{}),this.getParam("light")==1&&(this.params.toolbar=this.params.gutter=!1)},getKeywords:function(e){return e=e.replace(/^\s+|\s+$/g,"").replace(/\s+/g,"|"),"\\b(?:"+e+")\\b"},forHtmlScript:function(e){var t={end:e.right.source};e.eof&&(t.end="(?:(?:"+t.end+")|$)"),this.htmlScript={left:{regex:e.left,css:"script"},right:{regex:e.right,css:"script"},code:new XRegExp("(?<left>"+e.left.source+")"+"(?<code>.*?)"+"(?<right>"+t.end+")","sgi")}}},e}();typeof exports!="undefined"?exports.SyntaxHighlighter=SyntaxHighlighter:null
SyntaxHighlighter.defaults["toolbar"]=false;
;(function(){SyntaxHighlighter=SyntaxHighlighter || (typeof require !== 'undefined'? require('shCore').SyntaxHighlighter : null);function Brush(){};Brush.prototype=new SyntaxHighlighter.Highlighter();Brush.aliases=['text','plain'];SyntaxHighlighter.brushes.Plain=Brush;typeof(exports)!='undefined'?exports.Brush=Brush:null;})();
/* jQuery plugin: fieldSelection - v0.1.1 - last change: 2006-12-16
 * (c) 2006 Alex Brem <alex@0xab.cd> - http://blog.0xab.cd
 */
(function(c){c.each({getSelection:function(){var b=this.jquery?this[0]:this;return("selectionStart"in b&&function(){var a=b.selectionEnd-b.selectionStart;return{start:b.selectionStart,end:b.selectionEnd,length:a,text:b.value.substr(b.selectionStart,a)}}||document.selection&&function(){b.focus();var a=document.selection.createRange();if(null===a)return{start:0,end:b.value.length,length:0};var d=b.createTextRange(),c=d.duplicate();d.moveToBookmark(a.getBookmark());c.setEndPoint("EndToStart",d);return{start:c.text.length, end:c.text.length+a.text.length,length:a.text.length,text:a.text}}||function(){return null})()},replaceSelection:function(b){var a=this.jquery?this[0]:this,d=b||"";return("selectionStart"in a&&function(){a.value=a.value.substr(0,a.selectionStart)+d+a.value.substr(a.selectionEnd,a.value.length);return this}||document.selection&&function(){a.focus();document.selection.createRange().text=d;return this}||function(){a.value+=d;return c(a)})()}},function(b){c.fn[b]=this})})(jQuery);
function addStyleTag(b,c){var d="<"+b+">",e="</"+b+">",a=$($x(c)),f=a.getSelection().text;a.replaceSelection(d+f+e);a.focus()};
/* Slimbox v2.05 - The ultimate lightweight Lightbox clone for jQuery
 * (c) 2007-2013 Christophe Beyls <http://www.digitalia.be>
 * MIT-style license.
*/
(function(w){var E=w(window),u,f,F=-1,n,x,D,v,y,L,r,m=!window.XMLHttpRequest,s=[],l=document.documentElement,k={},t=new Image(),J=new Image(),H,a,g,p,I,d,G,c,A,K;w(function(){w("body").append(w([H=w('<div id="lbOverlay" />').click(C)[0],a=w('<div id="lbCenter" />')[0],G=w('<div id="lbBottomContainer" />')[0]]).css("display","none"));g=w('<div id="lbImage" />').appendTo(a).append(p=w('<div style="position: relative;" />').append([I=w('<a id="lbPrevLink" href="#" />').click(B)[0],d=w('<a id="lbNextLink" href="#" />').click(e)[0]])[0])[0];c=w('<div id="lbBottom" />').appendTo(G).append([w('<a id="lbCloseLink" href="#" />').click(C)[0],A=w('<div id="lbCaption" />')[0],K=w('<div id="lbNumber" />')[0],w('<div style="clear: both;" />')[0]])[0]});w.slimbox=function(O,N,M){u=w.extend({loop:false,overlayOpacity:0.8,overlayFadeDuration:400,resizeDuration:400,resizeEasing:"swing",initialWidth:250,initialHeight:250,imageFadeDuration:400,captionAnimationDuration:400,counterText:"Image {x} of {y}",closeKeys:[27,88,67],previousKeys:[37,80],nextKeys:[39,78]},M);if(typeof O=="string"){O=[[O,N]];N=0}y=E.scrollTop()+(E.height()/2);L=u.initialWidth;r=u.initialHeight;w(a).css({top:Math.max(0,y-(r/2)),width:L,height:r,marginLeft:-L/2}).show();v=m||(H.currentStyle&&(H.currentStyle.position!="fixed"));if(v){H.style.position="absolute"}w(H).css("opacity",u.overlayOpacity).fadeIn(u.overlayFadeDuration);z();j(1);f=O;u.loop=u.loop&&(f.length>1);return b(N)};w.fn.slimbox=function(M,P,O){P=P||function(Q){return[Q.href,Q.title]};O=O||function(){return true};var N=this;return N.unbind("click").click(function(){var S=this,U=0,T,Q=0,R;T=w.grep(N,function(W,V){return O.call(S,W,V)});for(R=T.length;Q<R;++Q){if(T[Q]==S){U=Q}T[Q]=P(T[Q],Q)}return w.slimbox(T,U,M)})};function z(){var N=E.scrollLeft(),M=E.width();w([a,G]).css("left",N+(M/2));if(v){w(H).css({left:N,top:E.scrollTop(),width:M,height:E.height()})}}function j(M){if(M){w("object").add(m?"select":"embed").each(function(O,P){s[O]=[P,P.style.visibility];P.style.visibility="hidden"})}else{w.each(s,function(O,P){P[0].style.visibility=P[1]});s=[]}var N=M?"bind":"unbind";E[N]("scroll resize",z);w(document)[N]("keydown",o)}function o(O){var N=O.which,M=w.inArray;return(M(N,u.closeKeys)>=0)?C():(M(N,u.nextKeys)>=0)?e():(M(N,u.previousKeys)>=0)?B():null}function B(){return b(x)}function e(){return b(D)}function b(M){if(M>=0){F=M;n=f[F][0];x=(F||(u.loop?f.length:0))-1;D=((F+1)%f.length)||(u.loop?0:-1);q();a.className="lbLoading";k=new Image();k.onload=i;k.src=n}return false}function i(){a.className="";w(g).css({backgroundImage:"url("+n+")",visibility:"hidden",display:""});w(p).width(k.width);w([p,I,d]).height(k.height);w(A).html(f[F][1]||"");w(K).html((((f.length>1)&&u.counterText)||"").replace(/{x}/,F+1).replace(/{y}/,f.length));if(x>=0){t.src=f[x][0]}if(D>=0){J.src=f[D][0]}L=g.offsetWidth;r=g.offsetHeight;var M=Math.max(0,y-(r/2));if(a.offsetHeight!=r){w(a).animate({height:r,top:M},u.resizeDuration,u.resizeEasing)}if(a.offsetWidth!=L){w(a).animate({width:L,marginLeft:-L/2},u.resizeDuration,u.resizeEasing)}w(a).queue(function(){w(G).css({width:L,top:M+r,marginLeft:-L/2,visibility:"hidden",display:""});w(g).css({display:"none",visibility:"",opacity:""}).fadeIn(u.imageFadeDuration,h)})}function h(){if(x>=0){w(I).show()}if(D>=0){w(d).show()}w(c).css("marginTop",-c.offsetHeight).animate({marginTop:0},u.captionAnimationDuration);G.style.visibility=""}function q(){k.onload=null;k.src=t.src=J.src=n;w([a,g,c]).stop(true);w([I,d,g,G]).hide()}function C(){if(F>=0){q();F=x=D=-1;w(a).hide();w(H).stop().fadeOut(u.overlayFadeDuration,j)}return false}})(jQuery);
/* Basic jQuery Slider plug-in v.1.3
 * http://www.basic-slider.com
 * Authored by John Cobb
 * http://www.johncobb.name
 * @john0514
 * Copyright 2011, John Cobb
 * License: GNU General Public License, version 3 (GPL-3.0)
 * http://www.opensource.org/licenses/gpl-3.0.html
 */
(function(e){"use strict";e.fn.bjqs=function(t){var n={width:700,height:300,animtype:"fade",animduration:450,animspeed:4e3,automatic:!0,showcontrols:!0,centercontrols:!0,nexttext:"Next",prevtext:"Prev",showmarkers:!0,centermarkers:!0,keyboardnav:!0,hoverpause:!0,usecaptions:!0,randomstart:!1,responsive:!1},r=e.extend({},n,t),i=this,s=i.find("ul.bjqs"),o=s.children("li"),u=null,a=null,f=null,l=null,c=null,h=null,p=null,d=null,v={slidecount:o.length,animating:!1,paused:!1,currentslide:1,nextslide:0,currentindex:0,nextindex:0,interval:null},m={width:null,height:null,ratio:null},g={fwd:"forward",prev:"previous"},y=function(){o.addClass("bjqs-slide");r.responsive?b():E();if(v.slidecount>1){r.randomstart&&L();r.showcontrols&&x();r.showmarkers&&T();r.keyboardnav&&N();r.hoverpause&&r.automatic&&C();r.animtype==="slide"&&S()}r.usecaptions&&k();if(r.animtype==="slide"&&!r.randomstart){v.currentindex=1;v.currentslide=2}s.show();o.eq(v.currentindex).show();r.automatic&&(v.interval=setInterval(function(){O(g.fwd,!1)},r.animspeed))},b=function(){m.width=i.outerWidth();m.ratio=m.width/r.width,m.height=r.height*m.ratio;if(r.animtype==="fade"){o.css({height:r.height,width:"100%"});o.children("img").css({height:r.height,width:"100%"});s.css({height:r.height,width:"100%"});i.css({height:r.height,"max-width":r.width,position:"relative"});if(m.width<r.width){o.css({height:m.height});o.children("img").css({height:m.height});s.css({height:m.height});i.css({height:m.height})}e(window).resize(function(){m.width=i.outerWidth();m.ratio=m.width/r.width,m.height=r.height*m.ratio;o.css({height:m.height});o.children("img").css({height:m.height});s.css({height:m.height});i.css({height:m.height})})}if(r.animtype==="slide"){o.css({height:r.height,width:r.width});o.children("img").css({height:r.height,width:r.width});s.css({height:r.height,width:r.width*r.slidecount});i.css({height:r.height,"max-width":r.width,position:"relative"});if(m.width<r.width){o.css({height:m.height});o.children("img").css({height:m.height});s.css({height:m.height});i.css({height:m.height})}e(window).resize(function(){m.width=i.outerWidth(),m.ratio=m.width/r.width,m.height=r.height*m.ratio;o.css({height:m.height,width:m.width});o.children("img").css({height:m.height,width:m.width});s.css({height:m.height,width:m.width*r.slidecount});i.css({height:m.height});h.css({height:m.height,width:m.width});w(function(){O(!1,v.currentslide)},200,"some unique string")})}},w=function(){var e={};return function(t,n,r){r||(r="Don't call this twice without a uniqueId");e[r]&&clearTimeout(e[r]);e[r]=setTimeout(t,n)}}(),E=function(){o.css({height:r.height,width:r.width});s.css({height:r.height,width:r.width});i.css({height:r.height,width:r.width,position:"relative"})},S=function(){p=o.eq(0).clone();d=o.eq(v.slidecount-1).clone();p.attr({"data-clone":"last","data-slide":0}).appendTo(s).show();d.attr({"data-clone":"first","data-slide":0}).prependTo(s).show();o=s.children("li");v.slidecount=o.length;h=e('<div class="bjqs-wrapper"></div>');if(r.responsive&&m.width<r.width){h.css({width:m.width,height:m.height,overflow:"hidden",position:"relative"});s.css({width:m.width*(v.slidecount+2),left:-m.width*v.currentslide})}else{h.css({width:r.width,height:r.height,overflow:"hidden",position:"relative"});s.css({width:r.width*(v.slidecount+2),left:-r.width*v.currentslide})}o.css({"float":"left",position:"relative",display:"list-item"});h.prependTo(i);s.appendTo(h)},x=function(){u=e('<ul class="bjqs-controls"></ul>');a=e('<li class="bjqs-next"><a href="#" data-direction="'+g.fwd+'">'+r.nexttext+"</a></li>");f=e('<li class="bjqs-prev"><a href="#" data-direction="'+g.prev+'">'+r.prevtext+"</a></li>");u.on("click","a",function(t){t.preventDefault();var n=e(this).attr("data-direction");if(!v.animating){n===g.fwd&&O(g.fwd,!1);n===g.prev&&O(g.prev,!1)}});f.appendTo(u);a.appendTo(u);u.appendTo(i);if(r.centercontrols){u.addClass("v-centered");var t=(i.height()-a.children("a").outerHeight())/2,n=t/r.height*100,s=n+"%";a.find("a").css("top",s);f.find("a").css("top",s)}},T=function(){l=e('<ol class="bjqs-markers"></ol>');e.each(o,function(t,n){var i=t+1,s=t+1;r.animtype==="slide"&&(s=t+2);var o=e('<li><a href="#">'+i+"</a></li>");i===v.currentslide&&o.addClass("active-marker");o.on("click","a",function(e){e.preventDefault();!v.animating&&v.currentslide!==s&&O(!1,s)});o.appendTo(l)});l.appendTo(i);c=l.find("li");if(r.centermarkers){l.addClass("h-centered");var t=(r.width-l.width())/2;l.css("left",t)}},N=function(){e(document).keyup(function(e){if(!v.paused){clearInterval(v.interval);v.paused=!0}if(!v.animating)if(e.keyCode===39){e.preventDefault();O(g.fwd,!1)}else if(e.keyCode===37){e.preventDefault();O(g.prev,!1)}if(v.paused&&r.automatic){v.interval=setInterval(function(){O(g.fwd)},r.animspeed);v.paused=!1}})},C=function(){i.hover(function(){if(!v.paused){clearInterval(v.interval);v.paused=!0}},function(){if(v.paused){v.interval=setInterval(function(){O(g.fwd,!1)},r.animspeed);v.paused=!1}})},k=function(){e.each(o,function(t,n){var r=e(n).children("img:first-child").attr("title");r||(r=e(n).children("a").find("img:first-child").attr("title"));if(r){r=e('<p class="bjqs-caption">'+r+"</p>");r.appendTo(e(n))}})},L=function(){var e=Math.floor(Math.random()*v.slidecount)+1;v.currentslide=e;v.currentindex=e-1},A=function(e){if(e===g.fwd)if(o.eq(v.currentindex).next().length){v.nextindex=v.currentindex+1;v.nextslide=v.currentslide+1}else{v.nextindex=0;v.nextslide=1}else if(o.eq(v.currentindex).prev().length){v.nextindex=v.currentindex-1;v.nextslide=v.currentslide-1}else{v.nextindex=v.slidecount-1;v.nextslide=v.slidecount}},O=function(e,t){if(!v.animating){v.animating=!0;if(t){v.nextslide=t;v.nextindex=t-1}else A(e);if(r.animtype==="fade"){if(r.showmarkers){c.removeClass("active-marker");c.eq(v.nextindex).addClass("active-marker")}o.eq(v.currentindex).fadeOut(r.animduration);o.eq(v.nextindex).fadeIn(r.animduration,function(){v.animating=!1;v.currentslide=v.nextslide;v.currentindex=v.nextindex})}if(r.animtype==="slide"){if(r.showmarkers){var n=v.nextindex-1;n===v.slidecount-2?n=0:n===-1&&(n=v.slidecount-3);c.removeClass("active-marker");c.eq(n).addClass("active-marker")}r.responsive&&m.width<r.width?v.slidewidth=m.width:v.slidewidth=r.width;s.animate({left:-v.nextindex*v.slidewidth},r.animduration,function(){v.currentslide=v.nextslide;v.currentindex=v.nextindex;if(o.eq(v.currentindex).attr("data-clone")==="last"){s.css({left:-v.slidewidth});v.currentslide=2;v.currentindex=1}else if(o.eq(v.currentindex).attr("data-clone")==="first"){s.css({left:-v.slidewidth*(v.slidecount-2)});v.currentslide=v.slidecount-1;v.currentindex=v.slidecount-2}v.animating=!1})}}};y()}})(jQuery);
/* Simple Star Rating v1.0
 * This JavaScript is based on the Matt O'Neill | jSimple-Star-Rating
 * https://github.com/MattONeillUK/jSimple-Star-Rating
 */
(function(a){a.fn.simpleStarRating=function(g){return this.each(function(){var c=a(this),b=c.children("ul"),f=c.children("div"),d=b.children(),e=0;f.dialog({modal:!0,autoOpen:!1,buttons:{OK:function(){a(this).dialog("close")}}});d.on({click:function(){e=a(this).index()+1;d.removeClass("enabled active hover");a("li:lt("+e+")",b).addClass("active");a("label[for="+c.attr("id")+"]").remove();d.off();b.off();apex.server.plugin(g.ajaxIdentifier,{x01:e},{dataType:"text",success:function(a){isNaN(a)?alert(a): (f.dialog("open"),c.data({rating:e}).trigger("simpleStarRating.ajaxsuccess"))}})},mouseenter:function(){a("li:lt("+(a(this).index()+1)+")",b).addClass("hover").removeClass("active");a("li:gt("+a(this).index()+")",b).removeClass("hover active")},mouseleave:function(){a(this).parent().children("li:gt("+a(this).index()+")").removeClass("hover")}});b.on({mouseleave:function(){d.removeClass("hover");a("li:lt("+c.data("rating")+")",b).addClass("active")}})})}})(apex.jQuery);
