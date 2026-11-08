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
								"intensity": 4,
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
									"name": "width",
									"keys": [
										{
											"time": -0.011513232290744774,
											"value": 1,
											"mode": 2
										},
										{
											"time": 5.502417732638351,
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
											"time": 0,
											"value": 0,
											"mode": 1
										},
										{
											"time": 0.46553792118640586,
											"value": 0.5109661797682439,
											"mode": 1
										},
										{
											"time": 1.8551964720893963,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0.09621691927313814,
												"dt": 1.999996230602265
											}
										},
										{
											"time": 11.291834266100928,
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
								"range": 0.9,
								"power": 1.52
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
											"time": 6.969732452797817,
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
											"time": 6.969732452797817,
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
											"time": 6.969732452797817,
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
											"time": 3.9898190359430528,
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
											"time": 4.022921685207528,
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
											"time": 6.969732452797817,
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
											"time": 6.969732452797817,
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
											"time": 6.969732452797817,
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
							}
						},
						{
							"type": "curve",
							"name": "scale.z",
							"keys": [
								{
									"time": -0.02236018046736718,
									"value": 1.0666666666666667,
									"mode": 2
								},
								{
									"time": 7.114659244559937,
									"value": 1.3,
									"mode": 2
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
											"prevHandle": {
												"dv": -0.1300795710294618,
												"dt": -0.5955574512337353
											},
											"nextHandle": {
												"dv": 0.21437733258120717,
												"dt": 0.9849935879711937
											}
										},
										{
											"time": 3.151273849707296,
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
											"time": 4.377033566594262,
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
								"intensity": 8,
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
									"name": "width",
									"keys": [
										{
											"time": 0.0034905516751835286,
											"value": 1,
											"mode": 2
										},
										{
											"time": 6.277056305469526,
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
											"time": -0.0031329162557812915,
											"value": 0.0033203124999993117,
											"mode": 1
										},
										{
											"time": 0.6061391724190619,
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
											"time": 2.199620019722498,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 3.2784271811103713
											}
										},
										{
											"time": 11.90110635477577,
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
											"time": 1.2154112610939052,
											"value": 0.21601384464145068,
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
											"time": 7.436429679456479,
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
											"time": 1.2154112610939052,
											"value": 1,
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
											"time": 7.436429679456479,
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
											"time": 1.2154112610939052,
											"value": 0.5627450980392157,
											"prevHandle": {
												"dv": 0.16616171387808693,
												"dt": -0.44197183705192805
											},
											"nextHandle": {
												"dv": -0.6655882352941177,
												"dt": 1.7703913146257404
											}
										},
										{
											"time": 7.436429679456479,
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
											"prevHandle": {
												"dv": 0.0068259662816920605,
												"dt": -0.7407896655544913
											},
											"nextHandle": {
												"dv": -0.01091898043639955,
												"dt": 1.1701474990594654
											}
										},
										{
											"time": 3.96595105849569,
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
											"time": 4.377033566594262,
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
											"time": 1.1216770936054676,
											"value": 0,
											"mode": 2
										},
										{
											"time": 6.592243566088388,
											"value": 0.3351032163829113,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "colorB.s",
									"keys": [
										{
											"time": 1.1216770936054676,
											"value": 0,
											"mode": 2
										},
										{
											"time": 6.592243566088388,
											"value": 0.2032520325203252,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "colorB.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 1.1216770936054676,
											"value": 1,
											"prevHandle": {
												"dv": 0.008435147655392909,
												"dt": -0.4990842483155954
											},
											"nextHandle": {
												"dv": -0.020653594771241846,
												"dt": 1.2071782812771195
											}
										},
										{
											"time": 6.592243566088388,
											"value": 0.24117647058823527,
											"prevHandle": {
												"dv": 0.027581699346405253,
												"dt": -3.999324479506662
											},
											"nextHandle": {
												"dv": -0.01563708888619763,
												"dt": 2.0186249436141535
											}
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
									"prevHandle": {
										"dv": -2.3153539310386355,
										"dt": -0.49779611096765236
									},
									"nextHandle": {
										"dv": 9.26376823646872,
										"dt": 1.998195124268532
									}
								},
								{
									"time": 7.186852522346527,
									"value": 20,
									"mode": 2
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
									"prevHandle": {
										"dv": 0.0002863006120080425,
										"dt": -0.499997837384273
									},
									"nextHandle": {
										"dv": -0.0022871880895058982,
										"dt": 3.067516174316407
									}
								},
								{
									"time": 5.712307652899906,
									"value": 1.05,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Nuke_Around_Smoke",
					"source": "Fx/Meshes_Common/Torus.fbx",
					"z": -20.02729,
					"scaleX": 50,
					"scaleY": 50,
					"scaleZ": 50,
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
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.7536687159094531,
									"prevHandle": {
										"dv": -0.08988586834231747,
										"dt": -0.5969189315700426
									},
									"nextHandle": {
										"dv": 0.3063455200195313,
										"dt": 2.034395883064939
									}
								},
								{
									"time": 5.794945848730431,
									"value": 1.2041768335852345,
									"mode": 2
								}
							]
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
								"intensity": 8,
								"scrollSpeed": [
									-0.06,
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
								"shiftSpeedX": -0.05,
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
									"keys": [
										{
											"time": 0.0034905516751835286,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.8132604995787265,
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
											"time": 1.4966137635592174,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0.15000000000000002,
												"dt": 3.329011445015354
											}
										},
										{
											"time": 9.37028383258796,
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
											"time": 5.8325389483827434,
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
											"time": 5.8325389483827434,
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
											"time": 5.8325389483827434,
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
											"time": 2.2361419305992074,
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
											"time": 2.269244579863683,
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
											"time": 5.749712556608003,
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
											"time": 5.749712556608003,
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
											"time": 5.749712556608003,
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
											"prevHandle": {
												"dv": -0.1300795710294618,
												"dt": -0.5955574512337353
											},
											"nextHandle": {
												"dv": 0.21437733258120717,
												"dt": 0.9849935879711937
											}
										},
										{
											"time": 2.7069044630954444,
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
											"time": 4.377033566594262,
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
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.5,
									"prevHandle": {
										"dv": -0.09482645808255719,
										"dt": -0.5959240607115203
									},
									"nextHandle": {
										"dv": 0.11566384383369122,
										"dt": 0.7325642767548562
									}
								},
								{
									"time": 5.714835640537815,
									"value": 0.7,
									"mode": 2
								}
							]
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
								"intensity": 6,
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
									"keys": [
										{
											"time": 0.0034905516751835286,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.354469501900647,
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
											"time": 3.2306958620953097,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 3.2784271811103713
											}
										},
										{
											"time": 9.779783866667414,
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
											"time": 5.729791681561276,
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
											"time": 5.729791681561276,
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
											"time": 5.729791681561276,
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
											"time": 3.181416785356652,
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
											"time": 3.2145194346211277,
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
											"time": 5.646965289786536,
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
											"time": 5.646965289786536,
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
											"time": 5.646965289786536,
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
						}
					]
				},
				{
					"type": "model",
					"name": "Nuke_Around_Smoke",
					"source": "Fx/Meshes_Common/Torus.fbx",
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
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.5,
									"prevHandle": {
										"dv": -0.09482645808255719,
										"dt": -0.5959240607115203
									},
									"nextHandle": {
										"dv": 0.11566384383369122,
										"dt": 0.7325642767548562
									}
								},
								{
									"time": 5.281440846024213,
									"value": 0.7,
									"mode": 2
								}
							]
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
								"intensity": 6,
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
									"keys": [
										{
											"time": 0.0034905516751835286,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.9210747073870458,
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
											"time": 2.996360443374216,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 3.2784271811103713
											}
										},
										{
											"time": 8.409644924614204,
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
											"time": 5.296396887047675,
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
											"time": 5.296396887047675,
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
											"time": 5.296396887047675,
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
											"time": 1.679450415899848,
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
											"time": 1.7125530651643235,
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
											"time": 5.2135704952729345,
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
											"time": 5.2135704952729345,
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
											"time": 5.2135704952729345,
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
						}
					]
				},
				{
					"type": "model",
					"name": "Ring_2",
					"source": "Fx/Meshes_Common/Ring_4.fbx",
					"z": 10.65163,
					"scaleX": 75,
					"scaleY": 75,
					"scaleZ": 15,
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
											"time": 9.98438824104321,
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
											"time": 9.98181744026196,
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
											"time": 1.942811669539461,
											"value": 1,
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
											"time": 9.98181744026196,
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
							"keys": [
								{
									"time": -1.7763568394002505e-15,
									"value": 1,
									"mode": 2
								},
								{
									"time": 9.98181744026196,
									"value": 2,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "----------------------------MeshFloor",
					"z": -12.92672,
					"scaleX": 4,
					"scaleY": 4,
					"scaleZ": 2,
					"children": [
						{
							"type": "model",
							"name": "FX_Mesh_Disc_Wave",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
							"x": -0.25,
							"y": 0.23,
							"z": -0.88,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 90,
							"rotationX": -1.3,
							"rotationY": -0.9,
							"rotationZ": 81.8,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "DecalPass",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"parallax": 0,
											"alphaKill": false,
											"textureWrap": true,
											"culling": "None"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"normalMap": "Fx/DistortionMaps/water-normal.png",
									"materialName": "any",
									"mainPassName": "decal",
									"color": [
										0.6509803921568628,
										0.6509803921568628,
										0.6509803921568628,
										0.4784313725490196
									]
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": true,
										"replace": false,
										"alpha": 1.7,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/vGrad.png",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 0.9900542813725819,
													"value": 1,
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
										"range": 1,
										"power": 0.5
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "SandBlend",
									"source": "shaders/SandBlend.hx",
									"props": {
										"colorMask": "Fx/Alphas/sand.png"
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
										"progress": 0.6,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/noise/T_Noise_Grunge_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.2
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
											"keyMode": 3,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": -0.5897121296564614,
														"dt": -0.4972240709576539
													},
													"nextHandle": {
														"dv": 0.5897121296564614,
														"dt": 0.4972240709576539
													}
												},
												{
													"time": 0.8219781345716924,
													"value": 1,
													"mode": 3
												},
												{
													"time": 2.7947256575437547,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -2
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3344527711758432
													}
												},
												{
													"time": 5.630550221816093,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3344527711758432
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3344527711758432
													}
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
										"sandBlend": 0.36,
										"sandColorSet": false,
										"envBlend": 0.67,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": false,
										"Y": false,
										"Z": true,
										"tex": "Fx/DistortionMaps/waveNormal02.jpg",
										"intensity": 2,
										"scrollSpeed": [
											-0.07,
											0
										],
										"smoothEdge": 1,
										"texScaleX": 0,
										"texScaleY": 0
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"enabled": false,
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/water-normal.png",
									"topSpan": 0,
									"dirSpan": 0,
									"sandBlend": 0.3,
									"envBlend": 0.5
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 2.5,
										"scaleY": 0.5,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.1
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "scale.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.03333333333333333,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 1.0163239784814795,
											"value": 0.9889465332031244,
											"mode": 2
										},
										{
											"time": 8.483763394872659,
											"value": 0.9889465332031244,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 9.982446090011585,
											"value": 1.4039465332031238,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5374966395597701
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5576157120804043
											}
										},
										{
											"time": 11.482556185604922,
											"value": 0.7731522685090703,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5576157120804043
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5576157120804043
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.x",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 1.0163239784814795,
											"value": 1,
											"mode": 2
										},
										{
											"time": 9,
											"value": 0.9788818359375001,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 11.991979671475278,
											"value": 1.2583333333333333,
											"prevHandle": {
												"dv": 0.012817382812500222,
												"dt": -0.575384694200185
											},
											"nextHandle": {
												"dv": -0.012817382812500222,
												"dt": 0.575384694200185
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.y",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 1.0163239784814795,
											"value": 1,
											"mode": 2
										},
										{
											"time": 9,
											"value": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 11.971430218110987,
											"value": 1.2933333333333332,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5374966395597701
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5576157120804043
											}
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 1,
								"ATTENUATE": false,
								"emissiveMap": "Fx/Gradients/ColorSand.png"
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Decal",
					"y": -0.47709,
					"z": -19.48494,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
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
													"prevHandle": {
														"dv": 0.42278261892829494,
														"dt": -0.4078257586516667
													},
													"nextHandle": {
														"dv": -1.0166666666666666,
														"dt": 0.9806998586654666
													}
												},
												{
													"time": 4.960516726970674,
													"value": 0,
													"mode": 2
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
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Sanddecal_02",
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
											"prevHandle": {
												"dv": 2.75775302443627e-17,
												"dt": -0.5003324308481993
											},
											"nextHandle": {
												"dv": 0,
												"dt": 6.076705644901984
											}
										},
										{
											"time": 11.705384541985435,
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
													"prevHandle": {
														"dv": 0.12482084276514861,
														"dt": -0.6019200204850107
													},
													"nextHandle": {
														"dv": -0.41666666666666663,
														"dt": 2.0140784268133585
													}
												},
												{
													"time": 5.941307291989218,
													"value": 0,
													"mode": 2
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
					"x": -2.21,
					"z": -15,
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
								"lifeTimeRand": 3,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 12,
								"lifeTime": 10,
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
								"maxCount": 100,
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
								"burstParticleCount": 80,
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
								],
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
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
												"range": 20,
												"power": 5
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
								"lifeTimeRand": 3,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 12,
								"lifeTime": 10,
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
								"maxCount": 100,
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
								"burstParticleCount": 80,
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
								],
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
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
												"range": 20,
												"power": 5
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
							"enabled": false,
							"props": {
								"instScale_rand": 4,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 15,
								"lifeTime": 10,
								"emitRad1": 0.6,
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
								"maxCount": 100,
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
								"warmUpTime": 0.5,
								"emitType": "Burst",
								"burstParticleCount": 35,
								"emitAngle": 200,
								"useRandomColor": true,
								"instSpeed": [
									4,
									0,
									0
								],
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 0.2,
							"rotationZ": -89.99999999999999,
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
												"progress": 0.58,
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
													0,
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
												"range": 30,
												"power": 10
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
							"name": "Impact_Burst_Far_SandJet_R",
							"enabled": false,
							"props": {
								"instScale_rand": 4,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 15,
								"lifeTime": 10,
								"emitRad1": 0.6,
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
								"maxCount": 100,
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
								"warmUpTime": 0.5,
								"emitType": "Burst",
								"burstParticleCount": 35,
								"emitAngle": 200,
								"useRandomColor": true,
								"instSpeed": [
									4,
									0,
									0
								],
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 0.2,
							"rotationZ": 89.99999999999999,
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
												"progress": 0.58,
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
													0,
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
												"range": 30,
												"power": 10
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
											"time": 7.969237238385571,
											"value": 0.016666666666666663,
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
									"prevHandle": {
										"dv": -0.07859202526293557,
										"dt": -0.49908424831559534
									},
									"nextHandle": {
										"dv": 0.3333333333333335,
										"dt": 2.119248546578776
									}
								},
								{
									"time": 8.020552928664578,
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
						"lifeTime": 2,
						"emitType": "Burst",
						"burstParticleCount": 45,
						"simulationSpace": "World",
						"emitOrientation": "Normal",
						"emitSurface": true,
						"alignMode": "Screen",
						"frameCount": 1,
						"animationSpeed": 0,
						"instScale": 1.3,
						"instSpeed": [
							3,
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
						"instScale_rand": 0.7,
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
						"maxCount": 45,
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
						"lifeTimeRand": 1,
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
						"randomGradient": {
							"stops": [
								{
									"position": 0,
									"color": -16777216
								},
								{
									"position": 1,
									"color": -1
								}
							],
							"resolution": 64,
							"isVertical": false,
							"interpolation": "Linear",
							"colorMode": 0
						}
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
						"instScale": 1.8,
						"instOffset": [
							0,
							0,
							30
						],
						"lifeTime": 6,
						"speedFactor": 0.5,
						"randomGradient": {
							"stops": [
								{
									"position": 0,
									"color": -16777216
								},
								{
									"position": 1,
									"color": -1
								}
							],
							"resolution": 64,
							"isVertical": false,
							"interpolation": "Linear",
							"colorMode": 0
						}
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
													"value": 0
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
						"instScale": 1.8,
						"instOffset": [
							0,
							0,
							30
						],
						"lifeTime": 6,
						"speedFactor": 0.5,
						"randomGradient": {
							"stops": [
								{
									"position": 0,
									"color": -16777216
								},
								{
									"position": 1,
									"color": -1
								}
							],
							"resolution": 64,
							"isVertical": false,
							"interpolation": "Linear",
							"colorMode": 0
						}
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
													"value": 0
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
						}
					]
				}
			]
		}
	]
}