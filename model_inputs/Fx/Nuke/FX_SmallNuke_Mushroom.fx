{
	"type": "fx",
	"duration": 15,
	"cullingRadius": 100,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"x": -0.58837,
			"y": 0.14223,
			"z": -10.1267,
			"scaleX": 4000,
			"scaleY": 4000,
			"scaleZ": 2,
			"color": -14869219,
			"kind": 0,
			"args": [
				0
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"x": 5.043045,
			"y": -0.091565,
			"z": 15.304219999999999,
			"children": [
				{
					"type": "model",
					"name": "Nuke_Pied_Smoke",
					"source": "Fx/Meshes_Common/Nuke_4.fbx",
					"z": -20.27444,
					"scaleX": 2.200000000000001,
					"scaleY": 2.200000000000001,
					"scaleZ": 2.58,
					"rotationZ": 8.18,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
									"blend": "Alpha",
									"shadows": false,
									"culling": "None",
									"colorMask": 255,
									"depthTest": "LessEqual",
									"alphaKill": false,
									"enableStencil": false,
									"parallax": 0,
									"textureWrap": true,
									"drawOrder": "100",
									"depthWrite": "On"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Alphas/T_Nuke.png"
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 0.7,
								"scaleY": 0.7,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0.1
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": true,
								"Z": true,
								"texScale": 1,
								"tex": "Fx/Alphas/T_NukeVertex.png",
								"intensity": 1,
								"scrollSpeed": [
									0,
									0.07
								],
								"smoothEdge": 0,
								"texScaleX": 0.7,
								"texScaleY": 0.7
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 1,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 0.7,
								"uvScaleY": 0.7,
								"texture": "Fx/Alphas/T_Nuke.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0.07
								],
								"uvScaleSpeed": [
									0,
									0
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "progress",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.0031329162557812915,
											"value": 0.0033203124999993117,
											"mode": 1
										},
										{
											"time": 0.303,
											"value": 0.4541992187499996,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.20309069622494771
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.48429319869026005
											}
										},
										{
											"time": 0.4533347589476051,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": -0.02314686414930589,
												"dt": 0.9120488511724405
											}
										},
										{
											"time": 2.2047738186282992,
											"value": 1.5,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 10,
								"power": 0.8
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"props": {
								"RGB": true,
								"ALPHA": false,
								"REVERSE": true,
								"bias": 0.07,
								"scale": 0.71,
								"power": 0.11,
								"color": [
									1,
									0.3058823529411765,
									0.12549019607843137
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.21601384464145068,
											"mode": 0,
											"prevHandle": {
												"dv": 0.03501594661492524,
												"dt": -0.49374169417723895
											},
											"nextHandle": {
												"dv": -0.13056972732838057,
												"dt": 1.8486805403232578
											}
										},
										{
											"time": 2.107099609375001,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.12051743008833779,
												"dt": -0.49131901196433725
											},
											"nextHandle": {
												"dv": -0.44999999999999996,
												"dt": 1.835851617753506
											}
										},
										{
											"time": 2.107099609375001,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5627450980392157,
											"mode": 0,
											"prevHandle": {
												"dv": 0.06046165613133731,
												"dt": -0.49270957779350577
											},
											"nextHandle": {
												"dv": -0.21882352941176475,
												"dt": 1.784535927474499
											}
										},
										{
											"time": 2.107099609375001,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "Level",
							"source": "shaders/Level.hx",
							"props": {
								"levelMin": 0.15,
								"levelMax": 0.95
							},
							"children": [
								{
									"type": "curve",
									"name": "levelMax",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.7,
											"mode": 0,
											"prevHandle": {
												"dv": -0.1296712496229607,
												"dt": -0.5965807302666721
											},
											"nextHandle": {
												"dv": 0.14500000000000002,
												"dt": 0.6684196639060975
											}
										},
										{
											"time": 2,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "levelMin",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 1
											}
										},
										{
											"time": 2.1,
											"value": 0.05,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorMap3",
							"source": "shaders/ColorMap3.hx",
							"props": {
								"colorA": [
									1,
									1,
									1
								],
								"pointA": 1,
								"colorB": [
									1,
									1,
									1
								],
								"pointB": 0.98,
								"colorC": [
									1,
									1,
									1
								],
								"pointC": 0
							},
							"children": [
								{
									"type": "curve",
									"name": "colorB.h",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.816922696929689,
											"value": 0.3182659224224954,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "colorB.s",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.816922696929689,
											"value": 0.5257731958762886,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "colorB.l",
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.816922696929689,
											"value": 0.3803921568627451,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"onDecal": false,
								"wrap": true,
								"invert": true,
								"replace": false,
								"alpha": 3,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0.02,
								"texture": "Fx/Gradients/vGrad_inv.jpg"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.8965320181639145,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "scale.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1.0666666666666667,
									"mode": 0,
									"prevHandle": {
										"dv": -0.11929873224650708,
										"dt": -0.0436918738574221
									},
									"nextHandle": {
										"dv": 0.22166666666666668,
										"dt": 0.07989284101873641
									}
								},
								{
									"time": 1.93086582553573,
									"value": 2,
									"mode": 0,
									"prevHandle": {
										"dv": -0.0038888888888888307,
										"dt": -1.5100042768428106
									},
									"nextHandle": {
										"dv": 0.0016574983077184554,
										"dt": 0.6435847371894798
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "Level",
							"source": "shaders/Level.hx",
							"props": {
								"levelMin": 0,
								"levelMax": 1
							},
							"children": [
								{
									"type": "curve",
									"name": "levelMax",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 0.6,
											"mode": 0,
											"prevHandle": {
												"dv": -0.1750246624940928,
												"dt": -0.4737065891079545
											},
											"nextHandle": {
												"dv": 0.27333333333333343,
												"dt": 0.7329337880952452
											}
										},
										{
											"time": 1.575,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "levelMin",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0005197340357864772,
												"dt": -0.4998357154547406
											},
											"nextHandle": {
												"dv": -0.0008333333333333318,
												"dt": 0.7945821481881221
											}
										},
										{
											"time": 2.18,
											"value": 0.05,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Nuke_Tete_Smoke",
					"source": "Fx/Meshes_Common/Nuke_5.fbx",
					"z": 22.15924,
					"scaleX": 2.2,
					"scaleY": 2.2,
					"scaleZ": 2.2,
					"rotationZ": 8.2,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
									"blend": "Alpha",
									"shadows": false,
									"culling": "None",
									"colorMask": 255,
									"depthTest": "LessEqual",
									"alphaKill": false,
									"enableStencil": false,
									"parallax": 0,
									"drawOrder": "100",
									"textureWrap": true,
									"emissive": 2,
									"depthWrite": "On"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Alphas/T_Nuke.png"
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0051986213849617435,
												"dt": -0.49995891367756734
											},
											"nextHandle": {
												"dv": -0.016666666666666607,
												"dt": 1.6088396710638224
											}
										},
										{
											"time": 1.8965320181639145,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": true,
								"Z": true,
								"texScale": 1,
								"tex": "Fx/Alphas/T_NukeVertex.png",
								"intensity": 1,
								"scrollSpeed": [
									0.01,
									-0.05
								],
								"smoothEdge": 0,
								"texScaleX": 1,
								"texScaleY": 1
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 1,
								"scaleY": 1,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": 0.01,
								"shiftSpeedY": -0.05
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 1,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Alphas/T_Nuke.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.01,
									-0.05
								],
								"uvScaleSpeed": [
									0,
									0
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "progress",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.0031329162557812915,
											"value": 0.0033203124999993117,
											"mode": 1
										},
										{
											"time": 0.303,
											"value": 0.4541992187499996,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.20309069622494771
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.48429319869026005
											}
										},
										{
											"time": 0.4533347589476051,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": -0.02314686414930589,
												"dt": 0.5303767679728343
											}
										},
										{
											"time": 3.6432355541287595,
											"value": 1.5,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"props": {
								"RGB": true,
								"ALPHA": false,
								"REVERSE": true,
								"bias": 0.07,
								"scale": 0.11,
								"power": 0.3,
								"color": [
									1,
									0.3058823529411765,
									0.12549019607843137
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.5172372406181971,
											"value": 0.21601384464145068,
											"mode": 0,
											"prevHandle": {
												"dv": 0.08505125494931129,
												"dt": -0.34870079179559027
											},
											"nextHandle": {
												"dv": -0.19801269092132978,
												"dt": 0.8128741952058776
											}
										},
										{
											"time": 1.9006445312500007,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.5172372406181971,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.10864762725075004,
												"dt": -0.49393921407406066
											},
											"nextHandle": {
												"dv": -0.30000000000000004,
												"dt": 1.3649187695355072
											}
										},
										{
											"time": 1.9006445312500007,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.5172372406181971,
											"value": 0.5627450980392157,
											"mode": 0,
											"prevHandle": {
												"dv": 0.21687591134750409,
												"dt": -0.3703017052412526
											},
											"nextHandle": {
												"dv": -0.6846732026143791,
												"dt": 1.1700795080074027
											}
										},
										{
											"time": 1.9006445312500007,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "Level",
							"source": "shaders/Level.hx",
							"props": {
								"levelMin": 0,
								"levelMax": 1
							},
							"children": [
								{
									"type": "curve",
									"name": "levelMax",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 0.3448611738160249,
											"mode": 0,
											"prevHandle": {
												"dv": -0.3087201590413261,
												"dt": -0.581487618931844
											},
											"nextHandle": {
												"dv": 0.3275694130919876,
												"dt": 0.6134425222362123
											}
										},
										{
											"time": 1.3242991897789782,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6463439655443873
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6463439655443873
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "levelMin",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01763504563932453,
												"dt": -0.36323420847735793
											},
											"nextHandle": {
												"dv": 0.029166666666666667,
												"dt": 0.5972059171088702
											}
										},
										{
											"time": 1.5142991897789781,
											"value": 0.05,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.7096772988777206
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.7096772988777206
											}
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorMap3",
							"source": "shaders/ColorMap3.hx",
							"props": {
								"colorA": [
									1,
									1,
									1
								],
								"pointA": 1,
								"colorB": [
									1,
									1,
									1
								],
								"pointB": 0.98,
								"colorC": [
									1,
									1,
									1
								],
								"pointC": 0
							},
							"children": [
								{
									"type": "curve",
									"name": "colorB.h",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.816922696929689,
											"value": 0.3182659224224954,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "colorB.s",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.816922696929689,
											"value": 0.5257731958762886,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "colorB.l",
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.816922696929689,
											"value": 0.3803921568627451,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							}
						},
						{
							"type": "curve",
							"name": "position.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.0184948931121538,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -10.386707537521213,
										"dt": -0.06745794754396764
									},
									"nextHandle": {
										"dv": 25,
										"dt": 0.1588175786706349
									}
								},
								{
									"time": 1.9633390357904144,
									"value": 30,
									"mode": 0,
									"prevHandle": {
										"dv": -0.3333333333333357,
										"dt": -1.233981989677996
									},
									"nextHandle": {
										"dv": 0.17510392508703385,
										"dt": 0.6482252696379729
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"onDecal": false,
								"wrap": false,
								"invert": true,
								"replace": false,
								"alpha": 2,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 1,
								"vOffset": 0.02,
								"texture": "Fx/Gradients/vGrad.png"
							}
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.9,
									"mode": 0,
									"prevHandle": {
										"dv": -0.08698662680174586,
										"dt": -0.04208427789601615
									},
									"nextHandle": {
										"dv": 0.39465816344454685,
										"dt": 0.19
									}
								},
								{
									"time": 1.8496827998990217,
									"value": 1.25,
									"mode": 0,
									"prevHandle": {
										"dv": -0.0024999999999999467,
										"dt": -1.2015087794233135
									},
									"nextHandle": {
										"dv": 0.0012827718259637187,
										"dt": 0.6165046443569081
									}
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Nuke_Around_Smoke",
					"source": "Fx/Meshes_Common/Torus.fbx",
					"enabled": false,
					"z": -23,
					"scaleX": 70,
					"scaleY": 70,
					"scaleZ": 70,
					"rotationZ": -90,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
									"blend": "Alpha",
									"shadows": false,
									"culling": "None",
									"colorMask": 255,
									"depthTest": "LessEqual",
									"alphaKill": false,
									"enableStencil": false,
									"parallax": 0,
									"textureWrap": true,
									"depthWrite": "On"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Alphas/T_Nuke.png"
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1
							}
						},
						{
							"type": "shader",
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": true,
								"Z": true,
								"texScale": 1,
								"tex": "Fx/Alphas/T_NukeVertex.png",
								"intensity": 1,
								"scrollSpeed": [
									0.06,
									0
								],
								"smoothEdge": 0,
								"texScaleX": 1.2,
								"texScaleY": 1.2
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 1.2,
								"scaleY": 1.2,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": 0.05,
								"shiftSpeedY": 0
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 1,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1.2,
								"uvScaleY": 1.2,
								"texture": "Fx/Alphas/T_Nuke.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									-0.06,
									0
								],
								"uvScaleSpeed": [
									0,
									0
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "width",
									"enabled": false,
									"keys": [
										{
											"time": 0.0034905516751835286,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.405,
											"value": 0.7,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "progress",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.05944335937499989,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 1.145055954753944
											}
										},
										{
											"time": 2.584581618655692,
											"value": 1.5,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "progress",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": -0.0031329162557812915,
											"value": 0.0033203124999993117,
											"mode": 1
										},
										{
											"time": 0.2117721061706535,
											"value": 0.4541992187499996,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.20309069622494771
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.48429319869026005
											}
										},
										{
											"time": 0.3621068651182586,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": -0.02314686414930589,
												"dt": 0.9120488511724405
											}
										},
										{
											"time": 2.4638352966308603,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.7005761438375339
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.7005761438375339
											}
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"props": {
								"RGB": true,
								"ALPHA": false,
								"REVERSE": true,
								"bias": 0.07,
								"scale": 0.71,
								"power": 0.11,
								"color": [
									1,
									0.3058823529411765,
									0.12549019607843137
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.21601384464145068,
											"mode": 0,
											"prevHandle": {
												"dv": 0.03501594661492524,
												"dt": -0.49374169417723895
											},
											"nextHandle": {
												"dv": -0.13056972732838057,
												"dt": 1.8486805403232578
											}
										},
										{
											"time": 2.9700085536856213,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.12051743008833779,
												"dt": -0.49131901196433725
											},
											"nextHandle": {
												"dv": -0.44999999999999996,
												"dt": 1.835851617753506
											}
										},
										{
											"time": 2.9700085536856213,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5627450980392157,
											"mode": 0,
											"prevHandle": {
												"dv": 0.06046165613133731,
												"dt": -0.49270957779350577
											},
											"nextHandle": {
												"dv": -0.21882352941176475,
												"dt": 1.784535927474499
											}
										},
										{
											"time": 2.9700085536856213,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "Level",
							"source": "shaders/Level.hx",
							"props": {
								"levelMin": 0.15,
								"levelMax": 0.95
							},
							"children": [
								{
									"type": "curve",
									"name": "levelMax",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.7,
											"mode": 0,
											"prevHandle": {
												"dv": -0.16595926045291778,
												"dt": -0.49272959619652407
											},
											"nextHandle": {
												"dv": 0.17500000000000004,
												"dt": 0.5182811794569717
											}
										},
										{
											"time": 1.16,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "levelMin",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0011394164931772732,
												"dt": -0.49950690323310437
											},
											"nextHandle": {
												"dv": -0.001666666666666667,
												"dt": 0.7293570461124184
											}
										},
										{
											"time": 1.139,
											"value": 0.05,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorMap3",
							"source": "shaders/ColorMap3.hx",
							"props": {
								"colorA": [
									1,
									1,
									1
								],
								"pointA": 1,
								"colorB": [
									1,
									1,
									1
								],
								"pointB": 0.98,
								"colorC": [
									1,
									1,
									1
								],
								"pointC": 0
							},
							"children": [
								{
									"type": "curve",
									"name": "colorB.h",
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.9700085536856213,
											"value": 0.3182659224224954,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "colorB.s",
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.9700085536856213,
											"value": 0.5257731958762886,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "colorB.l",
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.9700085536856213,
											"value": 0.3803921568627451,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 20,
								"power": 10
							}
						},
						{
							"type": "shader",
							"name": "Level",
							"source": "shaders/Level.hx",
							"props": {
								"levelMin": 0,
								"levelMax": 1
							},
							"children": [
								{
									"type": "curve",
									"name": "levelMax",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": 2.755091858508116e-17,
												"dt": -0.48047860956729344
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5081554975128464
											}
										},
										{
											"time": 1.3535,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "levelMin",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0006680748042788841,
												"dt": -0.42234332099564215
											},
											"nextHandle": {
												"dv": -0.0008333333333333318,
												"dt": 0.5295129193878464
											}
										},
										{
											"time": 2.1885,
											"value": 0.05,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Nuke_Around_Smoke",
					"source": "Fx/Meshes_Common/Torus.fbx",
					"enabled": false,
					"z": -16.37413,
					"scaleX": 130,
					"scaleY": 130,
					"scaleZ": 20,
					"rotationZ": -90,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
									"blend": "Alpha",
									"shadows": false,
									"culling": "None",
									"colorMask": 255,
									"depthTest": "LessEqual",
									"alphaKill": false,
									"enableStencil": false,
									"parallax": 0,
									"textureWrap": true
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Alphas/T_Nuke.png"
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1
							}
						},
						{
							"type": "shader",
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": true,
								"Z": true,
								"texScale": 1,
								"tex": "Fx/Alphas/T_NukeVertex.png",
								"intensity": 2,
								"scrollSpeed": [
									-0.05,
									0
								],
								"smoothEdge": 0,
								"texScaleX": 2,
								"texScaleY": 2
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 2,
								"scaleY": 2,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": -0.025,
								"shiftSpeedY": 0
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 1.5,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 2,
								"texture": "Fx/Alphas/T_Nuke.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									-0.05,
									0
								],
								"uvScaleSpeed": [
									0,
									0
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "width",
									"enabled": false,
									"keys": [
										{
											"time": 0.0034905516751835286,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.175,
											"value": 0.7,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "progress",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.5963671874999998,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 1.0266308593750013
											}
										},
										{
											"time": 2.5478027343750007,
											"value": 1.5,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "progress",
									"enabled": false,
									"keyMode": 1,
									"keys": [
										{
											"time": -0.0031329162557812915,
											"value": 0.0033203124999993117,
											"mode": 1
										},
										{
											"time": 0.2117721061706535,
											"value": 0.4541992187499996,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.20309069622494771
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.48429319869026005
											}
										},
										{
											"time": 0.3621068651182586,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": -0.02314686414930589,
												"dt": 0.9120488511724405
											}
										},
										{
											"time": 2.4638352966308603,
											"value": 1.5,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"props": {
								"RGB": true,
								"ALPHA": false,
								"REVERSE": true,
								"bias": 0.07,
								"scale": 0.71,
								"power": 0.11,
								"color": [
									1,
									0.3058823529411765,
									0.12549019607843137
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.21601384464145068,
											"mode": 0,
											"prevHandle": {
												"dv": 0.05140426758223691,
												"dt": -0.4636540566064369
											},
											"nextHandle": {
												"dv": -0.18361176794523307,
												"dt": 1.6548435383709152
											}
										},
										{
											"time": 2.742696081902833,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.24150462894801453,
												"dt": -0.44701854381857525
											},
											"nextHandle": {
												"dv": -0.8333333333333333,
												"dt": 1.5411873024795208
											}
										},
										{
											"time": 2.742696081902833,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5627450980392157,
											"mode": 0,
											"prevHandle": {
												"dv": 0.06046165613133731,
												"dt": -0.49270957779350577
											},
											"nextHandle": {
												"dv": -0.21882352941176475,
												"dt": 1.784535927474499
											}
										},
										{
											"time": 2.742696081902833,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "Level",
							"source": "shaders/Level.hx",
							"props": {
								"levelMin": 0.15,
								"levelMax": 0.95
							},
							"children": [
								{
									"type": "curve",
									"name": "levelMax",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.7,
											"mode": 0,
											"prevHandle": {
												"dv": -0.1296712496229607,
												"dt": -0.5965807302666721
											},
											"nextHandle": {
												"dv": 0.14500000000000002,
												"dt": 0.6684196639060975
											}
										},
										{
											"time": 1.58,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "levelMin",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 1
											}
										},
										{
											"time": 1.75,
											"value": 0.05,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorMap3",
							"source": "shaders/ColorMap3.hx",
							"props": {
								"colorA": [
									1,
									1,
									1
								],
								"pointA": 1,
								"colorB": [
									1,
									1,
									1
								],
								"pointB": 0.98,
								"colorC": [
									1,
									1,
									1
								],
								"pointC": 0
							},
							"children": [
								{
									"type": "curve",
									"name": "colorB.h",
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.742696081902833,
											"value": 0.3182659224224954,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "colorB.s",
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.742696081902833,
											"value": 0.5257731958762886,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "colorB.l",
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.742696081902833,
											"value": 0.3803921568627451,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 0.2,
								"color": [
									0.8941176470588235,
									0.8941176470588235,
									0.8941176470588235
								]
							}
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.7,
								"sandColorSet": false,
								"envBlend": 0.4,
								"envColorSet": false
							}
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 20,
								"power": 10
							}
						},
						{
							"type": "curve",
							"name": "scale.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.5,
									"mode": 0,
									"prevHandle": {
										"dv": -0.5393097055357318,
										"dt": -0.32110763936379855
									},
									"nextHandle": {
										"dv": 0.22305318138651486,
										"dt": 0.13260631001371748
									}
								},
								{
									"time": 1.9570136642456057,
									"value": 0.7,
									"mode": 0,
									"prevHandle": {
										"dv": 0.013661760037993353,
										"dt": -1.5625692198011611
									},
									"nextHandle": {
										"dv": -0.007569295262457692,
										"dt": 0.9519961583393695
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "scale.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.5,
									"mode": 0,
									"prevHandle": {
										"dv": -0.5393097055357318,
										"dt": -0.32110763936379855
									},
									"nextHandle": {
										"dv": 0.22305318138651486,
										"dt": 0.13260631001371748
									}
								},
								{
									"time": 1.9570136642456057,
									"value": 0.7,
									"mode": 0,
									"prevHandle": {
										"dv": 0.013661760037993353,
										"dt": -1.5625692198011611
									},
									"nextHandle": {
										"dv": -0.007569295262457692,
										"dt": 0.9519961583393695
									}
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Nuke_Around_Smoke",
					"source": "Fx/Meshes_Common/Torus.fbx",
					"enabled": false,
					"z": -16.97064,
					"scaleX": 190,
					"scaleY": 190,
					"scaleZ": 20,
					"rotationZ": -90,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
									"blend": "Alpha",
									"shadows": false,
									"culling": "None",
									"colorMask": 255,
									"depthTest": "LessEqual",
									"alphaKill": false,
									"enableStencil": false,
									"parallax": 0,
									"textureWrap": true,
									"drawOrder": "-80"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Alphas/T_Nuke.png"
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.8
							}
						},
						{
							"type": "shader",
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": true,
								"Z": true,
								"texScale": 1,
								"tex": "Fx/Alphas/T_NukeVertex.png",
								"intensity": 2,
								"scrollSpeed": [
									-0.05,
									0
								],
								"smoothEdge": 0,
								"texScaleX": 2,
								"texScaleY": 2
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 2,
								"scaleY": 2,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": -0.025,
								"shiftSpeedY": 0
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 1.5,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 2,
								"texture": "Fx/Alphas/T_Nuke.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									-0.05,
									0
								],
								"uvScaleSpeed": [
									0,
									0
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "width",
									"enabled": false,
									"keys": [
										{
											"time": 0.0034905516751835286,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.9605,
											"value": 0.7,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "progress",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.4443671874999999,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 1.2284648437500008
											}
										},
										{
											"time": 2.9329199218750013,
											"value": 1.5,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "progress",
									"enabled": false,
									"keyMode": 1,
									"keys": [
										{
											"time": -0.0031329162557812915,
											"value": 0.0033203124999993117,
											"mode": 1
										},
										{
											"time": 0.2117721061706535,
											"value": 0.4541992187499996,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.20309069622494771
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.48429319869026005
											}
										},
										{
											"time": 0.3621068651182586,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": -0.02314686414930589,
												"dt": 0.9120488511724405
											}
										},
										{
											"time": 2.4638352966308603,
											"value": 1.5,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"props": {
								"RGB": true,
								"ALPHA": false,
								"REVERSE": true,
								"bias": 0.07,
								"scale": 0.71,
								"power": 0.11,
								"color": [
									1,
									0.3058823529411765,
									0.12549019607843137
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.21601384464145068,
											"mode": 0,
											"prevHandle": {
												"dv": 0.05140426758223691,
												"dt": -0.4636540566064369
											},
											"nextHandle": {
												"dv": -0.17281107571316054,
												"dt": 1.557423907606863
											}
										},
										{
											"time": 2.5316202152473863,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.2566496848668403,
												"dt": -0.43893659673324414
											},
											"nextHandle": {
												"dv": -0.75,
												"dt": 1.281401620442048
											}
										},
										{
											"time": 2.5316202152473863,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5627450980392157,
											"mode": 0,
											"prevHandle": {
												"dv": 0.06046165613133731,
												"dt": -0.49270957779350577
											},
											"nextHandle": {
												"dv": -0.21882352941176475,
												"dt": 1.784535927474499
											}
										},
										{
											"time": 2.5316202152473863,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "Level",
							"source": "shaders/Level.hx",
							"props": {
								"levelMin": 0.15,
								"levelMax": 0.95
							},
							"children": [
								{
									"type": "curve",
									"name": "levelMax",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.7,
											"mode": 0,
											"prevHandle": {
												"dv": -0.19282294875287917,
												"dt": -0.3756948094068253
											},
											"nextHandle": {
												"dv": 0.20000000000000007,
												"dt": 0.3883883384382354
											}
										},
										{
											"time": 0.84,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "levelMin",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0007329060291772236,
												"dt": -0.4997960432303474
											},
											"nextHandle": {
												"dv": -0.0008333333333333318,
												"dt": 0.5669909948389978
											}
										},
										{
											"time": 0.8565,
											"value": 0.05,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorMap3",
							"source": "shaders/ColorMap3.hx",
							"props": {
								"colorA": [
									1,
									1,
									1
								],
								"pointA": 1,
								"colorB": [
									1,
									1,
									1
								],
								"pointB": 0.98,
								"colorC": [
									1,
									1,
									1
								],
								"pointC": 0
							},
							"children": [
								{
									"type": "curve",
									"name": "colorB.h",
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.515383610120044,
											"value": 0.3182659224224954,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "colorB.s",
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.515383610120044,
											"value": 0.5257731958762886,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "colorB.l",
									"keys": [
										{
											"time": 0.0184948931121538,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.515383610120044,
											"value": 0.3803921568627451,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 0.2,
								"color": [
									0.8941176470588235,
									0.8941176470588235,
									0.8941176470588235
								]
							}
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.7,
								"sandColorSet": false,
								"envBlend": 0.4,
								"envColorSet": false
							}
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 20,
								"power": 10
							}
						},
						{
							"type": "curve",
							"name": "scale.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.5,
									"mode": 0,
									"prevHandle": {
										"dv": -0.5393097055357318,
										"dt": -0.32110763936379855
									},
									"nextHandle": {
										"dv": 0.22305318138651486,
										"dt": 0.13260631001371748
									}
								},
								{
									"time": 1.9570136642456057,
									"value": 0.7,
									"mode": 0,
									"prevHandle": {
										"dv": 0.013661760037993353,
										"dt": -1.5625692198011611
									},
									"nextHandle": {
										"dv": -0.007569295262457692,
										"dt": 0.9519961583393695
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "scale.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.5,
									"mode": 0,
									"prevHandle": {
										"dv": -0.5393097055357318,
										"dt": -0.32110763936379855
									},
									"nextHandle": {
										"dv": 0.22305318138651486,
										"dt": 0.13260631001371748
									}
								},
								{
									"time": 1.9570136642456057,
									"value": 0.7,
									"mode": 0,
									"prevHandle": {
										"dv": 0.013661760037993353,
										"dt": -1.5625692198011611
									},
									"nextHandle": {
										"dv": -0.007569295262457692,
										"dt": 0.9519961583393695
									}
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Ring_2",
					"source": "Fx/Meshes_Common/Ring_4.fbx",
					"enabled": false,
					"z": 10.65163,
					"scaleX": 50,
					"scaleY": 50,
					"scaleZ": 50,
					"rotationZ": 90,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
									"blend": "Alpha",
									"shadows": false,
									"culling": "Back",
									"colorMask": 255,
									"depthTest": "LessEqual",
									"alphaKill": false,
									"enableStencil": false,
									"parallax": 0,
									"textureWrap": true
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Alphas/T_Nuke.png"
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 0.5,
								"scaleY": 1,
								"shiftX": 0,
								"shiftY": 1,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0.03
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": true,
								"Z": true,
								"texScale": 1,
								"tex": "Fx/Alphas/T_NukeVertex.png",
								"intensity": 2.12,
								"scrollSpeed": [
									0,
									0.03
								],
								"smoothEdge": 0,
								"texScaleX": 0.5,
								"texScaleY": 1
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 1,
								"saturation": 1,
								"width": 0.3,
								"uvScaleX": 0.5,
								"uvScaleY": 1,
								"texture": "Fx/Alphas/T_Nuke.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0.03
								],
								"uvScaleSpeed": [
									0,
									0
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "progress",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.72,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0033698174110053164,
												"dt": -0.7955873435211922
											},
											"nextHandle": {
												"dv": -0.01214513708043985,
												"dt": 2.867371186038613
											}
										},
										{
											"time": 2.9329958345605007,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "width",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 3.3272724800873203
											}
										},
										{
											"time": 2.930425033779251,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.4
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": -1.7763568394002505e-15,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5644366827225599,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.33306111653645837
											},
											"nextHandle": {
												"dv": 0,
												"dt": 1.000272216796875
											}
										},
										{
											"time": 4.978547309521112,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 0.9,
								"power": 1.52
							},
							"isInstance": true
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.2617851192419607,
										"dt": -0.1969596492895839
									},
									"nextHandle": {
										"dv": 0.2617851192419607,
										"dt": 0.1969596492895839
									}
								},
								{
									"time": 3.870691213563,
									"value": 2,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -3.3272724800873203
									},
									"nextHandle": {
										"dv": 0,
										"dt": 3.3272724800873203
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.42439463950584594,
										"dt": -0.17322457483809342
									},
									"nextHandle": {
										"dv": 0.5885410122573376,
										"dt": 0.23988340192043903
									}
								},
								{
									"time": 3.870691213563,
									"value": 2,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -3.3272724800873203
									},
									"nextHandle": {
										"dv": 0,
										"dt": 3.3272724800873203
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.5802156174206884,
										"dt": -0.12108847667910026
									},
									"nextHandle": {
										"dv": 0.7666666666666666,
										"dt": 0.159883401920439
									}
								},
								{
									"time": 3.870691213563,
									"value": 1.5,
									"mode": 0,
									"prevHandle": {
										"dv": 0.016666666666666607,
										"dt": -1.7108078116425602
									},
									"nextHandle": {
										"dv": -0.03242941770651499,
										"dt": 3.327258256688903
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.0184948931121538,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -7.863672225668114,
										"dt": -0.3874532619755585
									},
									"nextHandle": {
										"dv": 2.3006081000206464,
										"dt": 0.11091975880828522
									}
								},
								{
									"time": 1.9633390357904144,
									"value": 2,
									"mode": 0,
									"prevHandle": {
										"dv": 0.1227759483065185,
										"dt": -1.226424383869975
									},
									"nextHandle": {
										"dv": -0.1227759483065185,
										"dt": 1.226424383869975
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Decal",
					"y": -0.47709,
					"z": -19.48494,
					"scaleX": 0.75,
					"scaleY": 0.75,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"enabled": false,
							"z": 1.1586360000000013,
							"scaleX": 90,
							"scaleY": 90,
							"scaleZ": 20,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"fadeStart": 1,
							"renderMode": "BeforeTonemapping",
							"centered": false,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.0392156862745098,
											0.023529411764705882,
											0.0196078431372549
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 5,
										"vScale": 5,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/sand.png"
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle4.png"
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"enabled": false,
									"props": {
										"scaleX": 10,
										"scaleY": 10,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Lightblack",
							"z": 1.1586360000000013,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 20,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"centered": false,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.2588235294117647,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle2.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5362274899014466,
														"dt": -0.03051465728228661
													},
													"nextHandle": {
														"dv": -1.0833333333333335,
														"dt": 0.06763066874190042
													}
												},
												{
													"time": 2.451367258999807,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -1.5001100955933375
													},
													"nextHandle": {
														"dv": -2.645156755157441e-16,
														"dt": 1.3315641396163127
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Chockwave",
							"y": -1.04291,
							"z": 1.15864,
							"scaleX": 120,
							"scaleY": 120,
							"scaleZ": 20,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"fadePower": 2,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.4,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_04_512.png"
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "CenterSand",
							"y": 1.131648,
							"z": -0.7724239999999991,
							"scaleX": 220,
							"scaleY": 220,
							"scaleZ": 20,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 5,
										"vScale": 5,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/sand.png"
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 6,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_01.png"
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"enabled": false,
									"props": {
										"scaleX": 10,
										"scaleY": 10,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Sanddecal_02",
							"enabled": false,
							"y": 0.47708799999999996,
							"z": -0.7724239999999991,
							"scaleX": 170,
							"scaleY": 170,
							"scaleZ": 20,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 5,
										"vScale": 5,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/sand.png"
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 4,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_02.png"
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"enabled": false,
									"props": {
										"scaleX": 10,
										"scaleY": 10,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "SandDecal",
							"y": 0.47708799999999996,
							"z": -0.7724239999999991,
							"scaleX": 100,
							"scaleY": 100,
							"scaleZ": 20,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"fadePower": 2,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 5,
										"vScale": 5,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/sand.png"
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 4,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_02.png"
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"enabled": false,
									"props": {
										"scaleX": 10,
										"scaleY": 10,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "Dissolve",
							"source": "shaders/Dissolve.hx",
							"props": {
								"progress": 0.5,
								"saturation": 0.8,
								"width": 1,
								"useAlpha": false
							},
							"children": [
								{
									"type": "curve",
									"name": "width",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.002919315890063612,
												"dt": -0.5003194834590932
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 2.8623563262856524
											}
										},
										{
											"time": 6.211917224665296,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Lightorange",
							"z": 1.1586360000000013,
							"scaleX": 600,
							"scaleY": 600,
							"scaleZ": 40,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"renderMode": "BeforeTonemapping",
							"centered": false,
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8549019607843137,
											0.11372549019607843,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1.8,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle2.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2350464952793597,
														"dt": -0.5697909948203433
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 1.7360265640076256
													}
												},
												{
													"time": 2.107422958699724,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5362274899014466,
														"dt": -0.03051465728228661
													},
													"nextHandle": {
														"dv": -1.0833333333333335,
														"dt": 0.06763066874190042
													}
												},
												{
													"time": 2.348619992178345,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -1.5001100955933375
													},
													"nextHandle": {
														"dv": -2.645156755157441e-16,
														"dt": 1.3315641396163127
													}
												}
											]
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "curve",
					"name": "visibility",
					"keys": [
						{
							"time": 0.006504895314574238,
							"value": 0,
							"mode": 2
						},
						{
							"time": 0.2,
							"value": 1,
							"mode": 2
						}
					]
				},
				{
					"type": "object",
					"name": "Smoke",
					"enabled": false,
					"x": -2.21,
					"z": -20,
					"children": [
						{
							"type": "emitter",
							"name": "Impact_Burst_Far_SandJet_L",
							"props": {
								"instScale_rand": 4,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.807843137254902,
									0.6901960784313725,
									0.6313725490196078,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 1.5,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 50,
								"lifeTime": 4.5,
								"emitRad1": 0.44,
								"randomColor2": [
									0.5372549019607843,
									0.4392156862745098,
									0.34901960784313724,
									1
								],
								"instSpeed_rand": [
									2,
									0,
									0
								],
								"emitRate": 20,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0,
									0
								],
								"warmUpTime": 1.5,
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitAngle": 199.09,
								"useRandomColor": true,
								"instSpeed": [
									4,
									0,
									0
								],
								"emitRad2": 0.8,
								"speedFactor": 0.8,
								"instRotation": [
									0,
									0,
									360
								]
							},
							"z": 0.85425,
							"scaleX": 120,
							"scaleY": 120,
							"scaleZ": 0.2,
							"rotationZ": -90,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 1,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.05,
													0.02
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Impact_Burst_Far_SandJet_L",
							"props": {
								"instScale_rand": 4,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.807843137254902,
									0.6901960784313725,
									0.6313725490196078,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 1.5,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 50,
								"lifeTime": 4.5,
								"emitRad1": 0.34,
								"randomColor2": [
									0.5372549019607843,
									0.4392156862745098,
									0.34901960784313724,
									1
								],
								"instSpeed_rand": [
									2,
									0,
									0
								],
								"emitRate": 20,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0,
									0
								],
								"warmUpTime": 1.5,
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitAngle": 199.09,
								"useRandomColor": true,
								"instSpeed": [
									4,
									0,
									0
								],
								"emitRad2": 0.8,
								"speedFactor": 0.8,
								"instRotation": [
									0,
									0,
									360
								]
							},
							"z": 0.85425,
							"scaleX": 120,
							"scaleY": 120,
							"scaleZ": 0.2,
							"rotationZ": 90,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 1,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.05,
													0.02
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "Chockwave",
					"z": -6.21,
					"scaleX": 260,
					"scaleY": 260,
					"scaleZ": 50,
					"rotationZ": 89.99999999999999,
					"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
					"normalMap": "Fx/DistortionMaps/sand-normal.png",
					"fadeStart": 1,
					"renderMode": "BeforeTonemapping",
					"centered": false,
					"children": [
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.30196078431372547,
									0.12941176470588234,
									0.06666666666666667
								]
							}
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.8,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							}
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"onDecal": true,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 0.9,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Alphas/T_BlurCircle.png"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0024763225697378433,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.9636656343058894,
											"value": 0.016666666666666663,
											"mode": 0,
											"prevHandle": {
												"dv": 0.9666666666666668,
												"dt": -1.6805888566374794
											},
											"nextHandle": {
												"dv": -1.3967076303323112,
												"dt": 2.4282323581210576
											}
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "Dissolve",
							"source": "shaders/Dissolve.hx",
							"props": {
								"progress": 0.8,
								"saturation": 1,
								"width": 0.8,
								"useAlpha": false
							}
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.5,
									"mode": 0,
									"prevHandle": {
										"dv": -0.16306480696656403,
										"dt": -0.27263401105123847
									},
									"nextHandle": {
										"dv": 0.56,
										"dt": 0.9448022482174779
									}
								},
								{
									"time": 2.9929245239593447,
									"value": 1.1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "SmokePuff",
					"props": {
						"emitType": "Burst",
						"burstParticleCount": 15,
						"simulationSpace": "World",
						"emitOrientation": "Normal",
						"emitSurface": true,
						"alignMode": "Screen",
						"frameCount": 1,
						"animationSpeed": 0,
						"instScale": 4,
						"instSpeed": [
							25,
							0,
							0
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"instRotation_rand": [
							0,
							0,
							90
						],
						"instScale_rand": 2,
						"instAcceleration_rand": [
							0,
							0,
							0
						],
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"maxCount": 15,
						"instOrbitSpeed_rand": [
							0,
							0,
							0
						],
						"instStretch_rand": [
							0,
							0,
							0
						],
						"lifeTimeRand": 0.5,
						"speedFactor": 0.3,
						"emitShape": "Cylinder",
						"instWorldAcceleration": [
							0,
							0,
							-30
						],
						"warmUpTime": 0.5,
						"instStretch": [
							0.5,
							1,
							1
						],
						"emitRad2": 0.53,
						"useRandomColor": true,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.7764705882352941,
							0.39215686274509803,
							0.20784313725490194,
							1
						],
						"instAcceleration": [
							5,
							0,
							0
						],
						"lifeTime": 1.5
					},
					"y": 1.24268,
					"z": 10,
					"scaleX": 80,
					"scaleY": 80,
					"scaleZ": 20,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"kind": 0,
							"args": [
								0
							],
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 20,
											"drawOrder": "120"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										1
									]
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/Spark01.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.016666666666666663,
													"mode": 0,
													"prevHandle": {
														"dv": -1.4816242607110048,
														"dt": -0.22897829483715526
													},
													"nextHandle": {
														"dv": 0.55,
														"dt": 0.085
													}
												},
												{
													"time": 0.265,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.08833333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.245
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499999999999996
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.33499999999999996
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											0.6862745098039216,
											0.19215686274509802
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 19.7,
										"power": 14.39
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "color.h",
											"keys": [
												{
													"time": 0.14500000000000002,
													"value": 0.4600405427222048,
													"mode": 2
												},
												{
													"time": 0.585,
													"value": 0.418879020478639,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "color.s",
											"keys": [
												{
													"time": 0.14500000000000002,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.585,
													"value": 0.6310679611650485,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "color.l",
											"keys": [
												{
													"time": 0.14500000000000002,
													"value": 0.6607843137254902,
													"mode": 2
												},
												{
													"time": 0.585,
													"value": 0.2019607843137255,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "instWorldAcceleration.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.49500000000000005,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.2588541666666666,
										"dt": -0.18000000000000005
									},
									"nextHandle": {
										"dv": 1.6004563866359256,
										"dt": 0.2288447361280001
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Distort_Chockwave",
					"props": {
						"instScale_rand": 0,
						"maxCount": 50,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.9098039215686274,
							0.615686274509804,
							1,
							0.8509803921568627
						],
						"emitRate": 10,
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							360
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
						"emitType": "Burst",
						"burstDelay": 0.3,
						"useRandomColor": true,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"warmUpTime": 1.1,
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instScale": 1.6,
						"instOffset": [
							0,
							0,
							30
						],
						"lifeTime": 3,
						"speedFactor": 0.5
					},
					"z": -13.24,
					"scaleX": 0.01,
					"scaleY": 0.01,
					"scaleZ": 0.01,
					"children": [
						{
							"type": "model",
							"name": "Ring",
							"source": "Fx/Meshes_Common/Ring_2.fbx",
							"z": -10,
							"scaleX": 2.5,
							"scaleY": 2.5,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Distortion",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"culling": "None",
											"depthWrite": "On",
											"drawOrder": "100",
											"emissive": 2.2
										}
									},
									"diffuseMap": "Fx/noise/causticTexture_03-2.png"
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/perlin1_normal.png",
										"intensity": 0.06
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.8043636363636364,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5969588995728569,
														"dt": -0.2623791435549754
													},
													"nextHandle": {
														"dv": -0.5969588995728569,
														"dt": 0.2623791435549754
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.08425454545454536,
														"dt": -0.2350000000000001
													},
													"nextHandle": {
														"dv": -0.08425454545454536,
														"dt": 0.2350000000000001
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 0.1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.01
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.7,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.5
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "width",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5350976805491343,
													"value": 0.9422222222222223,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.03695353771889259
													},
													"nextHandle": {
														"dv": -6.922428196740585e-16,
														"dt": 0.24478506621704163
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5,
														"dt": -0.18500000000000005
													},
													"nextHandle": {
														"dv": -0.8474237452673484,
														"dt": 0.3135467857489186
													}
												},
												{
													"time": 2.0100000000000002,
													"value": 0,
													"mode": 0
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keyMode": 1,
							"keys": [
								{
									"time": 0.0049999999999999975,
									"value": 0,
									"mode": 1,
									"prevHandle": {
										"dv": -0.5609260576910832,
										"dt": -0.42893757473558736
									},
									"nextHandle": {
										"dv": 0.10885961743662093,
										"dt": 0.055
									}
								},
								{
									"time": 1,
									"value": 0.6,
									"mode": 0,
									"prevHandle": {
										"dv": -0.025293869065672436,
										"dt": -0.4
									},
									"nextHandle": {
										"dv": 0.025293869065672436,
										"dt": 0.4
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"onDecal": false,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 2,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/Cyl05u_A.jpg"
							}
						}
					]
				},
				{
					"type": "emitter",
					"name": "Distort_Chockwave",
					"enabled": false,
					"props": {
						"instScale_rand": 0,
						"maxCount": 50,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.9098039215686274,
							0.615686274509804,
							1,
							0.8509803921568627
						],
						"emitRate": 10,
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							360
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
						"emitType": "Burst",
						"burstDelay": 0.3,
						"useRandomColor": true,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"warmUpTime": 2,
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instScale": 1.4,
						"instOffset": [
							0,
							0,
							30
						],
						"lifeTime": 3,
						"speedFactor": 0.5
					},
					"z": -5.45,
					"scaleX": 0.01,
					"scaleY": 0.01,
					"scaleZ": 0.01,
					"children": [
						{
							"type": "model",
							"name": "Ring",
							"source": "Fx/Meshes_Common/DiskFlat.fbx",
							"z": -20,
							"scaleX": 200,
							"scaleY": 200,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Distortion",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"culling": "None",
											"depthWrite": "On",
											"drawOrder": "-100",
											"emissive": 2.2
										}
									},
									"diffuseMap": "Fx/noise/causticTexture_03-2.png"
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
										"intensity": 0.1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.8043636363636364,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5969588995728569,
														"dt": -0.2623791435549754
													},
													"nextHandle": {
														"dv": -0.5969588995728569,
														"dt": 0.2623791435549754
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.08425454545454536,
														"dt": -0.2350000000000001
													},
													"nextHandle": {
														"dv": -0.08425454545454536,
														"dt": 0.2350000000000001
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.5,
										"scaleY": 0.5,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.01
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.7,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.5
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "width",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5350976805491343,
													"value": 0.9422222222222223,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.03695353771889259
													},
													"nextHandle": {
														"dv": -6.922428196740585e-16,
														"dt": 0.24478506621704163
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5,
														"dt": -0.18500000000000005
													},
													"nextHandle": {
														"dv": -0.8474237452673484,
														"dt": 0.3135467857489186
													}
												},
												{
													"time": 2.0100000000000002,
													"value": 0,
													"mode": 0
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl05u_A.jpg"
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keyMode": 1,
							"keys": [
								{
									"time": 0.0049999999999999975,
									"value": 0,
									"mode": 1,
									"prevHandle": {
										"dv": -0.5609260576910832,
										"dt": -0.42893757473558736
									},
									"nextHandle": {
										"dv": 0.10885961743662093,
										"dt": 0.055
									}
								},
								{
									"time": 1,
									"value": 0.6,
									"mode": 0,
									"prevHandle": {
										"dv": -0.025293869065672436,
										"dt": -0.4
									},
									"nextHandle": {
										"dv": 0.025293869065672436,
										"dt": 0.4
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.2617851192419607,
										"dt": -0.1969596492895839
									},
									"nextHandle": {
										"dv": 0.2617851192419607,
										"dt": 0.1969596492895839
									}
								},
								{
									"time": 3.870691213563,
									"value": 2,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -3.3272724800873203
									},
									"nextHandle": {
										"dv": 0,
										"dt": 3.3272724800873203
									}
								}
							]
						}
					]
				}
			]
		},
		{
			"type": "polygon",
			"name": "polygon",
			"enabled": false,
			"scaleX": 10,
			"scaleY": 10,
			"scaleZ": 10,
			"kind": 0,
			"args": [
				0
			]
		},
		{
			"type": "polygon",
			"name": "Floor",
			"enabled": false,
			"editorOnly": true,
			"locked": true,
			"scaleX": 50,
			"scaleY": 50,
			"scaleZ": 50,
			"kind": 0,
			"args": [
				0
			],
			"children": [
				{
					"type": "material",
					"name": "material",
					"props": {
						"PBR": {
							"mode": "PBR",
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		}
	]
}