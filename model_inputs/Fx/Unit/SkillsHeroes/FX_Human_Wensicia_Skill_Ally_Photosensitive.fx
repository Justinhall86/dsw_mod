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
			"children": [
				{
					"type": "object",
					"name": "1",
					"children": [
						{
							"type": "object",
							"name": "Ally",
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.9999999999999999,
							"children": [
								{
									"type": "object",
									"name": "FlashDecals",
									"enabled": false,
									"x": 0.05005999999999977,
									"y": -0.0185300000000006,
									"z": 1.3305899999999997,
									"scaleX": 0.9999999999999999,
									"scaleY": 0.9999999999999999,
									"scaleZ": 0.9999999999999999,
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Black",
											"scaleX": 2.5,
											"scaleY": 1.5,
											"scaleZ": 1.2,
											"rotationX": 180,
											"rotationY": 90,
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
																	"time": 0.10713207501562196,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.12713060573560894,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.1689165576653145,
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
											"scaleX": 2.5,
											"scaleY": 1.5,
											"scaleZ": 1.2,
											"rotationX": 180,
											"rotationY": 90,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.8
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.13199937684188187,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1638469864261936,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8190907740803943,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.012381017755111579,
																		"dt": -0.6472493656117184
																	},
																	"nextHandle": {
																		"dv": -0.0072841243376838664,
																		"dt": 0.49999710771170824
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
															1,
															0.9529411764705882,
															0.8862745098039215
														]
													}
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.75,
														"ATTENUATE": true,
														"emissiveMap": null
													}
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Slide",
											"scaleX": 1.5,
											"scaleY": 2.5,
											"scaleZ": 1.2,
											"rotationX": 90,
											"rotationY": 180,
											"rotationZ": 90,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"fadePower": 3,
											"emissive": 10,
											"renderMode": "BeforeTonemapping",
											"blendMode": 2,
											"children": [
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 2
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.06881008071240516,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1271685686661432,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5491376251358524,
																	"value": 0,
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
														"sandBlend": 0.5,
														"sandColorSet": false,
														"envBlend": 0.6,
														"envColorSet": false
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap-Slide",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl16u_A.png",
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
															"name": "uvShift.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.030174391558773397,
																	"value": 0.22450165968855162,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.013817089154406714,
																		"dt": -0.47960471243924907
																	},
																	"nextHandle": {
																		"dv": 0.036641438534831205,
																		"dt": 0.21394131780378267
																	}
																},
																{
																	"time": 0.5473951598756106,
																	"value": 1.188780934119911,
																	"prevHandle": {
																		"dv": -0.006177529446548258,
																		"dt": -0.22334533177317972
																	},
																	"nextHandle": {
																		"dv": 0.006177529446548258,
																		"dt": 0.22334533177317972
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
									"type": "object",
									"name": "flare2",
									"enabled": false,
									"x": 0.09306,
									"z": 1.4,
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
												"warmUpTime": -0.09,
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
												"warmUpTime": -0.14,
												"emitType": "Burst",
												"instScale": 0.75,
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
												"instScale": 3,
												"lifeTime": 0.2,
												"warmUpTime": -0.09,
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
																			"value": 0
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
													"type": "curve",
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 2,
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
									"type": "object",
									"name": "flare2",
									"enabled": false,
									"z": 2.62665,
									"scaleX": 0.6,
									"scaleY": 0.6,
									"scaleZ": 0.6,
									"children": [
										{
											"type": "emitter",
											"name": "emitter_Flare",
											"props": {
												"lifeTime": 0.2,
												"alignMode": "Screen",
												"alignLockAxis": "Z",
												"burstDelay": 0.45,
												"instStretch": [
													10,
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
												"warmUpTime": -0.19,
												"emitType": "Burst",
												"instScale": 0.75,
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
											"z": 0.43517,
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
										}
									]
								},
								{
									"type": "object",
									"name": "ShieldOK",
									"z": 1.55935,
									"children": [
										{
											"type": "model",
											"name": "Sphere_Slide",
											"source": "Fx/Meshes_Common/Sphere.fbx",
											"z": -0.31137,
											"scaleX": 1.8,
											"scaleY": 1.8,
											"scaleZ": 4,
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.42,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/Alphas/T_SpiceAlpha.png",
														"uvShift": [
															0.2,
															0.5
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
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0.2,
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
													"name": "DissolveMap-Slide",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/Cyl16u_A.png",
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
															"name": "uvShift.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0.6388,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.013817089154406714,
																		"dt": -0.47960471243924907
																	},
																	"nextHandle": {
																		"dv": 0.036641438534831205,
																		"dt": 0.21394131780378267
																	}
																},
																{
																	"time": 0.43751339310144727,
																	"value": 1.188780934119911,
																	"prevHandle": {
																		"dv": -0.006177529446548258,
																		"dt": -0.22334533177317972
																	},
																	"nextHandle": {
																		"dv": 0.006177529446548258,
																		"dt": 0.22334533177317972
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
														"RGB": false,
														"ALPHA": true,
														"REVERSE": false,
														"bias": 0,
														"scale": 1,
														"power": 1,
														"color": [
															1,
															0,
															0
														]
													}
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
															"keys": [
																{
																	"time": 0.06476396495857537,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.09661157454288762,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5185806310125964,
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
															1,
															1
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
														"envBlend": 0.6,
														"envColorSet": false
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.7,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								},
								{
									"type": "object",
									"name": "Particles",
									"y": 4.440892098500626e-16,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"children": [
										{
											"type": "emitter",
											"name": "Particles",
											"props": {
												"emitType": "Burst",
												"lifeTimeRand": 0.3,
												"burstParticleCount": 10,
												"emitSurface": true,
												"alignMode": "Screen",
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"instSpeed": [
													0,
													5,
													25
												],
												"instSpeed_rand": [
													0,
													0,
													10
												],
												"instAcceleration_rand": [
													0,
													0,
													0
												],
												"instScale_rand": 0.12,
												"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
												"lifeTime": 0.9,
												"emitShape": "Cylinder",
												"emitRad2": 0.55,
												"instRotation_rand": [
													0,
													0,
													360
												],
												"emitAngle": 360,
												"warmUpTime": -0.14,
												"useRandomColor": true,
												"randomColor1": [
													1,
													0.9490196078431372,
													0.8784313725490196,
													1
												],
												"randomColor2": [
													1,
													0.9019607843137255,
													0.7843137254901961,
													1
												],
												"instScale": 0.9,
												"instOrbitSpeed": [
													0,
													0,
													5
												],
												"instOrbitSpeed_rand": [
													0,
													0,
													2
												],
												"seedGroup": 1,
												"emitOrientation": "Normal",
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
											"scaleX": 1.9,
											"scaleY": 1.9,
											"scaleZ": 0.17,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.065,
																			"value": 1,
																			"prevHandle": {
																				"dv": 0.11089160652646488,
																				"dt": -0.015692208470726162
																			},
																			"nextHandle": {
																				"dv": -0.8833333333333333,
																				"dt": 0.12500000000000003
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"prevHandle": {
																				"dv": -0.01666666666666672,
																				"dt": -0.8384636488340191
																			},
																			"nextHandle": {
																				"dv": 0.006154423696995358,
																				"dt": 0.30991955512506614
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
																"sandBlend": 0.7,
																"sandColorSet": false,
																"envBlend": 0.7,
																"envColorSet": false
															}
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
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.06666666666666667,
																"dt": -0.56
															},
															"nextHandle": {
																"dv": 0.03967621425974007,
																"dt": 0.3332801997818148
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.z",
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
																"dv": 0.013194444444444398,
																"dt": -0.8841852909175679
															},
															"nextHandle": {
																"dv": -0.006407488794313876,
																"dt": 0.33335250704975594
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.y",
													"keys": [
														{
															"time": 0,
															"value": 4,
															"prevHandle": {
																"dv": 4.093979236902871,
																"dt": -0.014066889347596315
															},
															"nextHandle": {
																"dv": -3.407170046487326,
																"dt": 0.011640960349275753
															}
														},
														{
															"time": 1,
															"value": -0.75,
															"prevHandle": {
																"dv": -0.2822334196776164,
																"dt": -1.1294089163140315
															},
															"nextHandle": {
																"dv": 0.07924705219885098,
																"dt": 0.33328592224694964
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instOrbitSpeed.z",
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
																"dv": 0.049851314927107426,
																"dt": -0.5043451509891843
															},
															"nextHandle": {
																"dv": -0.03306904715719971,
																"dt": 0.3331829822235662
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instOrbitSpeed.z",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.77,
														"ATTENUATE": true,
														"emissiveMap": null
													}
												}
											]
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAtUP",
									"enabled": false,
									"z": -0.1466197727272727,
									"scaleY": 3.5,
									"scaleZ": 1.5,
									"rotationZ": -9.99983099586397,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 0.5,
											"scaleY": 12,
											"scaleZ": 0.7499392354141005,
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 3,
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
														"alpha": 0.25,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.02476704128984626,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.13811195427048373,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8761099173623277,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.01592762388032032,
																		"dt": -0.5947906698256693
																	},
																	"nextHandle": {
																		"dv": -0.012166067120087337,
																		"dt": 0.33332283580287475
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
														"range": 15,
														"power": 0.8
													}
												},
												{
													"type": "curve",
													"name": "scale.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.041506107572114204,
															"value": 0.25,
															"prevHandle": {
																"dv": 0.002404241294978398,
																"dt": -0.015494497741857334
															},
															"nextHandle": {
																"dv": -0.01414688773777184,
																"dt": 0.1249143940058296
															}
														},
														{
															"time": 0.16501965943973423,
															"value": 1.75,
															"mode": 2
														}
													]
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.72,
														"ATTENUATE": true,
														"emissiveMap": null
													}
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.5,
														"sandColorSet": false,
														"envBlend": 0.6,
														"envColorSet": false
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Character",
							"editorOnly": true,
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.9999999999999999,
							"children": [
								{
									"type": "model",
									"name": "Male01_ImperialTrooper",
									"source": "Character/Imperial/Trooper/Male01_ImperialTrooper.fbx",
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle.fbx"
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