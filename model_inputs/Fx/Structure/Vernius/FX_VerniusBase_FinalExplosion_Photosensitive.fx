{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
			"z": 0.25,
			"scaleX": 200,
			"scaleY": 200,
			"scaleZ": 140,
			"rotationZ": 180,
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
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 1.5,
			"scaleY": 1.5,
			"scaleZ": 1.5,
			"children": [
				{
					"type": "object",
					"name": "FinalExplosion",
					"x": -0.47166571428571424,
					"y": 0.20587928571428565,
					"z": 1.6992107142857145,
					"children": [
						{
							"type": "model",
							"name": "VerniusBase",
							"source": "Structure/Base/Vernius/VerniusBase.fbx",
							"editorOnly": true,
							"locked": true,
							"x": 0.4716657142857142,
							"y": -0.20587928571428557,
							"z": -1.6992107142857145
						},
						{
							"type": "emitter",
							"name": "emitter_SlideVertical",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"lifeTime": 0.4,
								"lifeTimeRand": 0.05,
								"maxCount": 40,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationLoop": false,
								"instScale": 2.6,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_03.png",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 1,
								"animationBlendBetweenFrames": false,
								"emitRate": 20,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitShape": "Cylinder",
								"emitAngle": 360,
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
							"x": -1.2188442857142858,
							"y": -0.2058792857142856,
							"z": -1.2,
							"scaleX": 8.399999999999999,
							"scaleY": 8.399999999999999,
							"scaleZ": 1.1759999999999997,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
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
													"culling": "Back",
													"colorMask": 255,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/clouds3.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 0.24726183384056316,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3176167024895698,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3845396263264298,
															"value": 1
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -18584
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "position.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.1,
											"value": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6666666666666666
											}
										},
										{
											"time": 2,
											"value": 20.8,
											"prevHandle": {
												"dv": 0.007719983552632925,
												"dt": -0.43566132563694193
											},
											"nextHandle": {
												"dv": -3.6679611641141805e-15,
												"dt": 0.4349597512655168
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1.5,
											"prevHandle": {
												"dv": -0.005283080514001015,
												"dt": -0.501902278083384
											},
											"nextHandle": {
												"dv": 0.009336519767737972,
												"dt": 1.3133880651343448
											}
										},
										{
											"time": 2,
											"value": 0.7,
											"prevHandle": {
												"dv": -0.00734484572083538,
												"dt": -0.8697258596569748
											},
											"nextHandle": {
												"dv": 0.0043858030696355705,
												"dt": 0.4999911425256196
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 0.49,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.8160688160046663,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.5,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.99718348995136,
											"value": 0,
											"mode": 2
										},
										{
											"time": 4.25,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.5,
											"value": 0,
											"mode": 2
										},
										{
											"time": 4.710248886399969,
											"value": 0.7149213038453268,
											"mode": 2
										},
										{
											"time": 4.971371425944531,
											"value": 0,
											"mode": 2
										},
										{
											"time": 5.5840050764144635,
											"value": 0,
											"mode": 2
										},
										{
											"time": 6,
											"value": 0.95,
											"mode": 2
										},
										{
											"time": 6.4,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter_Horizontal",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"lifeTime": 0.2,
								"lifeTimeRand": 0.05,
								"maxCount": 80,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationLoop": false,
								"instScale": 2.6,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_03.png",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 1.5,
								"animationBlendBetweenFrames": false,
								"emitRate": 40,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitShape": "Cylinder",
								"emitAngle": 360,
								"emitSurface": true,
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
							"x": -1.2188442857142858,
							"y": -0.2058792857142856,
							"z": 1.1,
							"scaleX": 37,
							"scaleY": 37,
							"scaleZ": 2,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
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
													"culling": "Back",
													"colorMask": 255,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/clouds3.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 0.24726183384056316,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3176167024895698,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3845396263264298,
															"value": 1
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -18584
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 1.6320861618830085,
											"value": 0.5,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.17106104310263878
											}
										},
										{
											"time": 2.1452692911909232,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 0,
									"keys": [
										{
											"time": 1.612804847130408,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.6888521910792555,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.9594045371491453,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4,
											"value": 0,
											"prevHandle": {
												"dv": 0.011279140199933535,
												"dt": -0.8806312526513014
											},
											"nextHandle": {
												"dv": -0.0016723823963368273,
												"dt": 0.11300562798776972
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter_ElecticiteFin",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"lifeTime": 0.4,
								"lifeTimeRand": 0.05,
								"maxCount": 40,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationLoop": false,
								"instScale": 2.8,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_03.png",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 1.2,
								"animationBlendBetweenFrames": false,
								"emitRate": 20,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitShape": "Cylinder",
								"emitAngle": 360,
								"emitSurface": true,
								"seedGroup": 1,
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
							"x": -1.21884,
							"y": -0.20588,
							"z": 6.51918,
							"scaleX": 6,
							"scaleY": 6,
							"scaleZ": 15,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
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
													"culling": "Back",
													"colorMask": 255,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/clouds3.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 0.24726183384056316,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3176167024895698,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3845396263264298,
															"value": 1
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -18584
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 1.6771388581366429,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.97055363760085,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.181141389028683,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.867685110865627,
											"value": 0,
											"mode": 2
										},
										{
											"time": 4.120501620914263,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.370501620914263,
											"value": 0,
											"mode": 2
										},
										{
											"time": 4.5807505073142325,
											"value": 0.7149213038453268,
											"mode": 2
										},
										{
											"time": 4.841873046858794,
											"value": 0,
											"mode": 2
										},
										{
											"time": 5.454506697328727,
											"value": 0,
											"mode": 2
										},
										{
											"time": 5.870501620914263,
											"value": 0.95,
											"mode": 2
										},
										{
											"time": 6.270501620914263,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "TowerExplosion",
							"x": -1.383444285714286,
							"y": -0.2058792857142856,
							"z": -1.6992107142857145,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"children": [
								{
									"type": "model",
									"name": "Nuke_Pied_Smoke",
									"source": "Fx/Meshes_Common/Viernus_CentralTower.fbx",
									"enabled": false,
									"z": -11.28277,
									"scaleX": 1.4,
									"scaleY": 1.4,
									"scaleZ": 1.61,
									"rotationZ": 8.179999999999996,
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
													"depthWrite": "On",
													"emissive": 3
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
															"time": 1.6356748596991584,
															"value": 0.0033203124999993117,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.10000598728929656
															}
														},
														{
															"time": 1.9418077759549397,
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
															"time": 2.0921425349025444,
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
															"time": 3.843581594583237,
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
												"range": 4,
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
												"bias": 0.44,
												"scale": 0.6,
												"power": 0.64,
												"color": [
													1,
													0.4823529411764706,
													0.2
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
															"time": 1.6424007895989825,
															"value": 0.21601384464145068,
															"prevHandle": {
																"dv": 0.04365518972487589,
																"dt": -0.49323382197499155
															},
															"nextHandle": {
																"dv": -0.13233724755599205,
																"dt": 1.5126587441420907
															}
														},
														{
															"time": 3.1514665200970287,
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
															"time": 1.6424007895989825,
															"value": 1,
															"prevHandle": {
																"dv": 0.16219200841750742,
																"dt": -0.49087499737344853
															},
															"nextHandle": {
																"dv": -0.47709186595877573,
																"dt": 1.469542580413575
															}
														},
														{
															"time": 3.1514665200970287,
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
															"time": 1.6424007895989825,
															"value": 0.5627450980392157,
															"prevHandle": {
																"dv": 0.07888062231620774,
																"dt": -0.49239781770985935
															},
															"nextHandle": {
																"dv": -0.23036816248158742,
																"dt": 1.4264264166850593
															}
														},
														{
															"time": 3.1514665200970287,
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
															"time": 1.6388077759549398,
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
															"time": 3.6388077759549375,
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
															"time": 1.6388077759549398,
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
															"time": 3.7388077759549376,
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
															"time": 1.6388077759549398,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.4557304728846265,
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
															"time": 1.6388077759549398,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.4557304728846265,
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
															"time": 1.6388077759549398,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.4557304728846265,
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
												"alpha": 2,
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
															"time": 1.6388077759549398,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.644302557907114,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													2,
													2
												],
												"alpha": 1,
												"MULTIPLY": false,
												"color": [
													0.996078431372549,
													0.5098039215686274,
													0.3529411764705882,
													1
												],
												"mask": "Fx/noise/causticTexture_02.png",
												"UVOffset": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.6388077759549398,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.15733330461943,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5061751762214973
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.5061751762214973
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_03.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.2
												]
											}
										}
									]
								},
								{
									"type": "emitter",
									"name": "FireTube_Big",
									"enabled": false,
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 4,
										"animationSpeed": 0,
										"instStretch": [
											0.97,
											0.97,
											2.2
										],
										"emitType": "Burst",
										"instStretch_rand": [
											0,
											0,
											0.05
										],
										"instScale": 45,
										"instScale_rand": 1,
										"seedGroup": 4,
										"useRandomColor": true,
										"randomColor1": [
											0.8235294117647058,
											0.7686274509803921,
											0.7176470588235294,
											1
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"maxCount": 1,
										"randomColor2": [
											0.9764705882352941,
											0.9647058823529412,
											0.9529411764705882,
											1
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png",
										"lifeTime": 2.5,
										"warmUpTime": -1.7,
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
									"z": 0.78971,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Cylinder",
											"source": "Fx/Meshes_Common/FireTube_tapered03.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 90,
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
															"emissive": 27,
															"drawOrder": "-80",
															"depthWrite": "Off"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.7
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
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.5449999999999999
																	},
																	"nextHandle": {
																		"dv": 0.010192021509306938,
																		"dt": 0.33327910335433686
																	}
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
														"power": 0.8
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
															0.7058823529411764,
															0.3176470588235294,
															0.19607843137254902
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
														"progress": 0.66,
														"saturation": 0.25,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Noise_Wave_02.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.025
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
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.942491792923777,
																		"dt": -0.4808822806105675
																	},
																	"nextHandle": {
																		"dv": -1.1,
																		"dt": 0.18019275266053364
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.49096045782441833
																	},
																	"nextHandle": {
																		"dv": -7.865461723911139e-16,
																		"dt": 0.4224127050774995
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 0.75,
														"texture": "Fx/Gradients/vGrad_uneaven.png",
														"uvShift": [
															0.5,
															0.1
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															1,
															0.45098039215686275,
															0.2901960784313725
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"prevHandle": {
														"dv": -0.7525956070201336,
														"dt": -0.10924774940614855
													},
													"nextHandle": {
														"dv": 0.5166666666666666,
														"dt": 0.075
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.841171875
													},
													"nextHandle": {
														"dv": -1.0751357358769627e-16,
														"dt": 0.33333333333333326
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
										"amount": 0.725,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
								},
								{
									"type": "emitter",
									"name": "emitter_flaremult",
									"enabled": false,
									"props": {
										"lifeTime": 0.1,
										"lifeTimeRand": 0.01,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"emitType": "Burst",
										"burstDelay": 0.08,
										"instScale": 10,
										"instStretch": [
											7,
											1,
											2
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											2,
											0,
											0
										],
										"instScale_rand": 3,
										"warmUpTime": -1.5,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"emitAngle": 109.09,
										"burstCount": 5,
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
									"x": 2.3188874999999998,
									"y": 9.251858538542972e-17,
									"z": 11.7913,
									"scaleX": 0.125,
									"scaleY": 0.125,
									"scaleZ": 0.125,
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
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 15
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.4,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare06_512.png"
													}
												},
												{
													"type": "shader",
													"name": "ParticleColorRandom",
													"source": "hrt.shader.ParticleColorRandom",
													"props": {
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -100698849
																	},
																	{
																		"position": 1,
																		"color": -9088810
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Cubic",
																"colorMode": 0
															}
														}
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												}
											]
										}
									]
								},
								{
									"type": "subFX",
									"name": "FX_VerniusBase_TowerExplosions",
									"source": "Fx/Structure/Vernius/FX_VerniusBase_TowerExplosions_Photosensitive.fx",
									"x": 2.318892857142857,
									"y": -8.928571428960345e-7,
									"z": 0.6250008928571433,
									"scaleX": 0.7499999999999999,
									"scaleY": 0.7499999999999999,
									"scaleZ": 0.7499999999999998,
									"rotationZ": -58.60000000000001,
									"time": 0.85
								},
								{
									"type": "object",
									"name": "Directional Explosion",
									"x": 0.5574124999999999,
									"z": 0.5762500000000004,
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "emitter",
											"name": "Fireball_Screen",
											"props": {
												"instScale_rand": 3,
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
													0.9215686274509803,
													0.9215686274509803,
													0.9215686274509803,
													0.8509803921568627
												],
												"emitRate": 1,
												"instRotation_rand": [
													0,
													0,
													0
												],
												"frameCount": 32,
												"frameDivisionX": 8,
												"frameDivisionY": 8,
												"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
												"instScale": 9,
												"emitType": "Burst",
												"burstDelay": 0.15,
												"instStretch_rand": [
													0,
													0,
													0
												],
												"burstParticleCount": 10,
												"emitShape": "Cone",
												"emitRad1": 0.83,
												"emitSurface": true,
												"lifeTimeRand": 0.3,
												"alignMode": "Screen",
												"emitAngle": 35,
												"instSpeed": [
													4.5,
													0,
													0
												],
												"instWorldSpeed_rand": [
													0,
													0,
													0
												],
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instSpeed_rand": [
													1,
													0,
													0
												],
												"instAcceleration": [
													-4,
													0,
													0
												],
												"instAcceleration_rand": [
													1,
													0,
													0
												],
												"warmUpTime": -1.45,
												"lifeTime": 1.25,
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
											"scaleX": 3,
											"scaleY": 3,
											"scaleZ": 3.0000000000000004,
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
																	"culling": "Back",
																	"depthTest": "Less",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": true,
																	"parallax": 0,
																	"textureWrap": true,
																	"emissive": 1
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Structure/Smoke/white.png"
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 1
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": -0.0050000000000000044,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.039999999999999994,
																			"value": 1,
																			"prevHandle": {
																				"dv": 0.002592191728735997,
																				"dt": -0.03499458833793611
																			},
																			"nextHandle": {
																				"dv": -0.06666666666666665,
																				"dt": 0.8999999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
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
																	0.45098039215686275,
																	0.2901960784313725
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
																"progress": 0.5,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Noise_Wave_02.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
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
																	"name": "progress",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"prevHandle": {
																				"dv": 0.4501476276915423,
																				"dt": -0.6144515117989549
																			},
																			"nextHandle": {
																				"dv": -0.33333333333333337,
																				"dt": 0.455
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.2833333333333333,
																				"dt": -0.29500000000000004
																			},
																			"nextHandle": {
																				"dv": -0.40250763363430087,
																				"dt": 0.41908147737218393
																			}
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.012707392165911546,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.05166666666666666
															}
														},
														{
															"time": 0.05499999999999999,
															"value": -0.509348731270885,
															"prevHandle": {
																"dv": -0.6178478332448459,
																"dt": -0.024810868515554432
															},
															"nextHandle": {
																"dv": 0.8715807006116155,
																"dt": 0.03500000000000003
															}
														},
														{
															"time": 0.09499999999999999,
															"value": 0.3300049349567332,
															"prevHandle": {
																"dv": -0.09186223587130012,
																"dt": -0.05987522403665296
															},
															"nextHandle": {
																"dv": 0.636704555180494,
																"dt": 0.4140681559183458
															}
														},
														{
															"time": 1,
															"value": 1.01469963255798,
															"prevHandle": {
																"dv": -0.1819155871944269,
																"dt": -0.38
															},
															"nextHandle": {
																"dv": 0.12673911289324527,
																"dt": 0.2647429153388605
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "Fireball_Screen",
											"props": {
												"instScale_rand": 2,
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
													0.9215686274509803,
													0.9215686274509803,
													0.9215686274509803,
													0.8509803921568627
												],
												"emitRate": 1,
												"instRotation_rand": [
													0,
													0,
													0
												],
												"frameCount": 32,
												"frameDivisionX": 8,
												"frameDivisionY": 8,
												"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
												"instScale": 5,
												"emitType": "Burst",
												"burstDelay": 0.15,
												"instStretch_rand": [
													0,
													0,
													0
												],
												"burstParticleCount": 10,
												"emitShape": "Cone",
												"emitRad1": 0.83,
												"emitSurface": true,
												"lifeTimeRand": 0.3,
												"alignMode": "Screen",
												"emitAngle": 25,
												"instSpeed": [
													5,
													0,
													0
												],
												"instWorldSpeed_rand": [
													0,
													0,
													0
												],
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instSpeed_rand": [
													2,
													0,
													0
												],
												"instAcceleration": [
													-4,
													0,
													0
												],
												"instAcceleration_rand": [
													1,
													0,
													0
												],
												"warmUpTime": -1.5,
												"lifeTime": 1.25,
												"seedGroup": 1,
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
											"x": 2.61617,
											"scaleX": 3,
											"scaleY": 3,
											"scaleZ": 3.0000000000000004,
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
																	"culling": "Back",
																	"depthTest": "Less",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": true,
																	"parallax": 0,
																	"textureWrap": true,
																	"emissive": 1
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Structure/Smoke/white.png"
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 1
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": -0.0050000000000000044,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.039999999999999994,
																			"value": 1,
																			"prevHandle": {
																				"dv": 0.002592191728735997,
																				"dt": -0.03499458833793611
																			},
																			"nextHandle": {
																				"dv": -0.06666666666666665,
																				"dt": 0.8999999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
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
																	0.45098039215686275,
																	0.2901960784313725
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
																"progress": 0.5,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Noise_Wave_02.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
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
																	"name": "progress",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"prevHandle": {
																				"dv": 0.4501476276915423,
																				"dt": -0.6144515117989549
																			},
																			"nextHandle": {
																				"dv": -0.33333333333333337,
																				"dt": 0.455
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.2833333333333333,
																				"dt": -0.29500000000000004
																			},
																			"nextHandle": {
																				"dv": -0.40250763363430087,
																				"dt": 0.41908147737218393
																			}
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.012707392165911546,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.05166666666666666
															}
														},
														{
															"time": 0.05499999999999999,
															"value": -0.509348731270885,
															"prevHandle": {
																"dv": -0.6178478332448459,
																"dt": -0.024810868515554432
															},
															"nextHandle": {
																"dv": 0.8715807006116155,
																"dt": 0.03500000000000003
															}
														},
														{
															"time": 0.09499999999999999,
															"value": 0.3300049349567332,
															"prevHandle": {
																"dv": -0.09186223587130012,
																"dt": -0.05987522403665296
															},
															"nextHandle": {
																"dv": 0.636704555180494,
																"dt": 0.4140681559183458
															}
														},
														{
															"time": 1,
															"value": 1.01469963255798,
															"prevHandle": {
																"dv": -0.1819155871944269,
																"dt": -0.38
															},
															"nextHandle": {
																"dv": 0.12673911289324527,
																"dt": 0.2647429153388605
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
												"amount": 0.75,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "object",
									"name": "sparkles",
									"x": -0.25754714285714275,
									"y": -1.4406033928571431,
									"z": 16.95728839285714,
									"scaleX": 1.25,
									"scaleY": 1.25,
									"scaleZ": 1.25,
									"children": [
										{
											"type": "subFX",
											"name": "FX_ElectricSparkles",
											"source": "Fx/Explosion/BasesExplosions/FX_ElectricSparkles_Photosensitive.fx",
											"x": -1.289688,
											"y": -1.7556979999999995,
											"z": 10.278779999999998,
											"scaleX": 0.9000000000000001,
											"scaleY": 0.9000000000000001,
											"scaleZ": 0.9,
											"rotationX": 9.599999999999998,
											"rotationY": 43.29999999999999,
											"rotationZ": -83.70000000000002,
											"time": 1.135
										},
										{
											"type": "subFX",
											"name": "FX_ElectricSparkles",
											"source": "Fx/Explosion/BasesExplosions/FX_ElectricSparkles_Photosensitive.fx",
											"x": 1.2566819999999996,
											"y": 2.569212,
											"z": 5.3125000000000036,
											"scaleX": 0.7000000000000001,
											"scaleY": 0.6999999999999998,
											"scaleZ": 0.7,
											"rotationX": -21.100000000000005,
											"rotationY": 50.90000000000001,
											"rotationZ": 19.20000000000001,
											"time": 1.135
										},
										{
											"type": "subFX",
											"name": "FX_ElectricSparkles",
											"source": "Fx/Explosion/BasesExplosions/FX_ElectricSparkles_Photosensitive.fx",
											"x": -2.3190280000000008,
											"y": -1.658438,
											"z": -2.224409999999999,
											"scaleX": 0.6999999999999998,
											"scaleY": 0.7,
											"scaleZ": 0.6999999999999998,
											"rotationX": -56.299999999999926,
											"rotationY": -79.7,
											"rotationZ": 84.39999999999992,
											"time": 1.135
										},
										{
											"type": "subFX",
											"name": "FX_ElectricSparkles",
											"source": "Fx/Explosion/BasesExplosions/FX_ElectricSparkles_Photosensitive.fx",
											"x": 1.3907719999999997,
											"y": 5.947021999999999,
											"z": -5.112709999999999,
											"scaleX": 0.6999999999999998,
											"scaleY": 0.7,
											"scaleZ": 0.6999999999999997,
											"rotationX": -101.69999999999999,
											"rotationY": 125.59999999999997,
											"rotationZ": -39.499999999999964,
											"time": 1.135
										},
										{
											"type": "subFX",
											"name": "FX_ElectricSparkles",
											"source": "Fx/Explosion/BasesExplosions/FX_ElectricSparkles_Photosensitive.fx",
											"x": 0.9612619999999996,
											"y": -5.102098,
											"z": -8.254159999999999,
											"scaleX": 1.2,
											"scaleY": 1.2,
											"scaleZ": 1.1999999999999997,
											"rotationX": 13.099999999999998,
											"rotationY": 57.60000000000001,
											"rotationZ": -79.20000000000002,
											"time": 1.135
										}
									]
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_ScreenShake",
							"source": "Fx/Explosion/FX_ScreenShake.fx",
							"x": 1.226295714285714,
							"y": -0.2058792857142856,
							"z": -2.6014407142857143,
							"time": 1.27
						},
						{
							"type": "object",
							"name": "LightDecals",
							"enabled": false,
							"x": 0.4716657142857142,
							"y": -0.2058792857142856,
							"z": -1.6992107142857145,
							"children": [
								{
									"type": "advancedDecal",
									"name": "HighExplosion",
									"z": 1.24096,
									"scaleX": 100,
									"scaleY": 100,
									"scaleZ": 50,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 40,
									"blendMode": 2,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.025
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 1.637675396548583,
															"value": -0.01666666666666672
														},
														{
															"time": 1.6476753965485829,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.577432461292484,
															"value": 0,
															"prevHandle": {
																"dv": -0.03361111111111109,
																"dt": -1.949996230602265
															},
															"nextHandle": {
																"dv": 0.0057926397589892495,
																"dt": 0.3333135451062032
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
											"props": {
												"amount": 1,
												"color": [
													0.8745098039215686,
													0.4235294117647059,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 1.0999731629632161,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3511766515930348,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.235493487724198,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.97786660510505,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ElecBlink",
									"z": 0.5000000000000001,
									"scaleX": 100,
									"scaleY": 100,
									"scaleZ": 50,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 40,
									"blendMode": 2,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 50
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.04
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 1.3854563734306475,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.8457732899035364,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 1.9630681785914044,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 2.0803630672792726,
															"value": 0.85,
															"mode": 2
														},
														{
															"time": 2.1663793189837093,
															"value": 0.4,
															"mode": 2
														},
														{
															"time": 2.323815482933588,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.3897938749724372,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.19272586298685815
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
														},
														{
															"time": 4,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.25,
															"value": 0.7,
															"mode": 2
														},
														{
															"time": 4.5,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.72,
															"value": 0.6,
															"mode": 2
														},
														{
															"time": 5,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.6,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 6.4,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0,
												"maxAlpha": 0.5,
												"frequency": 10
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8745098039215686,
													0.4235294117647059,
													0.22745098039215686
												]
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
													0.45098039215686275,
													0.30196078431372547,
													0.8352941176470589
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"enabled": false,
													"keys": [
														{
															"time": 1.7519373789532413,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.8457732899035364,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9630681785914044,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.0803630672792726,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.1663793189837093,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.323815482933588,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.4749790624124715,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.5965547233972863,
															"value": 1,
															"mode": 2
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
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.7510106999864862,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.1489814631351345,
													"value": 1,
													"mode": 2
												},
												{
													"time": 7.286330399225757,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.028703516606608,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ElecAnticipation",
									"z": 0.5000000000000001,
									"scaleX": 25,
									"scaleY": 25,
									"scaleZ": 45,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 40,
									"blendMode": 2,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 50
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.02
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4590797113617079,
															"value": 0,
															"prevHandle": {
																"dv": -0.01684808236454548,
																"dt": -0.49868290847939695
															},
															"nextHandle": {
																"dv": 0.01854957272653629,
																"dt": 0.5972850678733032
															}
														},
														{
															"time": 1.7731068606829754,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1.7831068606829754,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0,
												"maxAlpha": 0.5,
												"frequency": 10
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.45098039215686275,
													0.30196078431372547,
													0.8352941176470589
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.109758444393383,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.3160932860223418,
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
							"type": "curve",
							"name": "shake",
							"keyMode": 1,
							"keys": [
								{
									"time": 1.7114929035623998,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1.7214929035624,
									"value": 0.35,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.0033333333333334103
									},
									"nextHandle": {
										"dv": -0.35583333333333333,
										"dt": 0.24184613222801432
									}
								},
								{
									"time": 6.164560612490172,
									"value": 0,
									"prevHandle": {
										"dv": 0.005833333333333329,
										"dt": -3.2107886639318926
									},
									"nextHandle": {
										"dv": -0.0001150926715946202,
										"dt": 0.06342950122681006
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "ElecAnticipation",
							"enabled": false,
							"x": 0.4716657142857142,
							"y": -0.2058792857142856,
							"z": -1.1992107142857145,
							"scaleX": 25,
							"scaleY": 25,
							"scaleZ": 25,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"fadePower": 0.5,
							"emissive": 40,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 10
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.45098039215686275,
											0.30196078431372547,
											0.8352941176470589
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.9,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								},
								{
									"type": "curve",
									"name": "visibility",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.109758444393383,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.3160932860223418,
											"value": 0,
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
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.2,
													"value": 0,
													"prevHandle": {
														"dv": -0.05358669768524586,
														"dt": -0.49585125333109414
													},
													"nextHandle": {
														"dv": 0.05807950143856844,
														"dt": 0.5221255698204392
													}
												},
												{
													"time": 1.7731068606829754,
													"value": 0.5,
													"prevHandle": {
														"dv": -0.0015134597573044362,
														"dt": -0.32885572104209704
													},
													"nextHandle": {
														"dv": -6.80645364864975e-19,
														"dt": 0.0033333333333333357
													}
												},
												{
													"time": 1.7831068606829754,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "position.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.1,
											"value": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6666666666666666
											}
										},
										{
											"time": 2,
											"value": 20.8,
											"prevHandle": {
												"dv": 0.007719983552632925,
												"dt": -0.43566132563694193
											},
											"nextHandle": {
												"dv": -3.6679611641141805e-15,
												"dt": 0.4349597512655168
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "LensFlare",
							"enabled": false,
							"x": -1.51052,
							"y": -0.5043,
							"z": -6.32523,
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 10,
							"children": [
								{
									"type": "emitter",
									"name": "LensFlare_circle",
									"props": {
										"alignMode": "Screen",
										"instScale_rand": 1.5,
										"maxCount": 5,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.9215686274509803,
											0.9215686274509803,
											0.9215686274509803,
											0.8509803921568627
										],
										"emitAngle": 0,
										"emitRate": 1,
										"instRotation_rand": [
											0,
											0,
											150
										],
										"instScale": 7,
										"emitType": "Burst",
										"burstDelay": 0.12,
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"warmUpTime": -1.68,
										"instOffset": [
											1.25,
											0,
											0
										],
										"instRotation": [
											0,
											0,
											25
										],
										"instOffset_rand": [
											0.2,
											0,
											0
										],
										"lifeTime": 1.8,
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
									"x": 0.05686,
									"y": -0.145,
									"z": 2.75,
									"scaleX": 0.09999999999999999,
									"scaleY": 0.09999999999999999,
									"scaleZ": 0.09999999999999999,
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
															"blend": "Add",
															"shadows": false,
															"culling": "Back",
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": true,
															"parallax": 0,
															"textureWrap": true,
															"emissive": 10
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_LensFlare_01.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.0049999999999999975,
																	"value": 1,
																	"prevHandle": {
																		"dv": 1.2619278819653144,
																		"dt": -0.3266166282733753
																	},
																	"nextHandle": {
																		"dv": -0.85,
																		"dt": 0.22000000000000003
																	}
																},
																{
																	"time": 1,
																	"value": 0.033333333333333326,
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
															0.6941176470588235,
															0.3607843137254902,
															0.2588235294117647
														]
													},
													"isInstance": true
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
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.8,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.5,
														"maxAlpha": 1,
														"frequency": 10
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.5,
														"color": [
															0.45098039215686275,
															0.30196078431372547,
															0.8352941176470589
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.12560019506242215,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.27380621978928366,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.4361271040139416,
																	"value": 0.75,
																	"mode": 2
																},
																{
																	"time": 0.626677707234192,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.78899859145885,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1,
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
											"type": "curve",
											"name": "instScale",
											"keys": [
												{
													"time": 0,
													"value": 1.0666666666666667,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1.1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "LensFlare_color_big2",
									"props": {
										"alignMode": "Screen",
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
											0.9215686274509803,
											0.9215686274509803,
											0.9215686274509803,
											0.8509803921568627
										],
										"emitAngle": 0,
										"emitRate": 1,
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instScale": 9,
										"emitType": "Burst",
										"burstDelay": 0.12,
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"warmUpTime": -1.7,
										"instRotation": [
											20,
											0,
											0
										],
										"lifeTime": 3,
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
									"z": 1.25,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
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
															"culling": "Back",
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": true,
															"parallax": 0,
															"textureWrap": true,
															"emissive": 8
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Gradients/T_circleGradient_color04.png",
													"color": [
														0.9411764705882353,
														0.807843137254902,
														0.7058823529411764,
														1
													]
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.45,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_LensFlare_Double.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.0049999999999999975,
																	"value": 1,
																	"prevHandle": {
																		"dv": 1.2619278819653144,
																		"dt": -0.3266166282733753
																	},
																	"nextHandle": {
																		"dv": -0.85,
																		"dt": 0.22000000000000003
																	}
																},
																{
																	"time": 1,
																	"value": 0.033333333333333326,
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
														"range": 24.24,
														"power": 0.8
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.8,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.25,
														"color": [
															0.45098039215686275,
															0.30196078431372547,
															0.8352941176470589
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keys": [
												{
													"time": 0,
													"value": 1.0666666666666667,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1.1,
													"mode": 2
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}