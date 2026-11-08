{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Sky",
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"scaleZ": 0.9999999999999998,
							"rotationX": -7.508051697551904e-15,
							"rotationY": -64.9367069218166,
							"rotationZ": 158.61217917040696,
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "object",
									"name": "SkyStars",
									"scaleX": 0.05,
									"scaleY": 0.05,
									"scaleZ": 0.05,
									"children": [
										{
											"type": "emitter",
											"name": "etoileFilante",
											"enabled": false,
											"props": {
												"lifeTime": 0.75,
												"lifeTimeRand": 0.25,
												"emitShape": "Box",
												"alignMode": "Screen",
												"instScale_rand": 0.2,
												"emitRate": 1,
												"maxCount": 2,
												"useRandomColor": true,
												"randomColor1": [
													1,
													1,
													0.9568627450980391,
													0.8588235294117647
												],
												"randomColor2": [
													0.8431372549019608,
													0.7607843137254902,
													0.9921568627450981,
													1
												],
												"frameCount": 4,
												"frameDivisionX": 2,
												"frameDivisionY": 2,
												"animationSpeed": 0,
												"instRotation_rand": [
													0,
													0,
													0
												],
												"instSpeed": [
													0,
													0,
													-300
												],
												"instSpeed_rand": [
													10,
													0,
													-50
												],
												"instScale": 0.6,
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
											"x": -322.35,
											"y": -117.20901,
											"z": 76.75257,
											"scaleX": 20,
											"scaleY": 200,
											"scaleZ": 200,
											"rotationX": 62.6,
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
																	"colorMask": 255,
																	"depthTest": "LessEqual"
																}
															},
															"color": [
																0,
																0,
																0,
																1
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
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
															"value": 0.9988888888888889,
															"prevHandle": {
																"dv": -0.006475858898370489,
																"dt": -0.4999930749361159
															},
															"nextHandle": {
																"dv": 0.006475858898370489,
																"dt": 0.4999930749361159
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0.8577771691031132,
																"dt": -0.20987654320987503
															},
															"nextHandle": {
																"dv": -0.70268460289168,
																"dt": 0.1719755257487621
															}
														}
													]
												},
												{
													"type": "trails",
													"name": "Trails",
													"startWidth": 0.3,
													"lifetime": 0.5,
													"maxSpeed": 100,
													"children": [
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.45
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
																				"dv": 1.027359623300715,
																				"dt": -0.011807729718303477
																			},
																			"nextHandle": {
																				"dv": -1.1618899613747582,
																				"dt": 0.012222222222222218
																			}
																		},
																		{
																			"time": 0.46555555555555556,
																			"value": 0,
																			"prevHandle": {
																				"dv": -0.006601199659318657,
																				"dt": -0.3333333333333333
																			},
																			"nextHandle": {
																				"dv": 0.006601199659318657,
																				"dt": 0.3333333333333333
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
																	1,
																	0.9568627450980391
																]
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.05237311385459533,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.06237311385459533,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15601737540009147,
															"value": 0,
															"mode": 2
														}
													],
													"loop": true
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 100,
											"scaleY": 100,
											"rotationY": 90,
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
															"emissive": 25
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
														"uScale": 6,
														"vScale": 6,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/Dust02.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 1,
																	"value": 0.5,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 4,
														"uvScaleY": 4,
														"texture": "Fx/Alphas/Dust01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.01,
															0.02
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
															0.9254901960784314,
															0.7647058823529411
														]
													}
												}
											]
										},
										{
											"type": "emitter",
											"name": "Stars",
											"props": {
												"lifeTime": 6,
												"lifeTimeRand": 3,
												"emitShape": "Box",
												"alignMode": "Screen",
												"instScale": 2.5,
												"instScale_rand": 0.25,
												"warmUpTime": 5,
												"emitRate": 8,
												"maxCount": 50,
												"useRandomColor": true,
												"randomColor1": [
													1,
													1,
													0.9568627450980391,
													0.8588235294117647
												],
												"randomColor2": [
													0.8431372549019608,
													0.7607843137254902,
													0.9921568627450981,
													1
												],
												"frameCount": 4,
												"frameDivisionX": 2,
												"frameDivisionY": 2,
												"animationSpeed": 0,
												"spriteSheet": "Fx/Alphas/T_Stars_2x2_02.png",
												"instRotation_rand": [
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
											"x": -1.6795499999999999,
											"scaleX": 100,
											"scaleY": 10,
											"scaleZ": 100,
											"rotationZ": 90,
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
																	"colorMask": 255,
																	"depthTest": "LessEqual"
																}
															}
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
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.9
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
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.16666666666666666
																			}
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.16666666666666666
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.16666666666666666
																			}
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
																				"dt": 0.16666666666666666
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
																	1,
																	0.9568627450980391
																]
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keys": [
														{
															"time": 0,
															"value": 0.9988888888888889,
															"mode": 2
														},
														{
															"time": 0.725,
															"value": 0.6766666666666666,
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
													"type": "curve",
													"name": "instRotation.z",
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
													],
													"loop": true
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