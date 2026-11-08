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
												"instScale": 2,
												"instScale_rand": 0.5,
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
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "TopRightCorner",
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"x": 0.07901,
							"y": 0.04407,
							"scaleX": 0.4999999999999999,
							"scaleY": 0.4999999999999999,
							"scaleZ": 0.5,
							"rotationY": -85.4,
							"rotationZ": -60.8,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "object",
									"name": "group",
									"x": 2.12,
									"y": -3.45184,
									"z": 1.92011,
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"rotationX": -3.2,
									"children": [
										{
											"type": "polygon",
											"name": "polygon - Dottedline1",
											"x": 0.001617500000000035,
											"y": 0.01615249999999996,
											"z": -0.0035999999999999366,
											"scaleX": 2,
											"scaleY": 0.49999999999999994,
											"scaleZ": 1.2,
											"rotationX": -89.99999999999999,
											"rotationY": 45.00000000000001,
											"rotationZ": -89.99999999999999,
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
															"depthTest": "LessEqual"
														}
													}
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
														"alpha": 0.75,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_ArcLines.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/dGrad05.png",
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
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 10,
																	"value": 1,
																	"mode": 2
																}
															],
															"loop": true
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Line1",
											"x": 0.0016174999999999384,
											"y": -0.07494749999999972,
											"z": 0.08750000000000013,
											"children": [
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.5,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_UI_WoblyLines.png"
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.5,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
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
																"progress": 0.27,
																"saturation": 1,
																"width": 0.45,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl05v_A.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.25,
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
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 5,
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
										},
										{
											"type": "object",
											"name": "Line1",
											"x": 0.00162,
											"y": 0.06616,
											"z": -0.02013,
											"children": [
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.5,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.5,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
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
																"progress": 0.27,
																"saturation": 1,
																"width": 0.45,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl05v_A.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.25,
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
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 5,
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
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.8
							}
						}
					]
				},
				{
					"type": "object",
					"name": "BottomLeftCorner",
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"x": 0.18048,
							"y": -0.20473,
							"z": -0.19186,
							"scaleX": 0.4999999999999999,
							"scaleY": 0.4999999999999999,
							"scaleZ": 0.5,
							"rotationY": -41.5,
							"rotationZ": 1.4,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "object",
									"name": "group",
									"x": 2.12,
									"y": 3.41045,
									"z": -1.51129,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationX": -19.2,
									"children": [
										{
											"type": "polygon",
											"name": "polygon - Dottedline1",
											"x": 0.00162,
											"y": -0.12079,
											"z": 0.11184,
											"scaleX": 2,
											"scaleY": 0.49999999999999994,
											"scaleZ": 1.2,
											"rotationX": -90,
											"rotationY": 45,
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
															"depthTest": "LessEqual"
														}
													}
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
														"alpha": 0.75,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_ArcLines.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/dGrad03.png",
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
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 10,
																	"value": 1,
																	"mode": 2
																}
															],
															"loop": true
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Line1",
											"x": 0.0016174999999999384,
											"y": -0.07494749999999972,
											"z": 0.08750000000000013,
											"children": [
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.5,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_UI_WoblyLines.png"
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.5,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
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
																"progress": 0.27,
																"saturation": 1,
																"width": 0.45,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl05v_A.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	-0.25,
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
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 5,
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
										},
										{
											"type": "object",
											"name": "Line1",
											"x": 0.00162,
											"y": 0.06616,
											"z": -0.02013,
											"children": [
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.5,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.5,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
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
																"progress": 0.27,
																"saturation": 1,
																"width": 0.45,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl05v_A.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	-0.25,
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
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 5,
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
										},
										{
											"type": "object",
											"name": "Line1",
											"x": 0.00162,
											"y": 0.06616,
											"z": -0.02013,
											"children": [
												{
													"type": "polygon",
													"name": "polygon - line1",
													"y": 0.31472,
													"z": -0.13793,
													"scaleX": 1.5,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 59.7,
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
																	"depthTest": "LessEqual"
																}
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.5,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - line1",
													"y": 0.31472,
													"z": -0.13793,
													"scaleX": 1.5,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 59.7,
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
																	"depthTest": "LessEqual"
																}
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.5,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
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
																"progress": 0.27,
																"saturation": 1,
																"width": 0.45,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl05v_A.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	-0.25,
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
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 5,
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
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.8
							}
						}
					]
				},
				{
					"type": "object",
					"name": "BottomRightCorner",
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"x": 0.13787,
							"y": 0.07691,
							"scaleX": 0.4999999999999999,
							"scaleY": 0.4999999999999999,
							"scaleZ": 0.5,
							"rotationY": -85.4,
							"rotationZ": -60.8,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "object",
									"name": "group",
									"x": 2.12,
									"y": -2.67156,
									"z": -1.4584,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationX": -80,
									"children": [
										{
											"type": "polygon",
											"name": "polygon - Dottedline1",
											"x": 0.001617500000000035,
											"y": 0.01615249999999996,
											"z": -0.0035999999999999366,
											"scaleX": 2,
											"scaleY": 0.49999999999999994,
											"scaleZ": 1.2,
											"rotationX": -89.99999999999999,
											"rotationY": 45.00000000000001,
											"rotationZ": -89.99999999999999,
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
															"depthTest": "LessEqual"
														}
													}
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
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0.25,
														"texture": "Fx/Alphas/T_UI_ArcLines.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/dGrad05.png",
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
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 10,
																	"value": 1,
																	"mode": 2
																}
															],
															"loop": true
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon - Dottedline1",
											"x": 0.00162,
											"y": 0.15611,
											"z": -0.14356,
											"scaleX": 2,
											"scaleY": 0.49999999999999994,
											"scaleZ": 1.2,
											"rotationX": -90,
											"rotationY": 45,
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
															"depthTest": "LessEqual"
														}
													}
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
														"alpha": 0.75,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_ArcLines.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/dGrad05.png",
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
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 10,
																	"value": 1,
																	"mode": 2
																}
															],
															"loop": true
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Line1",
											"x": 0.0016174999999999384,
											"y": -0.07494749999999972,
											"z": 0.08750000000000013,
											"children": [
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
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
																"alpha": 0.5,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.75,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_UI_WoblyLines.png"
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.75,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
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
																"progress": 0.27,
																"saturation": 1,
																"width": 0.45,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl05v_A.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.25,
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
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 5,
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
										},
										{
											"type": "object",
											"name": "Line1",
											"x": 0.00162,
											"y": 0.06616,
											"z": -0.02013,
											"children": [
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.5,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.5,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
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
																"progress": 0.27,
																"saturation": 1,
																"width": 0.45,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl05v_A.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.25,
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
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 5,
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
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.8
							}
						}
					]
				},
				{
					"type": "object",
					"name": "TopLeftCorner",
					"y": 0.1014,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"x": -0.27998,
							"y": -0.11579,
							"scaleX": 0.4999999999999999,
							"scaleY": 0.4999999999999999,
							"scaleZ": 0.5,
							"rotationY": -85,
							"rotationZ": -56.1,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "object",
									"name": "group",
									"x": 2.12,
									"y": 2.75519,
									"z": 2.18265,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationX": 102,
									"children": [
										{
											"type": "polygon",
											"name": "polygon - Dottedline1",
											"x": 0.00162,
											"y": -0.15313,
											"z": 0.16568,
											"scaleX": 2,
											"scaleY": 0.49999999999999994,
											"scaleZ": 1.2,
											"rotationX": -90,
											"rotationY": 45,
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
															"depthTest": "LessEqual"
														}
													}
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
														"alpha": 0.75,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_ArcLines.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
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
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/dGrad05.png",
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
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 10,
																	"value": 1,
																	"mode": 2
																}
															],
															"loop": true
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Line1",
											"x": 0.0016174999999999384,
											"y": -0.07494749999999972,
											"z": 0.08750000000000013,
											"children": [
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
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
																"alpha": 0.5,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.75,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 1.1102230246251565e-16,
													"y": -2.220446049250313e-16,
													"scaleX": 2.0000000000000004,
													"scaleY": 0.5,
													"scaleZ": 1.2,
													"rotationX": -90,
													"rotationY": 45.00000000000002,
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
																	"depthTest": "LessEqual"
																}
															}
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_UI_WoblyLines.png"
															}
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
																"alpha": 0.75,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0.75,
																"texture": "Fx/Alphas/T_UI_ArcLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	0.2901960784313725,
																	0.1803921568627451
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
																"progress": 0.27,
																"saturation": 1,
																"width": 0.45,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl05v_A.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.25,
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
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 5,
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
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.8
							}
						}
					]
				}
			]
		}
	]
}