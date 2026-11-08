{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "Dust",
					"props": {
						"lifeTime": 8,
						"lifeTimeRand": 5,
						"emitShape": "Box",
						"alignMode": "Screen",
						"instScale": 0.01,
						"instScale_rand": 0.002,
						"instSpeed_rand": [
							0.02,
							0.02,
							0.01
						],
						"warmUpTime": 10,
						"emitRate": 20,
						"maxCount": 100,
						"useRandomColor": true,
						"randomColor1": [
							0.5176470588235293,
							0.23137254901960785,
							0.13333333333333333,
							1
						],
						"randomColor2": [
							0.8941176470588235,
							0.6745098039215687,
							0.3607843137254902,
							0.6941176470588235
						],
						"instSpeed": [
							0,
							0,
							-0.02
						]
					},
					"x": 0.42443,
					"y": -1.92487,
					"z": 1.51505,
					"scaleX": 1.42,
					"scaleY": 1.19,
					"scaleZ": 2.05,
					"rotationY": 37.9,
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
											"mode": "AfterTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 1
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
										"alpha": 0.9,
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
														"dt": 0.16666666666666666
													}
												},
												{
													"time": 0.5,
													"value": 1,
													"mode": 0,
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
													"mode": 0,
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
						}
					]
				},
				{
					"type": "emitter",
					"name": "Dust",
					"props": {
						"lifeTime": 8,
						"lifeTimeRand": 5,
						"emitShape": "Box",
						"alignMode": "Screen",
						"instScale": 0.025,
						"instScale_rand": 0.01,
						"instSpeed_rand": [
							0.02,
							0.02,
							0.02
						],
						"warmUpTime": 10,
						"emitRate": 7,
						"randomColor1": [
							0.4784313725490196,
							0.4784313725490196,
							0.4784313725490196,
							1
						],
						"randomColor2": [
							0.7176470588235294,
							0.7176470588235294,
							0.7176470588235294,
							1
						],
						"frameCount": 4,
						"frameDivisionX": 2,
						"frameDivisionY": 2,
						"animationSpeed": 0,
						"spriteSheet": "Fx/Alphas/T_DustParticles02.png",
						"useRandomColor": true,
						"maxCount": 18
					},
					"x": 0.48477,
					"y": 0.67644,
					"z": 1.67791,
					"scaleX": 0.78,
					"scaleY": 0.47,
					"scaleZ": 0.77,
					"rotationX": 18.4,
					"rotationY": 17.8,
					"rotationZ": 4.9,
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
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
									"wrapRepeat": true
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
										"alpha": 0.35,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/circGrad3.jpg"
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
													"mode": 0,
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
													"mode": 0,
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
											0.7176470588235294,
											0.5019607843137255,
											0.27058823529411763
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "light",
					"name": "Main_Light_0",
					"editorOnly": true,
					"x": 0.01,
					"y": 1.5,
					"z": 2.08,
					"rotationX": 3,
					"rotationY": 12.8,
					"rotationZ": -93.1,
					"kind": "Spot",
					"color": 16772306,
					"power": 1.74,
					"range": 3.16,
					"zNear": 0.02,
					"angle": 39.43,
					"fallOff": 15.68,
					"shadows": {
						"mode": "Dynamic",
						"size": 2048,
						"radius": 0,
						"quality": 1,
						"bias": 0.001,
						"samplingMode": {
							"kind": "None"
						}
					}
				},
				{
					"type": "model",
					"name": "Baron",
					"source": "Character/Harkonnen/Leader/Baron.fbx",
					"editorOnly": true,
					"rotationZ": 180
				},
				{
					"type": "object",
					"name": "Corners",
					"x": 0.35492999999999997,
					"y": -0.42872,
					"z": 1.33297,
					"children": [
						{
							"type": "object",
							"name": "BottomRightCorner",
							"x": 0.91038,
							"y": -0.0753,
							"z": -0.53717,
							"scaleX": 0.85,
							"scaleY": 0.85,
							"scaleZ": 0.85,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"x": -0.01414,
									"y": 0.00197,
									"z": -0.02974,
									"scaleX": 0.4999999999999999,
									"scaleY": 0.4999999999999999,
									"scaleZ": 0.5,
									"rotationY": -13.2,
									"rotationZ": 81.1,
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
											"rotationX": -90,
											"children": [
												{
													"type": "object",
													"name": "Line2",
													"enabled": false,
													"x": -0.00485,
													"y": 0.07296,
													"z": -0.07117,
													"scaleX": 1.0000000000000002,
													"scaleY": 1.0000000000000002,
													"scaleZ": 1.0000000000000002,
													"children": [
														{
															"type": "polygon",
															"name": "polygon - line2",
															"y": -4.440892098500626e-16,
															"z": 8.881784197001252e-16,
															"scaleX": 1.9999999999999996,
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
																		"alpha": 0.7,
																		"uScale": 1,
																		"vScale": 0.25,
																		"uOffset": 0,
																		"vOffset": -0.75,
																		"texture": "Fx/Alphas/T_UI_WoblyLines_Invert.png"
																	}
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.43137254901960786,
																			0.2196078431372549,
																			0.10588235294117647
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
																		"width": 0.43,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/Cyl01v_A.png",
																		"uvShift": [
																			0.2,
																			0
																		],
																		"uvShiftSpeed": [
																			-0.1,
																			0
																		]
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "progress",
																			"enabled": false,
																			"loop": true,
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
																			]
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon - line2",
															"y": -4.440892098500626e-16,
															"z": 8.881784197001252e-16,
															"scaleX": 1.9999999999999996,
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
																		"alpha": 0.5,
																		"uScale": 1,
																		"vScale": 0.25,
																		"uOffset": 0,
																		"vOffset": -0.75,
																		"texture": "Fx/Alphas/T_UI_WoblyLines_Invert.png"
																	}
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.43137254901960786,
																			0.2196078431372549,
																			0.10588235294117647
																		]
																	}
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - Dottedline1",
													"enabled": false,
													"x": 0.0016175000000000495,
													"y": 0.016152500000000014,
													"z": -0.0035999999999987153,
													"scaleX": 2,
													"scaleY": 0.5000000000000001,
													"scaleZ": 1.2,
													"rotationX": -89.99999999999999,
													"rotationY": 45,
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
																"alpha": 1,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_UI_WoblyLines_DottedLines_Invert.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.43137254901960786,
																	0.2196078431372549,
																	0.10588235294117647
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
																"texture": "Fx/Gradients/dGrad04.png",
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
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 10,
																			"value": 0,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "progress",
																	"loop": true,
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
																	]
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 0.0016175000000000495,
													"y": -0.07494749999999994,
													"z": 0.08750000000000124,
													"scaleX": 2,
													"scaleY": 0.5000000000000001,
													"scaleZ": 1.2,
													"rotationX": -89.99999999999999,
													"rotationY": 45,
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
																"alpha": 1,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_UI_WoblyLines_Invert.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.43137254901960786,
																	0.2196078431372549,
																	0.10588235294117647
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
																	"loop": true,
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
																	]
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - line1",
													"x": 0.00162,
													"y": -0.07495,
													"z": 0.0875,
													"scaleX": 2,
													"scaleY": 0.5000000000000001,
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
																"texture": "Fx/Alphas/T_UI_WoblyLines_Invert.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.43137254901960786,
																	0.2196078431372549,
																	0.10588235294117647
																]
															}
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
							"x": 0.8472999999999999,
							"z": 0.9196499999999999,
							"scaleX": 0.85,
							"scaleY": 0.85,
							"scaleZ": 0.85,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"x": -0.00216,
									"y": 0.00658,
									"z": -0.0516,
									"scaleX": 0.4999999999999999,
									"scaleY": 0.4999999999999999,
									"scaleZ": 0.5,
									"rotationY": -7.6,
									"rotationZ": 108.2,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon - line1",
											"y": 0.10793,
											"z": -0.65242,
											"scaleX": 2,
											"scaleY": 0.5,
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
														"texture": "Fx/Alphas/T_UI_WoblyLines.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.43137254901960786,
															0.2196078431372549,
															0.10588235294117647
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon - line1",
											"y": 0.10793,
											"z": -0.65242,
											"scaleX": 2,
											"scaleY": 0.5,
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.43137254901960786,
															0.2196078431372549,
															0.10588235294117647
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
															"loop": true,
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
															]
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon - Dottedline1",
											"y": 0.19903,
											"z": -0.74352,
											"scaleX": 2,
											"scaleY": 0.5,
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_WoblyLines_DottedLines.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.43137254901960786,
															0.2196078431372549,
															0.10588235294117647
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
															"loop": true,
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
															]
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Line2",
											"x": -0.006469999999999976,
											"y": 0.3166199999999999,
											"z": -0.9113200000000004,
											"rotationX": -8.01576287147927e-20,
											"rotationY": 1.987846675914698e-16,
											"rotationZ": 1.171894436484634e-17,
											"children": [
												{
													"type": "polygon",
													"name": "polygon - line2",
													"y": -4.440892098500626e-16,
													"z": 8.881784197001252e-16,
													"scaleX": 1.9999999999999996,
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
																"alpha": 0.7,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": -0.75,
																"texture": "Fx/Alphas/T_UI_WoblyLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.43137254901960786,
																	0.2196078431372549,
																	0.10588235294117647
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
																"width": 0.43,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl01v_A.png",
																"uvShift": [
																	0.2,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "progress",
																	"enabled": false,
																	"loop": true,
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
																	]
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - line2",
													"y": -4.440892098500626e-16,
													"z": 8.881784197001252e-16,
													"scaleX": 1.9999999999999996,
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
																"vOffset": -0.75,
																"texture": "Fx/Alphas/T_UI_WoblyLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.43137254901960786,
																	0.2196078431372549,
																	0.10588235294117647
																]
															}
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
							"x": -1.8434,
							"z": -0.35009,
							"scaleX": 0.85,
							"scaleY": 0.85,
							"scaleZ": 0.85,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"x": -0.00216,
									"y": 0.00658,
									"z": -0.0516,
									"scaleX": 0.4999999999999999,
									"scaleY": 0.4999999999999999,
									"scaleZ": 0.5,
									"rotationY": -7.6,
									"rotationZ": 108.2,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon - line1",
											"y": 0.10793,
											"z": -0.65242,
											"scaleX": 2,
											"scaleY": 0.5,
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
														"texture": "Fx/Alphas/T_UI_WoblyLines.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.43137254901960786,
															0.2196078431372549,
															0.10588235294117647
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon - line1",
											"y": 0.10793,
											"z": -0.65242,
											"scaleX": 2,
											"scaleY": 0.5,
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.43137254901960786,
															0.2196078431372549,
															0.10588235294117647
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
															"loop": true,
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
															]
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon - Dottedline1",
											"y": 0.19903,
											"z": -0.74352,
											"scaleX": 2,
											"scaleY": 0.5,
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_WoblyLines_DottedLines.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.43137254901960786,
															0.2196078431372549,
															0.10588235294117647
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
															"loop": true,
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
															]
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Line2",
											"x": -0.006469999999999976,
											"y": 0.3166199999999999,
											"z": -0.9113200000000004,
											"rotationX": -8.01576287147927e-20,
											"rotationY": 1.987846675914698e-16,
											"rotationZ": 1.171894436484634e-17,
											"children": [
												{
													"type": "polygon",
													"name": "polygon - line2",
													"y": -4.440892098500626e-16,
													"z": 8.881784197001252e-16,
													"scaleX": 1.9999999999999996,
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
																"alpha": 0.7,
																"uScale": 1,
																"vScale": 0.25,
																"uOffset": 0,
																"vOffset": -0.75,
																"texture": "Fx/Alphas/T_UI_WoblyLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.43137254901960786,
																	0.2196078431372549,
																	0.10588235294117647
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
																"width": 0.43,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl01v_A.png",
																"uvShift": [
																	0.2,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "progress",
																	"enabled": false,
																	"loop": true,
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
																	]
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon - line2",
													"y": -4.440892098500626e-16,
													"z": 8.881784197001252e-16,
													"scaleX": 1.9999999999999996,
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
																"vOffset": -0.75,
																"texture": "Fx/Alphas/T_UI_WoblyLines.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.43137254901960786,
																	0.2196078431372549,
																	0.10588235294117647
																]
															}
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
				},
				{
					"type": "object",
					"name": "Godray",
					"x": 1.7178,
					"y": -1.83886,
					"z": 3.01518,
					"rotationX": -69.2,
					"rotationY": 44.7,
					"rotationZ": -6.4,
					"children": [
						{
							"type": "model",
							"name": "SM_GodRayPlane01",
							"source": "Fx/UI/SM_GodRayPlane01.fbx",
							"y": 0.45156,
							"z": -0.26015,
							"scaleX": 100,
							"scaleY": 125,
							"scaleZ": 50,
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
											"textureWrap": true,
											"emissive": 0.75
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
										"texture": "Fx/Alphas/RaysDissolve_02_1024.png"
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
										"alpha": 1.1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square03_1024.jpg.png"
									}
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
										"shiftSpeedY": 0,
										"USE_SOURCE_UV": true
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
										"progress": 0.3,
										"saturation": 0.65,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/RaysDissolve_09_1024.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.03,
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
										"progress": 0.44,
										"saturation": 1,
										"width": 0.64,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/dGrad04.png",
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.4
									}
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.7372549019607844,
											0.7411764705882353,
											0.8549019607843137
										],
										"pointA": 0.75,
										"colorB": [
											0.5490196078431373,
											0.2196078431372549,
											0.09803921568627451
										],
										"pointB": 0
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Godrayred",
					"x": -2.83782,
					"y": -0.11713,
					"z": 3.23419,
					"scaleX": 0.85,
					"scaleY": 0.85,
					"scaleZ": 0.85,
					"rotationX": -72.3,
					"rotationY": -34.2,
					"rotationZ": -31.6,
					"children": [
						{
							"type": "model",
							"name": "SM_GodRayPlane01",
							"source": "Fx/UI/SM_GodRayPlane01.fbx",
							"x": 0.26179,
							"y": 1.3241,
							"z": -0.26015,
							"scaleX": 100,
							"scaleY": 125,
							"scaleZ": 50,
							"rotationZ": 14.4,
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
											"textureWrap": true,
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
										"texture": "Fx/Alphas/RaysDissolve_02_1024.png"
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
										"alpha": 1.1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square03_1024.jpg.png"
									}
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
										"shiftSpeedY": 0,
										"USE_SOURCE_UV": true
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
										"progress": 0.3,
										"saturation": 0.65,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/RaysDissolve_09_1024.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.03,
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
										"progress": 0.43,
										"saturation": 1,
										"width": 0.64,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.4
									}
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											1,
											0.08627450980392157,
											0.0784313725490196
										],
										"pointA": 0.52,
										"colorB": [
											0.5490196078431373,
											0.2196078431372549,
											0.09803921568627451
										],
										"pointB": 0
									}
								}
							]
						}
					]
				}
			]
		},
		{
			"type": "subFX",
			"name": "TestsVernius_drone",
			"source": "Fx/Leader/Vernius/TestsVernius_drone.fx",
			"enabled": false,
			"x": -0.51484,
			"y": -0.32213,
			"z": 1.85747,
			"scaleX": 0.1,
			"scaleY": 0.1,
			"scaleZ": 0.1,
			"rotationZ": 163.7
		}
	]
}