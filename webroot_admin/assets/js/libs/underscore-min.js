//     Underscore.js 1.4.2
//     http://underscorejs.org
//     (c) 2009-2012 Jeremy Ashkenas, DocumentCloud Inc.
//     Underscore may be freely distributed under the MIT license.
(function(){var a=this,b=a._,c={},d=Array.prototype,e=Object.prototype,f=Function.prototype,g=d.push,h=d.slice,i=d.concat,j=d.unshift,k=e.toString,l=e.hasOwnProperty,m=d.forEach,n=d.map,o=d.reduce,p=d.reduceRight,q=d.filter,r=d.every,s=d.some,t=d.indexOf,u=d.lastIndexOf,v=Array.isArray,w=Object.keys,x=f.bind,y=function(a){if(a instanceof y)return a;if(this instanceof y)this._wrapped=a;else return new y(a)};typeof exports!="undefined"?(typeof module!="undefined"&&module.exports&&(exports=module.exports=y),exports._=y):a._=y,y.VERSION="1.4.2";var z=y.each=y.forEach=function(a,b,d){if(a!=null)if(m&&a.forEach===m)a.forEach(b,d);else if(a.length===+a.length){for(var e=0,f=a.length;e<f;e++)if(b.call(d,a[e],e,a)===c)return}else for(var g in a)if(y.has(a,g)&&b.call(d,a[g],g,a)===c)return};y.map=y.collect=function(a,b,c){var d=[];if(a==null)return d;if(n&&a.map===n)return a.map(b,c);z(a,function(a,e,f){d[d.length]=b.call(c,a,e,f)});return d},y.reduce=y.foldl=y.inject=function(a,b,c,d){var e=arguments.length>2;a==null&&(a=[]);if(o&&a.reduce===o){d&&(b=y.bind(b,d));return e?a.reduce(b,c):a.reduce(b)}z(a,function(a,f,g){e?c=b.call(d,c,a,f,g):(c=a,e=!0)});if(!e)throw new TypeError("Reduce of empty array with no initial value");return c},y.reduceRight=y.foldr=function(a,b,c,d){var e=arguments.length>2;a==null&&(a=[]);if(p&&a.reduceRight===p){d&&(b=y.bind(b,d));return arguments.length>2?a.reduceRight(b,c):a.reduceRight(b)}var f=a.length;if(f!==+f){var g=y.keys(a);f=g.length}z(a,function(h,i,j){i=g?g[--f]:--f,e?c=b.call(d,c,a[i],i,j):(c=a[i],e=!0)});if(!e)throw new TypeError("Reduce of empty array with no initial value");return c},y.find=y.detect=function(a,b,c){var d;A(a,function(a,e,f){if(b.call(c,a,e,f)){d=a;return!0}});return d},y.filter=y.select=function(a,b,c){var d=[];if(a==null)return d;if(q&&a.filter===q)return a.filter(b,c);z(a,function(a,e,f){b.call(c,a,e,f)&&(d[d.length]=a)});return d},y.reject=function(a,b,c){return y.filter(a,function(a,d,e){return!b.call(c,a,d,e)},c)},y.every=y.all=function(a,b,d){b||(b=y.identity);var e=!0;if(a==null)return e;if(r&&a.every===r)return a.every(b,d);z(a,function(a,f,g){if(!(e=e&&b.call(d,a,f,g)))return c});return!!e};var A=y.some=y.any=function(a,b,d){b||(b=y.identity);var e=!1;if(a==null)return e;if(s&&a.some===s)return a.some(b,d);z(a,function(a,f,g){if(e||(e=b.call(d,a,f,g)))return c});return!!e};y.contains=y.include=function(a,b){var c=!1;if(a==null)return c;if(t&&a.indexOf===t)return a.indexOf(b)!=-1;c=A(a,function(a){return a===b});return c},y.invoke=function(a,b){var c=h.call(arguments,2);return y.map(a,function(a){return(y.isFunction(b)?b:a[b]).apply(a,c)})},y.pluck=function(a,b){return y.map(a,function(a){return a[b]})},y.where=function(a,b){return y.isEmpty(b)?[]:y.filter(a,function(a){for(var c in b)if(b[c]!==a[c])return!1;return!0})},y.max=function(a,b,c){if(!b&&y.isArray(a)&&a[0]===+a[0]&&a.length<65535)return Math.max.apply(Math,a);if(!b&&y.isEmpty(a))return-Infinity;var d={computed:-Infinity};z(a,function(a,e,f){var g=b?b.call(c,a,e,f):a;g>=d.computed&&(d={value:a,computed:g})});return d.value},y.min=function(a,b,c){if(!b&&y.isArray(a)&&a[0]===+a[0]&&a.length<65535)return Math.min.apply(Math,a);if(!b&&y.isEmpty(a))return Infinity;var d={computed:Infinity};z(a,function(a,e,f){var g=b?b.call(c,a,e,f):a;g<d.computed&&(d={value:a,computed:g})});return d.value},y.shuffle=function(a){var b,c=0,d=[];z(a,function(a){b=y.random(c++),d[c-1]=d[b],d[b]=a});return d};var B=function(a){return y.isFunction(a)?a:function(b){return b[a]}};y.sortBy=function(a,b,c){var d=B(b);return y.pluck(y.map(a,function(a,b,e){return{value:a,index:b,criteria:d.call(c,a,b,e)}}).sort(function(a,b){var c=a.criteria,d=b.criteria;if(c!==d){if(c>d||c===void 0)return 1;if(c<d||d===void 0)return-1}return a.index<b.index?-1:1}),"value")};var C=function(a,b,c,d){var e={},f=B(b);z(a,function(b,g){var h=f.call(c,b,g,a);d(e,h,b)});return e};y.groupBy=function(a,b,c){return C(a,b,c,function(a,b,c){(y.has(a,b)?a[b]:a[b]=[]).push(c)})},y.countBy=function(a,b,c){return C(a,b,c,function(a,b,c){y.has(a,b)||(a[b]=0),a[b]++})},y.sortedIndex=function(a,b,c,d){c=c==null?y.identity:B(c);var e=c.call(d,b),f=0,g=a.length;while(f<g){var h=f+g>>>1;c.call(d,a[h])<e?f=h+1:g=h}return f},y.toArray=function(a){return a?a.length===+a.length?h.call(a):y.values(a):[]},y.size=function(a){return a==null?0:a.length===+a.length?a.length:y.keys(a).length},y.first=y.head=y.take=function(a,b,c){return a==null?void 0:b!=null&&!c?h.call(a,0,b):a[0]},y.initial=function(a,b,c){return h.call(a,0,a.length-(b==null||c?1:b))},y.last=function(a,b,c){return a==null?void 0:b!=null&&!c?h.call(a,Math.max(a.length-b,0)):a[a.length-1]},y.rest=y.tail=y.drop=function(a,b,c){return h.call(a,b==null||c?1:b)},y.compact=function(a){return y.filter(a,function(a){return!!a})};var D=function(a,b,c){z(a,function(a){y.isArray(a)?b?g.apply(c,a):D(a,b,c):c.push(a)});return c};y.flatten=function(a,b){return D(a,b,[])},y.without=function(a){return y.difference(a,h.call(arguments,1))},y.uniq=y.unique=function(a,b,c,d){var e=c?y.map(a,c,d):a,f=[],g=[];z(e,function(c,d){if(b?!d||g[g.length-1]!==c:!y.contains(g,c))g.push(c),f.push(a[d])});return f},y.union=function(){return y.uniq(i.apply(d,arguments))},y.intersection=function(a){var b=h.call(arguments,1);return y.filter(y.uniq(a),function(a){return y.every(b,function(b){return y.indexOf(b,a)>=0})})},y.difference=function(a){var b=i.apply(d,h.call(arguments,1));return y.filter(a,function(a){return!y.contains(b,a)})},y.zip=function(){var a=h.call(arguments),b=y.max(y.pluck(a,"length")),c=Array(b);for(var d=0;d<b;d++)c[d]=y.pluck(a,""+d);return c},y.object=function(a,b){if(a==null)return{};var c={};for(var d=0,e=a.length;d<e;d++)b?c[a[d]]=b[d]:c[a[d][0]]=a[d][1];return c},y.indexOf=function(a,b,c){if(a==null)return-1;var d=0,e=a.length;if(c)if(typeof c=="number")d=c<0?Math.max(0,e+c):c;else{d=y.sortedIndex(a,b);return a[d]===b?d:-1}if(t&&a.indexOf===t)return a.indexOf(b,c);for(;d<e;d++)if(a[d]===b)return d;return-1},y.lastIndexOf=function(a,b,c){if(a==null)return-1;var d=c!=null;if(u&&a.lastIndexOf===u)return d?a.lastIndexOf(b,c):a.lastIndexOf(b);var e=d?c:a.length;while(e--)if(a[e]===b)return e;return-1},y.range=function(a,b,c){arguments.length<=1&&(b=a||0,a=0),c=arguments[2]||1;var d=Math.max(Math.ceil((b-a)/c),0),e=0,f=Array(d);while(e<d)f[e++]=a,a+=c;return f};var E=function(){};y.bind=function(a,b){var c,d;if(a.bind===x&&x)return x.apply(a,h.call(arguments,1));if(!y.isFunction(a))throw new TypeError;d=h.call(arguments,2);return c=function(){if(this instanceof c){E.prototype=a.prototype;var e=new E,f=a.apply(e,d.concat(h.call(arguments)));return Object(f)===f?f:e}return a.apply(b,d.concat(h.call(arguments)))}},y.bindAll=function(a){var b=h.call(arguments,1);b.length==0&&(b=y.functions(a)),z(b,function(b){a[b]=y.bind(a[b],a)});return a},y.memoize=function(a,b){var c={};b||(b=y.identity);return function(){var d=b.apply(this,arguments);return y.has(c,d)?c[d]:c[d]=a.apply(this,arguments)}},y.delay=function(a,b){var c=h.call(arguments,2);return setTimeout(function(){return a.apply(null,c)},b)},y.defer=function(a){return y.delay.apply(y,[a,1].concat(h.call(arguments,1)))},y.throttle=function(a,b){var c,d,e,f,g=0,h=function(){g=new Date,e=null,f=a.apply(c,d)};return function(){var i=new Date,j=b-(i-g);c=this,d=arguments,j<=0?(clearTimeout(e),g=i,f=a.apply(c,d)):e||(e=setTimeout(h,j));return f}},y.debounce=function(a,b,c){var d,e;return function(){var f=this,g=arguments,h=function(){d=null,c||(e=a.apply(f,g))},i=c&&!d;clearTimeout(d),d=setTimeout(h,b),i&&(e=a.apply(f,g));return e}},y.once=function(a){var b=!1,c;return function(){if(b)return c;b=!0,c=a.apply(this,arguments),a=null;return c}},y.wrap=function(a,b){return function(){var c=[a];g.apply(c,arguments);return b.apply(this,c)}},y.compose=function(){var a=arguments;return function(){var b=arguments;for(var c=a.length-1;c>=0;c--)b=[a[c].apply(this,b)];return b[0]}},y.after=function(a,b){return a<=0?b():function(){if(--a<1)return b.apply(this,arguments)}},y.keys=w||function(a){if(a!==Object(a))throw new TypeError("Invalid object");var b=[];for(var c in a)y.has(a,c)&&(b[b.length]=c);return b},y.values=function(a){var b=[];for(var c in a)y.has(a,c)&&b.push(a[c]);return b},y.pairs=function(a){var b=[];for(var c in a)y.has(a,c)&&b.push([c,a[c]]);return b},y.invert=function(a){var b={};for(var c in a)y.has(a,c)&&(b[a[c]]=c);return b},y.functions=y.methods=function(a){var b=[];for(var c in a)y.isFunction(a[c])&&b.push(c);return b.sort()},y.extend=function(a){z(h.call(arguments,1),function(b){for(var c in b)a[c]=b[c]});return a},y.pick=function(a){var b={},c=i.apply(d,h.call(arguments,1));z(c,function(c){c in a&&(b[c]=a[c])});return b},y.omit=function(a){var b={},c=i.apply(d,h.call(arguments,1));for(var e in a)y.contains(c,e)||(b[e]=a[e]);return b},y.defaults=function(a){z(h.call(arguments,1),function(b){for(var c in b)a[c]==null&&(a[c]=b[c])});return a},y.clone=function(a){return y.isObject(a)?y.isArray(a)?a.slice():y.extend({},a):a},y.tap=function(a,b){b(a);return a};var F=function(a,b,c,d){if(a===b)return a!==0||1/a==1/b;if(a==null||b==null)return a===b;a instanceof y&&(a=a._wrapped),b instanceof y&&(b=b._wrapped);var e=k.call(a);if(e!=k.call(b))return!1;switch(e){case"[object String]":return a==String(b);case"[object Number]":return a!=+a?b!=+b:a==0?1/a==1/b:a==+b;case"[object Date]":case"[object Boolean]":return+a==+b;case"[object RegExp]":return a.source==b.source&&a.global==b.global&&a.multiline==b.multiline&&a.ignoreCase==b.ignoreCase}if(typeof a!="object"||typeof b!="object")return!1;var f=c.length;while(f--)if(c[f]==a)return d[f]==b;c.push(a),d.push(b);var g=0,h=!0;if(e=="[object Array]"){g=a.length,h=g==b.length;if(h)while(g--)if(!(h=F(a[g],b[g],c,d)))break}else{var i=a.constructor,j=b.constructor;if(i!==j&&!(y.isFunction(i)&&i instanceof i&&y.isFunction(j)&&j instanceof j))return!1;for(var l in a)if(y.has(a,l)){g++;if(!(h=y.has(b,l)&&F(a[l],b[l],c,d)))break}if(h){for(l in b)if(y.has(b,l)&&!(g--))break;h=!g}}c.pop(),d.pop();return h};y.isEqual=function(a,b){return F(a,b,[],[])},y.isEmpty=function(a){if(a==null)return!0;if(y.isArray(a)||y.isString(a))return a.length===0;for(var b in a)if(y.has(a,b))return!1;return!0},y.isElement=function(a){return!!a&&a.nodeType===1},y.isArray=v||function(a){return k.call(a)=="[object Array]"},y.isObject=function(a){return a===Object(a)},z(["Arguments","Function","String","Number","Date","RegExp"],function(a){y["is"+a]=function(b){return k.call(b)=="[object "+a+"]"}}),y.isArguments(arguments)||(y.isArguments=function(a){return!!a&&!!y.has(a,"callee")}),typeof /./!="function"&&(y.isFunction=function(a){return typeof a=="function"}),y.isFinite=function(a){return isFinite(a)&&!isNaN(parseFloat(a))},y.isNaN=function(a){return y.isNumber(a)&&a!=+a},y.isBoolean=function(a){return a===!0||a===!1||k.call(a)=="[object Boolean]"},y.isNull=function(a){return a===null},y.isUndefined=function(a){return a===void 0},y.has=function(a,b){return l.call(a,b)},y.noConflict=function(){a._=b;return this},y.identity=function(a){return a},y.times=function(a,b,c){for(var d=0;d<a;d++)b.call(c,d)},y.random=function(a,b){b==null&&(b=a,a=0);return a+(0|Math.random()*(b-a+1))};var G={escape:{"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#x27;","/":"&#x2F;"}};G.unescape=y.invert(G.escape);var H={escape:new RegExp("["+y.keys(G.escape).join("")+"]","g"),unescape:new RegExp("("+y.keys(G.unescape).join("|")+")","g")};y.each(["escape","unescape"],function(a){y[a]=function(b){return b==null?"":(""+b).replace(H[a],function(b){return G[a][b]})}}),y.result=function(a,b){if(a==null)return null;var c=a[b];return y.isFunction(c)?c.call(a):c},y.mixin=function(a){z(y.functions(a),function(b){var c=y[b]=a[b];y.prototype[b]=function(){var a=[this._wrapped];g.apply(a,arguments);return M.call(this,c.apply(y,a))}})};var I=0;y.uniqueId=function(a){var b=I++;return a?a+b:b},y.templateSettings={evaluate:/<%([\s\S]+?)%>/g,interpolate:/<%=([\s\S]+?)%>/g,escape:/<%-([\s\S]+?)%>/g};var J=/(.)^/,K={"'":"'","\\":"\\","\r":"r","\n":"n","\t":"t","\u2028":"u2028","\u2029":"u2029"},L=/\\|'|\r|\n|\t|\u2028|\u2029/g;y.template=function(a,b,c){c=y.defaults({},c,y.templateSettings);var d=new RegExp([(c.escape||J).source,(c.interpolate||J).source,(c.evaluate||J).source].join("|")+"|$","g"),e=0,f="__p+='";a.replace(d,function(b,c,d,g,h){f+=a.slice(e,h).replace(L,function(a){return"\\"+K[a]}),f+=c?"'+\n((__t=("+c+"))==null?'':_.escape(__t))+\n'":d?"'+\n((__t=("+d+"))==null?'':__t)+\n'":g?"';\n"+g+"\n__p+='":"",e=h+b.length}),f+="';\n",c.variable||(f="with(obj||{}){\n"+f+"}\n"),f="var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};\n"+f+"return __p;\n";try{var g=new Function(c.variable||"obj","_",f)}catch(h){h.source=f;throw h}if(b)return g(b,y);var i=function(a){return g.call(this,a,y)};i.source="function("+(c.variable||"obj")+"){\n"+f+"}";return i},y.chain=function(a){return y(a).chain()};var M=function(a){return this._chain?y(a).chain():a};y.mixin(y),z(["pop","push","reverse","shift","sort","splice","unshift"],function(a){var b=d[a];y.prototype[a]=function(){var c=this._wrapped;b.apply(c,arguments),(a=="shift"||a=="splice")&&c.length===0&&delete c[0];return M.call(this,c)}}),z(["concat","join","slice"],function(a){var b=d[a];y.prototype[a]=function(){return M.call(this,b.apply(this._wrapped,arguments))}}),y.extend(y.prototype,{chain:function(){this._chain=!0;return this},value:function(){return this._wrapped}})}).call(this)//  Underscore.string
//  (c) 2010 Esa-Matti Suuronen <esa-matti aet suuronen dot org>
//  Underscore.string is freely distributable under the terms of the MIT license.
//  Documentation: https://github.com/epeli/underscore.string
//  Some code is borrowed from MooTools and Alexandru Marasteanu.
//  Version '2.3.0'
!function(a,b){"use strict";var c=b.prototype.trim,d=b.prototype.trimRight,e=b.prototype.trimLeft,f=function(a){return a*1||0},g=function(a,b){if(b<1)return"";var c="";while(b>0)b&1&&(c+=a),b>>=1,a+=a;return c},h=[].slice,i=function(a){return a==null?"\\s":a.source?a.source:"["+n.escapeRegExp(a)+"]"},j={lt:"<",gt:">",quot:'"',apos:"'",amp:"&"},k={};for(var l in j)k[j[l]]=l;var m=function(){function a(a){return Object.prototype.toString.call(a).slice(8,-1).toLowerCase()}var c=g,d=function(){d.cache.hasOwnProperty(arguments[0])||(d.cache[arguments[0]]=d.parse(arguments[0]));return d.format.call(null,d.cache[arguments[0]],arguments)};d.format=function(d,e){var f=1,g=d.length,h="",i,j=[],k,l,n,o,p,q;for(k=0;k<g;k++){h=a(d[k]);if(h==="string")j.push(d[k]);else if(h==="array"){n=d[k];if(n[2]){i=e[f];for(l=0;l<n[2].length;l++){if(!i.hasOwnProperty(n[2][l]))throw new Error(m('[_.sprintf] property "%s" does not exist',n[2][l]));i=i[n[2][l]]}}else n[1]?i=e[n[1]]:i=e[f++];if(/[^s]/.test(n[8])&&a(i)!="number")throw new Error(m("[_.sprintf] expecting number but found %s",a(i)));switch(n[8]){case"b":i=i.toString(2);break;case"c":i=b.fromCharCode(i);break;case"d":i=parseInt(i,10);break;case"e":i=n[7]?i.toExponential(n[7]):i.toExponential();break;case"f":i=n[7]?parseFloat(i).toFixed(n[7]):parseFloat(i);break;case"o":i=i.toString(8);break;case"s":i=(i=b(i))&&n[7]?i.substring(0,n[7]):i;break;case"u":i=Math.abs(i);break;case"x":i=i.toString(16);break;case"X":i=i.toString(16).toUpperCase()}i=/[def]/.test(n[8])&&n[3]&&i>=0?"+"+i:i,p=n[4]?n[4]=="0"?"0":n[4].charAt(1):" ",q=n[6]-b(i).length,o=n[6]?c(p,q):"",j.push(n[5]?i+o:o+i)}}return j.join("")},d.cache={},d.parse=function(a){var b=a,c=[],d=[],e=0;while(b){if((c=/^[^\x25]+/.exec(b))!==null)d.push(c[0]);else if((c=/^\x25{2}/.exec(b))!==null)d.push("%");else{if((c=/^\x25(?:([1-9]\d*)\$|\(([^\)]+)\))?(\+)?(0|'[^$])?(-)?(\d+)?(?:\.(\d+))?([b-fosuxX])/.exec(b))===null)throw new Error("[_.sprintf] huh?");if(c[2]){e|=1;var f=[],g=c[2],h=[];if((h=/^([a-z_][a-z_\d]*)/i.exec(g))===null)throw new Error("[_.sprintf] huh?");f.push(h[1]);while((g=g.substring(h[0].length))!=="")if((h=/^\.([a-z_][a-z_\d]*)/i.exec(g))!==null)f.push(h[1]);else if((h=/^\[(\d+)\]/.exec(g))!==null)f.push(h[1]);else throw new Error("[_.sprintf] huh?");c[2]=f}else e|=2;if(e===3)throw new Error("[_.sprintf] mixing positional and named placeholders is not (yet) supported");d.push(c)}b=b.substring(c[0].length)}return d};return d}(),n={VERSION:"2.3.0",isBlank:function(a){a==null&&(a="");return/^\s*$/.test(a)},stripTags:function(a){return a==null?"":b(a).replace(/<\/?[^>]+>/g,"")},capitalize:function(a){a=a==null?"":b(a);return a.charAt(0).toUpperCase()+a.slice(1)},chop:function(a,c){if(a==null)return[];a=b(a),c=~~c;return c>0?a.match(new RegExp(".{1,"+c+"}","g")):[a]},clean:function(a){return n.strip(a).replace(/\s+/g," ")},count:function(a,c){if(a==null||c==null)return 0;a=b(a),c=b(c);var d=0,e=0,f=c.length;for(;;){e=a.indexOf(c,e);if(e===-1)break;d++,e+=f}return d},chars:function(a){return a==null?[]:b(a).split("")},swapCase:function(a){return a==null?"":b(a).replace(/\S/g,function(a){return a===a.toUpperCase()?a.toLowerCase():a.toUpperCase()})},escapeHTML:function(a){return a==null?"":b(a).replace(/[&<>"']/g,function(a){return"&"+k[a]+";"})},unescapeHTML:function(a){return a==null?"":b(a).replace(/\&([^;]+);/g,function(a,c){var d;return c in j?j[c]:(d=c.match(/^#x([\da-fA-F]+)$/))?b.fromCharCode(parseInt(d[1],16)):(d=c.match(/^#(\d+)$/))?b.fromCharCode(~~d[1]):a})},escapeRegExp:function(a){return a==null?"":b(a).replace(/([.*+?^=!:${}()|[\]\/\\])/g,"\\$1")},splice:function(a,b,c,d){var e=n.chars(a);e.splice(~~b,~~c,d);return e.join("")},insert:function(a,b,c){return n.splice(a,b,0,c)},include:function(a,c){return c===""?!0:a==null?!1:b(a).indexOf(c)!==-1},join:function(){var a=h.call(arguments),b=a.shift();b==null&&(b="");return a.join(b)},lines:function(a){return a==null?[]:b(a).split("\n")},reverse:function(a){return n.chars(a).reverse().join("")},startsWith:function(a,c){if(c==="")return!0;if(a==null||c==null)return!1;a=b(a),c=b(c);return a.length>=c.length&&a.slice(0,c.length)===c},endsWith:function(a,c){if(c==="")return!0;if(a==null||c==null)return!1;a=b(a),c=b(c);return a.length>=c.length&&a.slice(a.length-c.length)===c},succ:function(a){if(a==null)return"";a=b(a);return a.slice(0,-1)+b.fromCharCode(a.charCodeAt(a.length-1)+1)},titleize:function(a){return a==null?"":b(a).replace(/(?:^|\s)\S/g,function(a){return a.toUpperCase()})},camelize:function(a){return n.trim(a).replace(/[-_\s]+(.)?/g,function(a,b){return b.toUpperCase()})},underscored:function(a){return n.trim(a).replace(/([a-z\d])([A-Z]+)/g,"$1_$2").replace(/[-\s]+/g,"_").toLowerCase()},dasherize:function(a){return n.trim(a).replace(/([A-Z])/g,"-$1").replace(/[-_\s]+/g,"-").toLowerCase()},classify:function(a){return n.titleize(b(a).replace(/_/g," ")).replace(/\s/g,"")},humanize:function(a){return n.capitalize(n.underscored(a).replace(/_id$/,"").replace(/_/g," "))},trim:function(a,d){if(a==null)return"";if(!d&&c)return c.call(a);d=i(d);return b(a).replace(new RegExp("^"+d+"+|"+d+"+$","g"),"")},ltrim:function(a,c){if(a==null)return"";if(!c&&e)return e.call(a);c=i(c);return b(a).replace(new RegExp("^"+c+"+"),"")},rtrim:function(a,c){if(a==null)return"";if(!c&&d)return d.call(a);c=i(c);return b(a).replace(new RegExp(c+"+$"),"")},truncate:function(a,c,d){if(a==null)return"";a=b(a),d=d||"...",c=~~c;return a.length>c?a.slice(0,c)+d:a},prune:function(a,c,d){if(a==null)return"";a=b(a),c=~~c,d=d!=null?b(d):"...";if(a.length<=c)return a;var e=function(a){return a.toUpperCase()!==a.toLowerCase()?"A":" "},f=a.slice(0,c+1).replace(/.(?=\W*\w*$)/g,e);f.slice(f.length-2).match(/\w\w/)?f=f.replace(/\s*\S+$/,""):f=n.rtrim(f.slice(0,f.length-1));return(f+d).length>a.length?a:a.slice(0,f.length)+d},words:function(a,b){return n.isBlank(a)?[]:n.trim(a,b).split(b||/\s+/)},pad:function(a,c,d,e){a=a==null?"":b(a),c=~~c;var f=0;d?d.length>1&&(d=d.charAt(0)):d=" ";switch(e){case"right":f=c-a.length;return a+g(d,f);case"both":f=c-a.length;return g(d,Math.ceil(f/2))+a+g(d,Math.floor(f/2));default:f=c-a.length;return g(d,f)+a}},lpad:function(a,b,c){return n.pad(a,b,c)},rpad:function(a,b,c){return n.pad(a,b,c,"right")},lrpad:function(a,b,c){return n.pad(a,b,c,"both")},sprintf:m,vsprintf:function(a,b){b.unshift(a);return m.apply(null,b)},toNumber:function(a,c){if(a==null||a=="")return 0;a=b(a);var d=f(f(a).toFixed(~~c));return d===0&&!a.match(/^0+$/)?Number.NaN:d},numberFormat:function(a,b,c,d){if(isNaN(a)||a==null)return"";a=a.toFixed(~~b),d=d||",";var e=a.split("."),f=e[0],g=e[1]?(c||".")+e[1]:"";return f.replace(/(\d)(?=(?:\d{3})+$)/g,"$1"+d)+g},strRight:function(a,c){if(a==null)return"";a=b(a),c=c!=null?b(c):c;var d=c?a.indexOf(c):-1;return~d?a.slice(d+c.length,a.length):a},strRightBack:function(a,c){if(a==null)return"";a=b(a),c=c!=null?b(c):c;var d=c?a.lastIndexOf(c):-1;return~d?a.slice(d+c.length,a.length):a},strLeft:function(a,c){if(a==null)return"";a=b(a),c=c!=null?b(c):c;var d=c?a.indexOf(c):-1;return~d?a.slice(0,d):a},strLeftBack:function(a,b){if(a==null)return"";a+="",b=b!=null?""+b:b;var c=a.lastIndexOf(b);return~c?a.slice(0,c):a},toSentence:function(a,b,c,d){b=b||", ",c=c||" and ";var e=a.slice(),f=e.pop();a.length>2&&d&&(c=n.rtrim(b)+c);return e.length?e.join(b)+c+f:f},toSentenceSerial:function(){var a=h.call(arguments);a[3]=!0;return n.toSentence.apply(n,a)},slugify:function(a){if(a==null)return"";var c="ąàáäâãåæćęèéëêìíïîłńòóöôõøùúüûñçżź",d="aaaaaaaaceeeeeiiiilnoooooouuuunczz",e=new RegExp(i(c),"g");a=b(a).toLowerCase().replace(e,function(a){var b=c.indexOf(a);return d.charAt(b)||"-"});return n.dasherize(a.replace(/[^\w\s-]/g,""))},surround:function(a,b){return[b,a,b].join("")},quote:function(a){return n.surround(a,'"')},exports:function(){var a={};for(var b in this){if(!this.hasOwnProperty(b)||b.match(/^(?:include|contains|reverse)$/))continue;a[b]=this[b]}return a},repeat:function(a,c,d){if(a==null)return"";c=~~c;if(d==null)return g(b(a),c);for(var e=[];c>0;e[--c]=a);return e.join(d)},levenshtein:function(a,c){if(a==null&&c==null)return 0;if(a==null)return b(c).length;if(c==null)return b(a).length;a=b(a),c=b(c);var d=[],e,f;for(var g=0;g<=c.length;g++)for(var h=0;h<=a.length;h++)g&&h?a.charAt(h-1)===c.charAt(g-1)?f=e:f=Math.min(d[h],d[h-1],e)+1:f=g+h,e=d[h],d[h]=f;return d.pop()}};n.strip=n.trim,n.lstrip=n.ltrim,n.rstrip=n.rtrim,n.center=n.lrpad,n.rjust=n.lpad,n.ljust=n.rpad,n.contains=n.include,n.q=n.quote,typeof exports!="undefined"&&(typeof module!="undefined"&&module.exports&&(module.exports=n),exports._s=n),typeof define=="function"&&define.amd&&define("underscore.string",[],function(){return n}),a._=a._||{},a._.string=a._.str=n}(this,String)

_.mixin(_.str.exports());