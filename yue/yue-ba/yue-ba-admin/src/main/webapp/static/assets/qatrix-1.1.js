(function(p, h, l) {
	var r = h.documentElement,
		y = /(^\n+)|(\n+$)/g,
		H = /^(?:\{.*\}|\[.*\])$/,
		I = /-([a-z])/ig,
		J = /\r\n/g,
		K = /[\-\+0-9\.]/ig,
		w = /\s+/,
		L = /\?/,
		M = /opacity=([^)]*)/,
		N = /^[\],:{}\s]*$/,
		O = /\\(?:["\\\/bfnrt]|u[\da-fA-F]{4})/g,
		P = /"[^"\\\r\n]*"|true|false|null|-?(?:\d\d*\.|)\d+(?:[eE][\-+]?\d+|)/g,
		Q = /(?:^|:|,)(?:\s*\[)+/g,
		z = ["height", "margin-top", "margin-bottom", "padding-top", "padding-bottom"],
		A = {},
		B = {},
		C = [],
		D = function() {
			$each(C, function(a, b) {
				b()
			});
			h.removeEventListener("DOMContentLoaded", D, !1)
		},
		v = function(a, b) {
			var c = typeof b;
			if("string" === c) {
				var d = (a && a.ownerDocument || h).createDocumentFragment(),
					f = $new("div");
				for(f.innerHTML = b; null != f.childNodes[0];) d.appendChild(f.childNodes[0]);
				b = d
			}
			"number" === c && (b += "");
			return b
		},
		e = function(a, b) {
			if(null !== a) {
				if(b === l) return a;
				var c = 0,
					d = a.length;
				if(d !== l && 0 < d) {
					for(; c < d && !1 !== b.call(a[c], a[c], a[c++]););
					return a
				}
				return b.call(a, a)
			}
		},
		E = function(a, b, c, d) {
			return e(a, function(a) {
				var s = {},
					g = "show" === b,
					e = a.style,
					t = a._display,
					u;
				if(!t) {
					t = $style.get(a, "display");
					if("none" === t || "inherit" === t) u = $append(h.body, $new(a.nodeName)), t = $style.get(u, "display"), $remove(u);
					a._display = t
				}
				g ? e.display = t : t = "none";
				c ? ($style.get(a, "overflow"), e.overflow = "hidden", s.opacity = g ? {
					from: 0,
					to: 1
				} : {
					from: 1,
					to: 0
				}, $each(z, function(c, b) {
					s[b] = g ? {
						from: 0,
						to: $style.get(a, b)
					} : 0
				}), $animate(a, s, c, function() {
					$each(z, function(c, b) {
						$css.set(a, b, "")
					});
					e.filter = e.opacity = e.overflow = "";
					e.display = t;
					d && d.call(a)
				})) : e.display = t
			})
		},
		F = function(a, b) {
			if("object" === typeof b) {
				var c = [];
				$each(b, function(b, f) {
					"object" === typeof f ? c.push(F(a + "[" + b + "]", f)) : c.push(a + "[" + $url(b) + "]=" + $url(f))
				});
				return c.join("&")
			}
			return $url(a) + "=" + $url(b)
		},
		G = h.removeEventListener ? function(a, b, c) {
			a.removeEventListener(b, c, !1)
		} : function(a, b, c) {
			a.detachEvent("on" + b, c)
		},
		n = {
			$: function(a) {
				return h.getElementById(a)
			},
			$each: function(a, b) {
				var c = 0,
					d = a.length,
					f = "object" === typeof a,
					s;
				if(f && d - 1 in a)
					for(; c < d && !1 !== b.call(a[c], c, a[c++]););
				else if(f)
					for(s in a) b.call(a[s], s, a[s]);
				else b.call(a, 0, a);
				return a
			},
			$id: function(a, b) {
				var c = [],
					d;
				$each(a instanceof Array ? a : a.split(" "), function(a, b) {
					d = $(b);
					null !== d && c.push(d)
				});
				return b ? e(c, b) : c
			},
			$dom: function(a, b) {
				b && (a.length ? e(a, b) : b(a));
				return a
			},
			$tag: function(a, b, c) {
				var d = [];
				a = a.getElementsByTagName(b);
				b = a.length;
				var f = 0;
				if(0 < b) {
					for(; f < b; f++) d.push(a[f]);
					return e(d, c)
				}
				return d
			},
			$class: h.getElementsByClassName ? function(a, b, c) {
				var d = [];
				a = a.getElementsByClassName(b);
				b = a.length;
				var f = 0;
				if(0 < b) {
					for(; f < b; f++) d.push(a[f]);
					return e(d, c)
				}
				return d
			} : function(a, b, c) {
				var d = [],
					f = RegExp("(^|\\s)" + b + "(\\s|$)");
				$tag(a, "*", function(a) {
					f.test(a.className) && d.push(a)
				});
				return e(d, c)
			},
			$select: h.querySelectorAll ? function(a, b) {
				return e(h.querySelectorAll(a), b)
			} : function(a, b) {
				var c = n.Qselector.styleSheet,
					d = [];
				c.addRule(a, "q:a");
				$tag(h, "*", function(a) {
					"a" === a.currentStyle.q && d.push(a)
				});
				c.cssText = "";
				return e(d, b)
			},
			$new: function(a, b) {
				var c = h.createElement(a);
				if(b) try {
					return $each(b, function(a, b) {
						switch(a) {
							case "css":
							case "style":
								$css.set(c, b);
								break;
							case "innerHTML":
							case "html":
								$html(c, b);
								break;
							case "className":
							case "class":
								$className.set(c, b);
								break;
							case "text":
								$text(c, b);
								break;
							default:
								$attr.set(c, a, b)
						}
					}), c
				} catch(d) {} finally {
					c = null
				}
				return c
			},
			$string: {
				camelCase: function(a) {
					return a.replace("-ms-", "ms-").replace(I, function(a, c) {
						return(c + "").toUpperCase()
					})
				},
				replace: function(a, b) {
					for(var c in b) a = a.replace(RegExp(c, "ig"), b[c]);
					return a
				},
				slashes: function(a) {
					return $string.replace(a, {
						"\\\\": "\\\\",
						"\b": "\\b",
						"\t": "\\t",
						"\n": "\\n",
						"\r": "\\r",
						'"': '\\"'
					})
				},
				trim: "".trim ? function(a) {
					return a.trim()
				} : function(a) {
					return(a + "").replace(/^\s\s*/, "").replace(/\s\s*$/, "")
				}
			},
			$attr: {
				get: function(a, b) {
					return a.getAttribute(b)
				},
				set: function(a, b, c) {
					return e(a, function(a) {
						a.setAttribute(b, c)
					})
				},
				remove: function(a, b) {
					return e(a, function(a) {
						a.removeAttribute(b)
					})
				}
			},
			$data: {
				get: function(a, b) {
					var c = $attr.get(a, "data-" + b);
					return "true" === c ? !0 : "false" === c ? !1 : "null" === c ? "" : null === c ? "" : "" === c ? "" : !isNaN(parseFloat(c)) && isFinite(c) ? +c : H.test(c) ? $json.decode(c) : c
				},
				set: function(a, b, c) {
					return e(a, function(a) {
						c = "object" === typeof c ? $json.encode(c) : c;
						"object" === typeof b ? $each(b, function(b, c) {
							$attr.set(a, "data-" + b, c)
						}) : $attr.set(a, "data-" + b, c);
						return a
					})
				},
				remove: function(a, b) {
					return e(a, function(a) {
						$attr.remove(a, "data-" + b)
					})
				}
			},
			$storage: p.localStorage ? {
				set: function(a, b) {
					localStorage[a] = "object" === typeof b ? $json.encode(b) : b
				},
				get: function(a) {
					a = localStorage[a];
					return $json.isJSON(a) ? $json.decode(a) : a || ""
				},
				remove: function(a) {
					localStorage.removeItem(a);
					return !0
				}
			} : {
				set: function(a, b) {
					b = "object" === typeof b ? $json.encode(b) : b;
					$data.set(n.storage, a, b);
					n.storage.save("Qstorage")
				},
				get: function(a) {
					n.storage.load("Qstorage");
					return $data.get(n.storage, a) || ""
				},
				remove: function(a) {
					n.storage.load("Qstorage");
					$data.remove(n.storage, a);
					return !0
				}
			},
			$event: {
				guid: 0,
				global: {},
				handler: {
					call: function(a, b, c, d) {
						var f = $event.handler;
						c.currentTarget = b;
						if(!1 === d || !1 === d.call(b, c)) f.stopPropagation.call(c), f.preventDefault.call(c), a.isStopPropagation = !0;
						return a
					},
					preventDefault: function() {
						var a = this.originalEvent;
						a.preventDefault && a.preventDefault()
					},
					stopPropagation: function() {
						var a = this.originalEvent;
						a.stopPropagation && a.stopPropagation()
					},
					stopImmediatePropagation: function() {
						this.stopPropagation()
					},
					mouseenter: function(a) {
						return function(b) {
							var c = b.relatedTarget;
							if(this !== c) {
								for(; c && c !== this;) c = c.parentNode;
								c !== this && a.call(this, b)
							}
						}
					}
				},
				on: function(a, b, c, d, f) {
					return e(a, function(a) {
						if(3 === a.nodeType || 8 === a.nodeType) return !1;
						if("object" === typeof b) {
							"string" !== typeof c && (d = d || c, c = l);
							for(type in b) $event.on(a, type, c, d, b[type]);
							return this
						}
						null == d && null == f ? (f = c, d = c = l) : null == f && ("string" === typeof c ? (f = d, d = l) : (f = d, d = c, c = l));
						a.guid === l && ($event.guid++, a.guid = $event.guid, $event.global[$event.guid] = {});
						var g = a.guid,
							e = (c || "") + b;
						$event.global[g][e] || ($event.global[g][e] = {});
						delegate_fn = function(b) {
							var g = {},
								e, m;
							$each("altKey bubbles button buttons cancelable relatedTarget clientX clientY ctrlKey fromElement offsetX offsetY pageX pageY screenX screenY shiftKey toElement timeStamp".split(" "), function(a, c) {
								b[c] !== l && (g[c] = b[c])
							});
							g.originalEvent = b;
							g.preventDefault = $event.handler.preventDefault;
							g.stopPropagation = $event.handler.stopPropagation;
							g.stopImmediatePropagation = $event.handler.stopImmediatePropagation;
							g.delegateTarget = a;
							g.isStopPropagation = !1;
							g.data = d;
							m = g.target = c ? b.target || b.srcElement || h : a;
							g.which = b.which || b.charCode || b.keyCode;
							g.metaKey = b.metaKey || b.ctrlKey;
							if(c)
								for(e = c ? c.replace(".", "") : ""; m !== a; m = m.parentNode) {
									if(!0 === b.isStopPropagation || null === m || m === h.body) return !1;
									if(m.tagName.toLowerCase() === c || $className.has(m, e)) b = $event.handler.call(b, m, g, f)
								} else $event.handler.call(b, m, g, f)
						};
						if(a.addEventListener) {
							if("mouseenter" === b || "mouseleave" === b) b = "mouseenter" === b ? "mouseover" : "mouseout", delegate_fn = $event.handler.mouseenter(delegate_fn);
							a.addEventListener(b, delegate_fn, "blur" === b || "focus" === b)
						} else a.attachEvent("on" + b, delegate_fn);
						$event.global[g][e][f + ""] = delegate_fn;
						return a
					})
				},
				off: function(a, b, c, d) {
					if("object" === typeof b) {
						for(type in b) $event.off(a, type, b[type]);
						return this
					}
					null == d && (d = c, c = null);
					var f = a.guid;
					c = (c || "") + b;
					fn_key = d + "";
					d ? (G(a, b, $event.global[f][c][fn_key]), delete $event.global[f][c][fn_key]) : ($each($event.global[f][c], function(c, d) {
						G(a, b, d)
					}), delete $event.global[f][c])
				}
			},
			$clear: function(a) {
				a && (clearTimeout(a), clearInterval(a));
				return null
			},
			$ready: function(a) {
				if("complete" === h.readyState) return setTimeout(a, 1);
				if(h.addEventListener) C.push(a), h.addEventListener("DOMContentLoaded", D, !1);
				else {
					var b = function() {
						try {
							r.doScroll("left")
						} catch(c) {
							setTimeout(b, 1);
							return
						}
						a()
					};
					b()
				}
			},
			$css: {
				get: function(a, b) {
					if("object" === typeof b) {
						var c = {};
						$each(b, function(b, f) {
							c[f] = $style.get(a, f)
						});
						return c
					}
					return $style.get(a, b)
				},
				set: function(a, b, c) {
					return e(a, function(a) {
						"object" === typeof b ? $each(b, function(b, c) {
							$style.set(a, $string.camelCase(b), $css.fix(b, c))
						}) : $style.set(a, $string.camelCase(b), $css.fix(b, c));
						return a
					})
				},
				number: {
					fontWeight: !0,
					lineHeight: !0,
					opacity: !0,
					zIndex: !0
				},
				unit: function(a, b) {
					if($css.number[a]) return "";
					var c = (b + "").replace(K, "");
					return "" === c ? "px" : c
				},
				fix: function(a, b) {
					"number" !== typeof b || $css.number[a] || (b += "px");
					return null === b && isNaN(b) ? !1 : b
				}
			},
			$style: {
				get: p.getComputedStyle ? function(a, b) {
					if(null !== a) {
						var c = h.defaultView.getComputedStyle(a, null).getPropertyValue(b);
						return "auto" === c || "" === c ? 0 : c
					}
					return !1
				} : function(a, b) {
					if(null !== a) {
						var c = "opacity" === b ? M.test(a.currentStyle.filter) ? 0.01 * parseFloat(RegExp.$1) + "" : 1 : a.currentStyle[$string.camelCase(b)];
						return "auto" === c ? 0 : c
					}
					return !1
				},
				set: r.style.opacity !== l ? function(a, b, c) {
					return e(a, function(a) {
						a.style[b] = c;
						return !0
					})
				} : function(a, b, c) {
					return e(a, function(a) {
						a.currentStyle && a.currentStyle.hasLayout || (a.style.zoom = 1);
						"opacity" === b ? (a.style.filter = "alpha(opacity=" + 100 * c + ")", a.style.zoom = 1) : a.style[b] = c;
						return !0
					})
				}
			},
			$pos: function(a, b, c) {
				return e(a, function(a) {
					$style.set(a, "left", b + "px");
					$style.set(a, "top", c + "px");
					return a
				})
			},
			$offset: function(a) {
				var b = h.body,
					c = a.getBoundingClientRect();
				return {
					top: c.top + (p.scrollY || b.parentNode.scrollTop || a.scrollTop) - (r.clientTop || b.clientTop || 0),
					left: c.left + (p.scrollX || b.parentNode.scrollLeft || a.scrollLeft) - (r.clientLeft || b.clientLeft || 0),
					width: a.offsetWidth,
					height: a.offsetHeight
				}
			},
			$append: function(a, b) {
				return e(a, function(a) {
					return a.appendChild(v(a, b))
				})
			},
			$prepend: function(a, b) {
				return e(a, function(a) {
					return a.firstChild ? a.insertBefore(v(a, b), a.firstChild) : a.appendChild(v(a, b))
				})
			},
			$before: function(a, b) {
				return e(a, function(a) {
					return a.parentNode.insertBefore(v(a, b), a)
				})
			},
			$after: function(a, b) {
				return e(a, function(a) {
					return a.nextSibling ? a.parentNode.insertBefore(v(a, b), a.nextSibling) : a.parentNode.appendChild(v(a, b))
				})
			},
			$remove: function(a) {
				return e(a, function(a) {
					$empty(a);
					a.guid !== l && delete $event.global[a.guid];
					return null !== a && a.parentNode ? a.parentNode.removeChild(a) : a
				})
			},
			$empty: function(a) {
				return e(a, function(a) {
					for(; a.firstChild;) 1 === a.nodeType && a.guid !== l && delete $event.global[a.guid], a.removeChild(a.firstChild);
					return a
				})
			},
			$html: function(a, b) {
				return e(a, function(a) {
					if(b) {
						try {
							a.innerHTML = b
						} catch(d) {
							$append($empty(a), b)
						}
						return a
					}
					return 1 === a.nodeType ? a.innerHTML : null
				})
			},
			$text: function(a, b) {
				return e(a, function(a) {
					if(b) return $empty(a), a.appendChild(h.createTextNode(b)), a;
					var d = "",
						f = a.textContent;
					if((f || a.innerText) === a.innerHTML) d = f ? $string.trim(a.textContent.replace(y, "")) : a.innerText.replace(J, "");
					else
						for(a = a.firstChild; a; a = a.nextSibling)
							if(f = a.nodeType, 3 === f && "" !== $string.trim(a.nodeValue) && (d += a.nodeValue.replace(y, "") + (a.nextSibling && a.nextSibling.tagName && "br" !== a.nextSibling.tagName.toLowerCase() ? "\n" : "")), 1 === f || 2 === f) d += $text(a) + ("block" === $style.get(a, "display") || "br" === a.tagName.toLowerCase() ? "\n" : ""); return d
				})
			},
			$className: {
				add: function(a, b) {
					return e(a, function(a) {
						if("" === a.className) a.className = b;
						else {
							var d = a.className,
								f = [];
							$each(b.split(w), function(a, b) {
								RegExp("\\b(" + b + ")\\b").test(d) || f.push(" " + b)
							});
							a.className += f.join("")
						}
						return a
					})
				},
				set: function(a, b) {
					return e(a, function(a) {
						a.className = b;
						return a
					})
				},
				has: function(a, b) {
					return RegExp("\\b(" + b.split(w).join("|") + ")\\b").test(a.className)
				},
				remove: function(a, b) {
					return e(a, function(a) {
						a.className = b ? $string.trim(a.className.replace(RegExp("\\b(" + b.split(w).join("|") + ")\\b"), "").split(w).join(" ")) : "";
						return a
					})
				}
			},
			$hide: function(a, b, c) {
				E(a, "hide", b, c)
			},
			$show: function(a, b, c) {
				E(a, "show", b, c)
			},
			$toggle: function(a, b, c) {
				return e(a, function(a) {
					"none" === $style.get(a, "display") ? $show(a, b, c) : $hide(a, b, c)
				})
			},
			$animate: function() {
				var a = r.style;
				return a.webkitTransition !== l || a.MozTransition !== l || a.OTransition !== l || a.msTransition !== l || a.transition !== l
			}() ? function() {
				var a = r.style,
					b = (a.webkitTransition !== l ? "Webkit" : a.MozTransition !== l ? "Moz" : a.OTransition !== l ? "O" : a.msTransition !== l ? "ms" : "") + "Transition";
				return function(a, d, f, s) {
					return e(a, function(a) {
						var c = [],
							e = [],
							h = [],
							n = [],
							m = a.style,
							k;
						f = f || 300;
						for(k in d) e[k] = $string.camelCase(k), d[k].from !== l ? (d[k].to = d[k].to || 0, c[k] = $css.number[k] ? d[k].to : parseInt(d[k].to, 10), h[k] = $css.unit(k, d[k].to), $style.set(a, e[k], parseInt(d[k].from, 10) + h[k])) : (c[k] = $css.number[k] ? d[k] : parseInt(d[k], 10), h[k] = $css.unit(k, d[k]), $style.set(a, e[k], $style.get(a, e[k]))), n.push(k);
						setTimeout(function() {
							m[b] = "all " + f + "ms";
							$each(n, function(a, b) {
								m[e[b]] = c[b] + h[b]
							})
						}, 15);
						setTimeout(function() {
							m[b] = "";
							s && s.call(a)
						}, f);
						return a
					})
				}
			}() : function(a, b, c, d) {
				return e(a, function(a) {
					var e = 0,
						g = 0,
						h = 0,
						n = 0,
						u = [],
						p = [],
						m = [],
						k = [],
						r = [],
						q;
					c = c || 300;
					for(q in b) m.push($string.camelCase(q)), b[q].from !== l ? (h = b[q].to, p.push($css.number[q] ? b[q].from : parseInt(b[q].from, 10)), $style.set(a, m[g], p[g] + $css.unit(q, h))) : (h = b[q], p.push(parseInt($style.get(a, $string.camelCase(q)), 10))), u.push($css.number[q] ? h : parseInt(h, 10)), k.push($css.unit(q, h)), g++, n++;
					for(h = 0; 30 > h; h++)
						for(r[h] = [], g = 0; g < n; g++) r[h][m[g]] = p[g] + (u[g] - p[g]) / 30 * h + ("opacity" === m[g] ? "" : k[g]);
					for(; 30 > g; g++) setTimeout(function() {
						for(g = 0; g < n; g++) $style.set(a, m[g], r[e][m[g]]);
						e++
					}, c / 30 * g);
					setTimeout(function() {
						for(g = 0; g < n; g++) $style.set(a, m[g], u[g] + k[g]);
						d && d.call(a)
					}, c);
					return a
				})
			},
			$fadeout: function(a, b, c) {
				return e(a, function(a) {
					$animate(a, {
						opacity: {
							from: 1,
							to: 0
						}
					}, b || 500, c)
				})
			},
			$fadein: function(a, b, c) {
				return e(a, function(a) {
					$animate(a, {
						opacity: {
							from: 0,
							to: 1
						}
					}, b || 500, c)
				})
			},
			$cookie: {
				get: function(a) {
					for(var b = h.cookie.split("; "), c = 0, d = b.length, f; c < d; c++)
						if(f = b[c].split("="), f[0] === a) return a = decodeURIComponent(f[1]), $json.isJSON(a) ? $json.decode(a) : a + "";
					return null
				},
				set: function(a, b, c) {
					if("object" === typeof a) return c = b, $each(a, function(a, b) {
						$cookie.set(a, b, c)
					});
					var d = new Date;
					d.setTime(d.getTime());
					c = c ? ";expires=" + (new Date(d.getTime() + 864E5 * c)).toGMTString() : "";
					b = "object" === typeof b ? $json.encode(b) : b;
					return h.cookie = a + "=" + $url(b) + c + ";path=/"
				},
				remove: function() {
					$each(arguments, function(a, b) {
						$cookie.set(b, "", -1)
					});
					return !0
				}
			},
			$json: {
				decode: p.JSON ? function(a) {
					return $json.isJSON(a) ? JSON.parse($string.trim(a)) : !1
				} : function(a) {
					return $json.isJSON(a) ? (new Function("return " + $string.trim(a)))() : !1
				},
				encode: p.JSON ? function(a) {
					return JSON.stringify(a)
				} : function(a) {
					return "{" + function(a) {
						var c = [],
							d, f, e, g;
						for(d in a) {
							e = a[d];
							f = typeof e;
							if("undefined" === f) return;
							if("function" !== f) {
								switch(f) {
									case "object":
										g = null === e ? e : e.getDay ? '"' + (1E3 - 10 * ~e.getUTCMonth() + e.toUTCString() + 1E3 + e / 1).replace(/1(..).*?(\d\d)\D+(\d+).(\S+).*(...)/, "$3-$1-$2T$4.$5Z") + '"' : e.length ? "[" + function() {
											var a = [];
											$each(e, function(b, c) {
												a.push("string" === typeof c ? '"' + $string.slashes(c) + '"' : c)
											});
											return a.join(",")
										}() + "]" : $json.encode(e);
										break;
									case "number":
										g = isFinite(e) ? e : null;
										break;
									case "boolean":
									case "null":
										g = e;
										break;
									case "string":
										g = '"' + $string.slashes(e) + '"'
								}
								c.push('"' + d + '":' + g)
							}
						}
						return c.join(",")
					}(a) + "}"
				},
				isJSON: function(a) {
					return "string" === typeof a && "" !== $string.trim(a) ? N.test(a.replace(O, "@").replace(P, "]").replace(Q, "")) : !1
				}
			},
			$ajax: function(a, b) {
				"object" === typeof a && (b = a, a = l);
				b = b || {};
				var c = p.ActiveXObject ? new ActiveXObject("Microsoft.XMLHTTP") : new XMLHttpRequest;
				a = a || b.url;
				var d = [],
					f;
				b.data && $each(b.data, function(a, b) {
					d.push(F(a, b))
				});
				f = d.join("&").replace(/%20/g, "+");
				"GET" === b.type ? (c.open("GET", a + (L.test(a) ? "&" : "?") + f, !0), f = null) : c.open(b.type || "POST", a, !0);
				c.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
				b.header && $each(b.header, function(a, b) {
					c.setRequestHeader(a, b)
				});
				c.send(f);
				c.onreadystatechange = function() {
					4 === c.readyState && (200 === c.status && b.success ? (f = c.responseText, b.success("" !== f && $json.isJSON(f) ? $json.decode(f) : f)) : b.error && b.error(c.status))
				}
			},
			$require: function(a, b) {
				var c = [],
					d;
				$each(a, function(a, e) {
					A[e] || (A[e] = !0, c.push(e), d = /\.css[^\.]*$/ig.test(e) ? $new("link", {
						type: "text/css",
						rel: "stylesheet",
						href: e
					}) : $new("script", {
						type: "text/javascript",
						async: !0,
						src: e
					}), d.onload = d.onreadystatechange = function(a) {
						if("load" === a.type || /loaded|complete/.test(d.readyState)) d.onload = d.onreadystatechange = null, c.splice(c.indexOf(e), 1), 0 === c.length && b && b()
					}, $append(h.head || $tag(h, "head")[0] || r, d))
				})
			},
			$template: function(a, b) {
				var c = B[a];
				c || (c = "var s='';s+='" + a.replace(/[\r\t\n]/g, " ").split("'").join("\\'").replace(/\{\{#([\w]*)\}\}(.*)\{\{\/(\1)\}\}/ig, function(a, b, c) {
					return "';var i=0,l=data." + b + ".length,d=data." + b + ";for(;i<l;i++){s+='" + c.replace(/\{\{(\.|this)\}\}/g, "'+d[i]+'").replace(/\{\{([\w]*)\}\}/g, "'+d[i].$1+'") + "'}s+='"
				}).replace(/\{\{(.+?)\}\}/g, "'+data.$1+'") + "';return s;", B[a] = c);
				return b ? (new Function("data", c))(b) : new Function("data", c)
			},
			$url: function(a) {
				return encodeURIComponent(a)
			},
			$rand: function(a, b) {
				return Math.floor(Math.random() * (b - a + 1) + a)
			},
			$browser: function() {
				for(var a = navigator.userAgent.toLowerCase(), b = {}, c = "msie firefox opera webkit iPad iPhone android".split(" "), d = c.length, e = 6; d--;) b[c[d]] = -1 < a.indexOf(c[d].toLowerCase());
				for(; 12 > e; e++) b["msie" + e] = -1 < a.indexOf("msie " + e);
				b.is = function(b) {
					return RegExp(b, "ig").test(a)
				};
				return b
			}()
		},
		x;
	for(x in n) p[x] = n[x];
	n.version = "1.1.2";
	p.Qatrix = n;
	$ready(function() {
		h.querySelectorAll || (n.Qselector = $append(h.body, $new("style")));
		p.localStorage || (n.storage = $append(h.body, $new("link", {
			style: {
				behavior: "url(#default#userData)"
			}
		})))
	});
	"function" === typeof define && define.amd && define("qatrix", [], n)
})(window, document);