{
	"type": "fx",
	"cullingRadius": 25,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
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
			"enabled": false,
			"children": [
				{
					"type": "object",
					"name": "ELEC",
					"children": [
						{
							"type": "object",
							"name": "haut",
							"enabled": false,
							"x": 0.21672199999999986,
							"y": 0.620196,
							"z": 2.8625039999999995,
							"rotationZ": -6.599999999999992,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"z": -7.105427357601002e-15,
											"scaleX": 8,
											"scaleY": 8,
											"scaleZ": 8,
											"rotationX": 1.0315964937488239e-15,
											"rotationY": 89.99999999999999,
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
															"emissive": 2
														}
													},
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
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													}
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
																		"position": 0.5234375,
																		"color": -8008705
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
												},
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.1,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2,
															"value": 0.5,
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
									"type": "emitter",
									"name": "emitter",
									"props": {
										"lifeTime": 0.1,
										"alignMode": "Screen",
										"emitRate": 8,
										"maxCount": 16,
										"instScale": 4,
										"instScale_rand": 1,
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
															"emissive": 5
														}
													},
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare07.png"
													}
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
																		"position": 0.2890625,
																		"color": -12444212
																	},
																	{
																		"position": 0.51171875,
																		"color": -16735241
																	},
																	{
																		"position": 1,
																		"color": -15597542
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
															1,
															0.8470588235294118,
															0.6823529411764706
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
													"value": 0.2,
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
											"name": "emitRate",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.449481275444196,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.515891443734407,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.610284100833064,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.674774691392225,
													"value": 0,
													"mode": 2
												},
												{
													"time": 6.850716523642044,
													"value": 0,
													"mode": 2
												},
												{
													"time": 6.993784967428039,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.929091844729907,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.939091844729907,
													"value": 0,
													"mode": 2
												},
												{
													"time": 15,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": -0.37274,
									"y": 0.00122,
									"scaleX": 2.25,
									"scaleY": 2.25,
									"scaleZ": 7,
									"rotationX": 3,
									"rotationY": 90,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"renderMode": "BeforeTonemapping",
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
											}
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
																"position": 0.29296875,
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
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1.2,
										"power": 0.8
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
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.19889944428781292,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.0210653948078945,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4581389842907524,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.8309169283723743,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.610284100833064,
													"value": 1,
													"mode": 2
												},
												{
													"time": 6.505798689058579,
													"value": 1,
													"mode": 2
												},
												{
													"time": 9.505798689058583,
													"value": 1,
													"mode": 2
												},
												{
													"time": 10,
													"value": 0,
													"mode": 2
												},
												{
													"time": 15,
													"value": 0,
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
							"name": "bas",
							"enabled": false,
							"x": -0.09318,
							"y": -0.89819,
							"z": -2.69993,
							"rotationZ": -6.599999999999992,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"z": -7.105427357601002e-15,
											"scaleX": 8,
											"scaleY": 8,
											"scaleZ": 8,
											"rotationX": 1.0315964937488239e-15,
											"rotationY": 89.99999999999999,
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
															"emissive": 2
														}
													},
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
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													}
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
																		"position": 0.5234375,
																		"color": -8008705
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
												},
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.1,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2,
															"value": 0.5,
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
									"type": "emitter",
									"name": "emitter",
									"props": {
										"lifeTime": 0.1,
										"alignMode": "Screen",
										"emitRate": 8,
										"maxCount": 16,
										"instScale": 4,
										"instScale_rand": 1,
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
															"emissive": 5
														}
													},
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare07.png"
													}
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
																		"position": 0.2890625,
																		"color": -12444212
																	},
																	{
																		"position": 0.51171875,
																		"color": -16735241
																	},
																	{
																		"position": 1,
																		"color": -15597542
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
															1,
															0.8470588235294118,
															0.6823529411764706
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
													"value": 0.2,
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
											"name": "emitRate",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.449481275444196,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.515891443734407,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.610284100833064,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.674774691392225,
													"value": 0,
													"mode": 2
												},
												{
													"time": 6.850716523642044,
													"value": 0,
													"mode": 2
												},
												{
													"time": 6.993784967428039,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.929091844729907,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.939091844729907,
													"value": 0,
													"mode": 2
												},
												{
													"time": 15,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": -0.37274,
									"y": 0.00122,
									"scaleX": 2.25,
									"scaleY": 2.25,
									"scaleZ": 7,
									"rotationX": 3,
									"rotationY": 90,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"renderMode": "BeforeTonemapping",
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
											}
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
																"position": 0.29296875,
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
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1.2,
										"power": 0.8
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
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.19889944428781292,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.0210653948078945,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4581389842907524,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.8309169283723743,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.610284100833064,
													"value": 1,
													"mode": 2
												},
												{
													"time": 6.505798689058579,
													"value": 1,
													"mode": 2
												},
												{
													"time": 9.505798689058583,
													"value": 1,
													"mode": 2
												},
												{
													"time": 10,
													"value": 0,
													"mode": 2
												},
												{
													"time": 15,
													"value": 0,
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
							"name": "Elec",
							"x": 0.15756,
							"y": -0.2149,
							"z": 0.2231,
							"children": [
								{
									"type": "polygon",
									"name": "testFilament",
									"x": 0.33916,
									"y": 0.14563,
									"z": -0.16776,
									"scaleX": 5.5,
									"scaleY": 5.999999999999999,
									"scaleZ": 6.000000000000001,
									"rotationX": 26,
									"rotationY": -107.8,
									"rotationZ": -111.6,
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
												"texture": "Fx/Alphas/T_Wave03.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
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
												"progress": 0.35,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/FireMask.png",
												"uvShift": [
													0.5,
													0
												],
												"uvShiftSpeed": [
													-3,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/Alphas/TS_Dust_01_1024.png",
												"directionalNoise": false,
												"intensity": 0.4,
												"scrollSpeed": [
													0,
													0.5
												],
												"scale": [
													1,
													1
												]
											}
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
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A.png",
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
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.00769495129365,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.507694951293651,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 4.007694951293653,
															"value": 1.027882292995299,
															"mode": 2
														},
														{
															"time": 4.257694951293653,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 5.610284100833064,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 6.005798689058577,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.505798689058579,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 9.505798689058583,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 10,
															"value": 1,
															"mode": 2
														},
														{
															"time": 15,
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
									"name": "testFilament",
									"x": 0.33916,
									"y": 0.14563,
									"z": -0.16776,
									"scaleX": 5.5,
									"scaleY": 5.999999999999999,
									"scaleZ": 6.000000000000001,
									"rotationX": 26,
									"rotationY": -107.8,
									"rotationZ": -111.6,
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
													"emissive": 2
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
												"texture": "Fx/Alphas/T_Wave03.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
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
												"progress": 0.35,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/FireMask.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-3,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/Alphas/TS_Dust_01_1024.png",
												"directionalNoise": false,
												"intensity": 0.4,
												"scrollSpeed": [
													0,
													1.5
												],
												"scale": [
													1,
													1
												]
											}
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
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A.png",
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
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.00769495129365,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.507694951293651,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 4.007694951293653,
															"value": 1.027882292995299,
															"mode": 2
														},
														{
															"time": 4.257694951293653,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 5.610284100833064,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 6.005798689058577,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.505798689058579,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 9.505798689058583,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 10,
															"value": 1,
															"mode": 2
														},
														{
															"time": 15,
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
									"name": "TestAnimelecfil",
									"x": -0.92037,
									"y": 0.16079,
									"z": -0.21574,
									"scaleX": 6,
									"scaleY": 4,
									"scaleZ": 6,
									"rotationX": -11.2,
									"rotationY": -107.6,
									"rotationZ": -84.6,
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
													"emissive": 1
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": false,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_4x2_05.png",
												"speed": 5,
												"frameDivision": [
													4,
													2
												],
												"totalFrames": 6,
												"startTime": 0,
												"loop": true
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
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0.18359375,
																"color": -9741057
															},
															{
																"position": 0.44140625,
																"color": -16735241
															},
															{
																"position": 0.8203125,
																"color": 4278232055
															},
															{
																"position": 0.90234375,
																"color": -15400929
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
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											}
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
																"color": -6657793
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A.png",
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
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9252885606735115,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3894674567538519,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.449481275444196,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.515891443734407,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 5.610284100833064,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 5.674774691392225,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.850716523642044,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.993784967428039,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 8.929091844729907,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 8.939091844729907,
															"value": 1,
															"mode": 2
														},
														{
															"time": 15,
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