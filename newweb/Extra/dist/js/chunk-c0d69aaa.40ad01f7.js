(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-c0d69aaa"],{"02cc":function(e,t,n){"use strict";n.d(t,"a",(function(){return i}));var o=n("bc3a"),a=n.n(o);function i(e){return new Promise((t,n)=>{const o=a.a.create({timeout:5e3});o.interceptors.request.use(e=>e,e=>e),o.interceptors.response.use(e=>e,e=>e),o(e).then(e=>{t(e)}).catch(e=>{n(e)})})}},"2b27":function(e,t,n){(function(){var t={expires:"1d",path:"; path=/",domain:"",secure:"",sameSite:""},n={install:function(e){e.prototype.$cookies=this,e.$cookies=this},config:function(e,n,o,a,i){t.expires=e||"1d",t.path=n?"; path="+n:"; path=/",t.domain=o?"; domain="+o:"",t.secure=a?"; Secure":"",t.sameSite=i?"; SameSite="+i:""},get:function(e){var t=decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*"+encodeURIComponent(e).replace(/[\-\.\+\*]/g,"\\$&")+"\\s*\\=\\s*([^;]*).*$)|^.*$"),"$1"))||null;if(t&&"{"===t.substring(0,1)&&"}"===t.substring(t.length-1,t.length))try{t=JSON.parse(t)}catch(n){return t}return t},set:function(e,n,o,a,i,r,s){if(!e)throw new Error("Cookie name is not find in first argument.");if(/^(?:expires|max\-age|path|domain|secure|SameSite)$/i.test(e))throw new Error("Cookie key name illegality, Cannot be set to ['expires','max-age','path','domain','secure','SameSite']\t current key name: "+e);n&&n.constructor===Object&&(n=JSON.stringify(n));var c="";if(o=void 0===o?t.expires:o,o&&0!=o)switch(o.constructor){case Number:c=o===1/0||-1===o?"; expires=Fri, 31 Dec 9999 23:59:59 GMT":"; max-age="+o;break;case String:if(/^(?:\d{1,}(y|m|d|h|min|s))$/i.test(o)){var u=o.replace(/^(\d{1,})(?:y|m|d|h|min|s)$/i,"$1");switch(o.replace(/^(?:\d{1,})(y|m|d|h|min|s)$/i,"$1").toLowerCase()){case"m":c="; max-age="+2592e3*+u;break;case"d":c="; max-age="+86400*+u;break;case"h":c="; max-age="+3600*+u;break;case"min":c="; max-age="+60*+u;break;case"s":c="; max-age="+u;break;case"y":c="; max-age="+31104e3*+u;break;default:new Error("unknown exception of 'set operation'")}}else c="; expires="+o;break;case Date:c="; expires="+o.toUTCString();break}return document.cookie=encodeURIComponent(e)+"="+encodeURIComponent(n)+c+(i?"; domain="+i:t.domain)+(a?"; path="+a:t.path)+(void 0===r?t.secure:r?"; Secure":"")+(void 0===s?t.sameSite:s?"; SameSite="+s:""),this},remove:function(e,n,o){return!(!e||!this.isKey(e))&&(document.cookie=encodeURIComponent(e)+"=; expires=Thu, 01 Jan 1970 00:00:00 GMT"+(o?"; domain="+o:t.domain)+(n?"; path="+n:t.path),this)},isKey:function(e){return new RegExp("(?:^|;\\s*)"+encodeURIComponent(e).replace(/[\-\.\+\*]/g,"\\$&")+"\\s*\\=").test(document.cookie)},keys:function(){if(!document.cookie)return[];for(var e=document.cookie.replace(/((?:^|\s*;)[^\=]+)(?=;|$)|^\s*|\s*(?:\=[^;]*)?(?:\1|$)/g,"").split(/\s*(?:\=[^;]*)?;\s*/),t=0;t<e.length;t++)e[t]=decodeURIComponent(e[t]);return e}};e.exports=n,"undefined"!==typeof window&&(window.$cookies=n)})()},5451:function(e,t,n){"use strict";var o=n("d523"),a=n.n(o);a.a},"7f78":function(e,t,n){"use strict";n.d(t,"a",(function(){return r}));var o=n("2b0e"),a=n("2b27"),i=n.n(a);function r(e){let t=$cookies.isKey(e);t||window.location.replace("")}o["a"].use(i.a)},d523:function(e,t,n){},fabf:function(e,t,n){"use strict";n.r(t);var o=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"main-page"},[e._v(" "+e._s(e.intro)+" ")])},a=[],i=n("02cc");function r(){return Object(i["a"])({url:"/Extra/results/view/php/getAllintro.php"})}var s=n("7f78"),c={name:"MainPage",data(){return{intro:{}}},created(){Object(s["a"])("unameid"),console.log("create"),console.log("showTabBar",this.$store.state.showTabBar),this.getData()},methods:{getData(){console.log(""),r().then(e=>{this.intro=e,console.log(e)})}}},u=c,m=(n("5451"),n("2877")),d=Object(m["a"])(u,o,a,!1,null,"c9a2dde8",null);t["default"]=d.exports}}]);
//# sourceMappingURL=chunk-c0d69aaa.40ad01f7.js.map