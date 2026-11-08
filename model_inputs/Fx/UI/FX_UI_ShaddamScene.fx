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
						"emitRate": 30,
						"maxCount": 125,
						"useRandomColor": true,
						"randomColor1": [
							1,
							0.6509803921568628,
							0.4666666666666667,
							1
						],
						"randomColor2": [
							0.996078431372549,
							0.9098039215686274,
							0.5490196078431373,
							0.6941176470588235
						],
						"instSpeed": [
							0,
							0,
							-0.02
						]
					},
					"x": -1.66232,
					"y": -1.57723,
					"z": 1.23899,
					"scaleX": 1.12,
					"scaleY": 1.19,
					"scaleZ": 2.37,
					"rotationY": -2.3,
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
										"alpha": 1,
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
						"instScale": 0.018,
						"instScale_rand": 0.01,
						"instSpeed_rand": [
							0.02,
							0.02,
							0.02
						],
						"warmUpTime": 10,
						"emitRate": 8,
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
						"useRandomColor": true
					},
					"x": 0.18209,
					"y": 0.48757,
					"z": 1.70258,
					"scaleX": 0.78,
					"scaleY": 0.47,
					"scaleZ": 0.77,
					"rotationX": 21,
					"rotationY": 14.5,
					"rotationZ": 14.4,
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
											"depthTest": "LessEqual",
											"emissive": 1
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
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.45,
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
											0.996078431372549,
											0.9098039215686274,
											0.5490196078431373
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "BottomRightCorner",
					"x": 0.54009,
					"y": -0.78861,
					"z": 1.00003,
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
											"x": -0.004852499999999926,
											"y": 0.13374249999999988,
											"z": -0.17139999999999933,
											"scaleX": 1.0000000000000002,
											"scaleY": 1.0000000000000002,
											"scaleZ": 1.0000000000000002,
											"rotationX": -4.802242439644131e-19,
											"rotationY": 3.9756933518293955e-16,
											"rotationZ": -1.5879272530900751e-15,
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
					"name": "Shaddam",
					"source": "Character/Imperial/Leader/Shaddam.fbx",
					"editorOnly": true,
					"rotationZ": 180
				},
				{
					"type": "object",
					"name": "RightCorner",
					"x": 0.52519,
					"y": -1.93422,
					"z": 2.37201,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"scaleY": 0.9999999999999998,
							"rotationX": 8.206873585902934e-16,
							"rotationY": -14.3339607291465,
							"rotationZ": 45.64245228461301,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon_Circle",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_1.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 150,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_Dots",
									"scaleX": 1.275,
									"scaleY": 1.275,
									"scaleZ": 1.275,
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_Dots.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1000,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_DottedLines",
									"scaleX": 0.85,
									"scaleY": 0.85,
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_Dots.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 250,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_DottedLines",
									"scaleX": 1.6,
									"scaleY": 1.6,
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
												"alpha": 0.9,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_Dots.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 250,
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
							"type": "lookAt",
							"name": "lookAt",
							"scaleY": 0.9999999999999998,
							"rotationX": 8.206873585902934e-16,
							"rotationY": -14.3339607291465,
							"rotationZ": 45.64245228461301,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon_DottedLines",
									"x": -2.220446049250313e-16,
									"scaleX": 0.625,
									"scaleY": 0.625,
									"scaleZ": 0.625,
									"rotationX": 89.99999999999999,
									"rotationY": 46.332658481507146,
									"rotationZ": 89.99999999999999,
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_DottedLines.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 500,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_2",
									"scaleX": 0.775,
									"scaleY": 0.775,
									"scaleZ": 0.5,
									"rotationX": 45,
									"rotationY": 90,
									"rotationZ": 45,
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_1.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 75,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_2",
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.5,
									"rotationX": 45,
									"rotationY": 90,
									"rotationZ": 45,
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_1.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 50,
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
					"name": "RightCorner",
					"x": -4.24233,
					"y": -1.93422,
					"z": 0.08676,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"scaleY": 0.9999999999999998,
							"rotationX": 8.206873585902934e-16,
							"rotationY": -14.3339607291465,
							"rotationZ": 45.64245228461301,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon_Circle",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_1.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 150,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_Dots",
									"scaleX": 1.275,
									"scaleY": 1.275,
									"scaleZ": 1.275,
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_Dots.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1000,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_DottedLines",
									"scaleX": 0.85,
									"scaleY": 0.85,
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_Dots.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 250,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_DottedLines",
									"scaleX": 1.6,
									"scaleY": 1.6,
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
												"alpha": 0.9,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_Dots.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 250,
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
							"type": "lookAt",
							"name": "lookAt",
							"scaleY": 0.9999999999999998,
							"rotationX": 8.206873585902934e-16,
							"rotationY": -14.3339607291465,
							"rotationZ": 45.64245228461301,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon_DottedLines",
									"x": -2.220446049250313e-16,
									"scaleX": 0.625,
									"scaleY": 0.625,
									"scaleZ": 0.625,
									"rotationX": 89.99999999999999,
									"rotationY": 46.332658481507146,
									"rotationZ": 89.99999999999999,
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_DottedLines.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 500,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_2",
									"scaleX": 0.775,
									"scaleY": 0.775,
									"scaleZ": 0.5,
									"rotationX": 45,
									"rotationY": 90,
									"rotationZ": 45,
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_1.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 75,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_2",
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.5,
									"rotationX": 45,
									"rotationY": 90,
									"rotationZ": 45,
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Circle_1.png"
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
											"type": "curve",
											"name": "rotation.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 50,
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
					"name": "Godray",
					"x": -2.79367,
					"y": -2.20674,
					"z": 3.3,
					"scaleX": 0.84,
					"scaleY": 0.84,
					"scaleZ": 0.84,
					"rotationX": -86.6,
					"rotationY": 2,
					"rotationZ": -21.5,
					"children": [
						{
							"type": "model",
							"name": "SM_GodRayPlane01",
							"source": "Fx/UI/SM_GodRayPlane01.fbx",
							"y": 0.45156,
							"z": -0.26015,
							"scaleX": 100,
							"scaleY": 150,
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
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
											0.9254901960784314,
											0.8235294117647058
										],
										"pointA": 0.42,
										"colorB": [
											0.8588235294117647,
											0.7411764705882353,
											0.5137254901960784
										],
										"pointB": 0
									}
								}
							]
						},
						{
							"type": "model",
							"name": "SM_GodRayPlane01",
							"source": "Fx/UI/SM_GodRayPlane01.fbx",
							"y": 0.45156,
							"z": -0.26015,
							"scaleX": 50,
							"scaleY": 150,
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
											0.2,
											0
										],
										"uvShiftSpeed": [
											-0.025,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.3
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
											0.9254901960784314,
											0.8235294117647058
										],
										"pointA": 0.47,
										"colorB": [
											0.8588235294117647,
											0.7411764705882353,
											0.5137254901960784
										],
										"pointB": 0
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": false,
								"wrap": true,
								"progress": 0.46,
								"saturation": 1,
								"width": 0.5,
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
						}
					]
				}
			]
		}
	]
}