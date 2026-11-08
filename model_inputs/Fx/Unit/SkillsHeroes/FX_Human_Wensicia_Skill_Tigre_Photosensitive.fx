{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
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
		},
		{
			"type": "object",
			"name": "FXRoot",
			"x": 0.11936,
			"scaleX": 1.2,
			"scaleY": 1.2,
			"scaleZ": 1.2,
			"children": [
				{
					"type": "object",
					"name": "Wensicia",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Tiger_ImperialLazaTiger",
							"source": "Character/Imperial/LazaTiger/Tiger_ImperialLazaTiger.fbx",
							"rotationZ": 95,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Tiger/Anim_Tiger_FightIdle.fbx"
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Tiger",
					"enabled": false,
					"children": [
						{
							"type": "object",
							"name": "flare2",
							"x": 0.42598,
							"z": 0.61694,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_FlareBlack",
									"props": {
										"lifeTime": 0.35,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.5,
										"instStretch": [
											15,
											8,
											1
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"emitType": "Burst",
										"warmUpTime": -0.85
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationX": 45,
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
															"depthTest": "LessEqual"
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
														"alpha": 1.25,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare06_512.png"
													}
												},
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
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
													"mode": 0,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_Flare",
									"props": {
										"lifeTime": 0.2,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.45,
										"instStretch": [
											12,
											4,
											1
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"warmUpTime": -0.9,
										"emitType": "Burst",
										"instScale": 0.75
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationX": 45,
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
															"emissive": 6,
															"drawOrder": "100"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare06_512.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.06196351517869349,
																		"dt": -0.49990757001492336
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 0.13446288206139395
																	}
																},
																{
																	"time": 0.18100772585187647,
																	"value": 1,
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
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
													"mode": 0,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Flarescreen",
									"props": {
										"emitType": "Burst",
										"alignMode": "Screen",
										"instScale": 6,
										"lifeTime": 0.2,
										"warmUpTime": -0.85
									},
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"enableStencil": false,
															"parallax": 0
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 15,
														"power": 1
													},
													"isInstance": true
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
														"alpha": 0.7,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.337436981201172,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.1333333333333333,
																		"dt": -0.050000000000000044
																	},
																	"nextHandle": {
																		"dv": 0.6141901939981789,
																		"dt": 0.029366779035477106
																	}
																},
																{
																	"time": 1.0041889953613283,
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
																"color": -151464545
															},
															{
																"position": 0.828125,
																"color": -1
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 1,
												"ATTENUATE": true,
												"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
											}
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 1,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0.013591254720655976,
														"dt": -0.6969167042896149
													},
													"nextHandle": {
														"dv": -0.013591254720655976,
														"dt": 0.6969167042896149
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlareGround",
							"props": {
								"emitType": "Burst",
								"instScale": 5,
								"warmUpTime": -0.85,
								"lifeTime": 0.7
							},
							"x": 4.440892098500626e-16,
							"z": 0.2,
							"scaleX": 0.06999999999999998,
							"scaleY": 0.06999999999999998,
							"scaleZ": 0.06999999999999998,
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
													"enableStencil": false,
													"parallax": 0,
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 1
											},
											"isInstance": true
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
												"alpha": 0.6,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.06759086188641668,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -1.4,
																"dt": -0.040379546604235594
															},
															"nextHandle": {
																"dv": 0.614600230694067,
																"dt": 0.01603771273438879
															}
														},
														{
															"time": 1.0041889953613283,
															"value": 0,
															"mode": 0
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
																"color": -151464545
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
												}
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6431372549019607,
													0.5019607843137255,
													0.28627450980392155
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.06759086188641668,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00757687696833834,
																"dt": -0.06406311509621984
															},
															"nextHandle": {
																"dv": -0.03333333333333333,
																"dt": 0.28150569319861213
															}
														},
														{
															"time": 1.0041889953613283,
															"value": 1,
															"mode": 0
														}
													]
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
										"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Passive",
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"x": 0.27569,
							"y": -0.01374,
							"z": 0.86408,
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"rotationY": -38.3155323490468,
							"rotationZ": 42.31532939996876,
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "WhiteFlames",
									"y": -0.01,
									"z": 0.27735,
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"rotationX": -90,
									"rotationZ": -90,
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
													"drawOrder": "100",
													"emissive": 1
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/FireMask03.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.25,
												"saturation": 0.75,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/FireMask05.png",
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
													"enabled": false,
													"keys": [
														{
															"time": 0.5919898485973163,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.762122570980946,
															"value": 0.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0.26643086747757283,
																"dt": -0.07011519803730601
															},
															"nextHandle": {
																"dv": -0.26643086747757283,
																"dt": 0.07011519803730601
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 0.3,
												"scrollSpeed": [
													0,
													1
												],
												"scale": [
													1.25,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.2,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "BlackFlames",
									"y": -0.09669,
									"z": 0.33833,
									"scaleX": 1.25,
									"scaleY": 1.25,
									"scaleZ": 1.25,
									"rotationX": -90,
									"rotationZ": -90,
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
													"drawOrder": "110"
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
												"alpha": 5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/FireMask04.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A_Tapered.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_03.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keys": [
														{
															"time": 0.5919898485973163,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.762122570980946,
															"value": 0.45,
															"mode": 0,
															"prevHandle": {
																"dv": 0.26643086747757283,
																"dt": -0.07011519803730601
															},
															"nextHandle": {
																"dv": -0.26643086747757283,
																"dt": 0.07011519803730601
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 0.3,
												"scrollSpeed": [
													0,
													1
												],
												"scale": [
													1.25,
													1
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
													0,
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "BlackFlamesSmall",
									"x": -0.0083,
									"z": 0.14349,
									"scaleX": 0.8,
									"scaleY": 0.96,
									"scaleZ": 0.75,
									"rotationX": -90,
									"rotationZ": -90,
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
													"colorMask": 255
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
												"alpha": 5,
												"uScale": 2,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/FireMask04.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.36,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A_Tapered.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
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
												"width": 0.49,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_03.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 0.3,
												"scrollSpeed": [
													0,
													1
												],
												"scale": [
													1.25,
													1
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
													0,
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.8683242346823141,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.056710907461209936
											}
										},
										{
											"time": 1.132244135375164,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.40844782039338057,
												"dt": -0.1405444228386507
											},
											"nextHandle": {
												"dv": -0.40844782039338057,
												"dt": 0.1405444228386507
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_WhiteFlames",
							"x": 0.20749,
							"y": 0.01993,
							"z": 0.92434,
							"scaleX": 2.5,
							"scaleY": 4,
							"scaleZ": 2.5,
							"rotationX": 90,
							"rotationY": 90,
							"albedoMap": "Fx/Alphas/T_circle.png",
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.8694868087836278,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.056710907461209936
													}
												},
												{
													"time": 1.1334067094764777,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.40844782039338057,
														"dt": -0.1405444228386507
													},
													"nextHandle": {
														"dv": -0.40844782039338057,
														"dt": 0.1405444228386507
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.38,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 1.5,
										"uvScaleY": 5,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
											0
										]
									}
								}
							]
						},
						{
							"type": "object",
							"name": "FlashDecals",
							"enabled": false,
							"x": -0.30626,
							"y": 0.05923,
							"z": 0.8248,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"scaleX": 4,
									"scaleY": 1.25,
									"scaleZ": 1.2,
									"rotationX": 180,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.8709402596931386,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8909387904131258,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9327247423428315,
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
													0,
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_White",
									"scaleX": 4,
									"scaleY": 1.25,
									"scaleZ": 1.2,
									"rotationX": 180,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
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
													"keys": [
														{
															"time": 0.9310320167907851,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9628796263750969,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.158105816901331,
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
						}
					]
				}
			]
		}
	]
}