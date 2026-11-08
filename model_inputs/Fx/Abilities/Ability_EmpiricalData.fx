{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"x": 528.65001,
			"y": 1111.05802,
			"z": 0.02,
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
			"name": "Units",
			"enabled": false,
			"editorOnly": true,
			"children": [
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": -1.5,
					"y": -1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				},
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": 1.5,
					"y": -1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				},
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": 1.5,
					"y": 1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				},
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": -1.5,
					"y": 1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.8,
			"scaleY": 0.8,
			"scaleZ": 0.8,
			"children": [
				{
					"type": "object",
					"name": "logo",
					"enabled": false,
					"x": -1.5407439555097887e-33,
					"y": 0.19439333333333336,
					"z": -0.19131166666666666,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.5,
					"children": [
						{
							"type": "advancedDecal",
							"name": "logo",
							"scaleX": 25,
							"scaleY": 25,
							"scaleZ": 30,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_Logo_CommunicationJamming.png"
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
													"value": 0.25,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.15333333333333335
													}
												},
												{
													"time": 2,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 4,
													"value": 0.25,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499999999999996
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666674
													}
												}
											],
											"loop": true
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
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0.2
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 0.700096015930177,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.710096015930177,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8724153709411628,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3808261871337897,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.39082618713379,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5125998115539558,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5225998115539559,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7153284645080569,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.995,
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
							"type": "advancedDecal",
							"name": "outsidecircle",
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 50,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"alpha": 0.75,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_Target1.png"
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
													"value": 0.25,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.15333333333333335
													}
												},
												{
													"time": 2,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 4,
													"value": 0.25,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499999999999996
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666674
													}
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4949999999999999,
											"value": 0.99,
											"prevHandle": {
												"dv": -0.125,
												"dt": -1.085
											},
											"nextHandle": {
												"dv": 0.0191555190995555,
												"dt": 0.1662699057841416
											}
										},
										{
											"time": 1.9999999999999998,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4,
											"value": 1
										}
									],
									"loop": true
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.0160535573959348,
											"value": 0.99,
											"prevHandle": {
												"dv": -0.056477272727272654,
												"dt": -0.5160535573959348
											},
											"nextHandle": {
												"dv": 0.018433924306061934,
												"dt": 0.16634856728808406
											}
										},
										{
											"time": 1.5210535573959347,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.021053557395935,
											"value": 1
										}
									],
									"loop": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0.2
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 0.700096015930177,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.710096015930177,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8724153709411628,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1258261871337898,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.13582618713379,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.257599811553956,
													"value": 1,
													"mode": 2
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0.2
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 0.700096015930177,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.710096015930177,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8724153709411628,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3808261871337897,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.39082618713379,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5125998115539558,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5225998115539559,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7153284645080569,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.995,
													"value": 1,
													"mode": 2
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 4,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
										"uvShift": [
											0.2,
											0.1
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
													"time": 0.700096015930177,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.710096015930177,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8724153709411628,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1258261871337898,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.13582618713379,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.257599811553956,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.267599811553956,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.460328464508057,
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
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.5,
								"sandColorSet": false,
								"envBlend": 1,
								"envColorSet": false
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
												"dv": -0.04114912760556359,
												"dt": -0.49996190040761035
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.405
											}
										},
										{
											"time": 0.9940525627136232,
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
					"name": "Operation",
					"z": 2.335636666666667,
					"scaleX": 1.45,
					"scaleY": 1.45,
					"scaleZ": 0.96,
					"children": [
						{
							"type": "object",
							"name": "Circuit",
							"z": 1.7417525,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_CircuitFond",
									"z": 8.333333338939042e-7,
									"scaleX": 150.00000000000003,
									"scaleY": 150.00000000000003,
									"scaleZ": 50,
									"rotationZ": -89.99999999999999,
									"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
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
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.25,
												"uScale": 1.2,
												"vScale": 1.2,
												"uOffset": -0.1,
												"vOffset": -0.1,
												"texture": "Fx/Alphas/PatternCircuit02.png"
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0.05078125,
																"color": -97577584
															},
															{
																"position": 0.6015625,
																"color": -191889153
															},
															{
																"position": 1,
																"color": -187921665
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
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.25,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/circGrad01.png",
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
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Circuit",
									"z": 8.333333338939042e-7,
									"scaleX": 150.00000000000003,
									"scaleY": 150.00000000000003,
									"scaleZ": 50,
									"rotationZ": -89.99999999999999,
									"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
									"emissive": 3,
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
													"emissive": 2
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
													1,
													1
												]
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
												"alpha": 0.25,
												"uScale": 1.2,
												"vScale": 1.2,
												"uOffset": -0.1,
												"vOffset": -0.1,
												"texture": "Fx/Alphas/PatternCircuit02.png"
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
												"progress": 0.33,
												"saturation": 1,
												"width": 0.8,
												"uvScaleX": 3,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.2,
													0.01
												]
											}
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.25,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.25,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/circGrad01.png",
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
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Circuit",
									"z": 8.333333338939042e-7,
									"scaleX": 150.00000000000003,
									"scaleY": 150.00000000000003,
									"scaleZ": 50,
									"rotationZ": -89.99999999999999,
									"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
									"emissive": 3,
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
													"emissive": 1
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
													1,
													1
												]
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
												"alpha": 0.25,
												"uScale": 1.2,
												"vScale": 1.2,
												"uOffset": -0.1,
												"vOffset": -0.1,
												"texture": "Fx/Alphas/PatternCircuit02.png"
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
												"progress": 0.33,
												"saturation": 1,
												"width": 0.8,
												"uvScaleX": 3,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0.2
												]
											}
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.25,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.25,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/circGrad01.png",
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
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Circuittest",
									"z": -0.0000024999999999053557,
									"scaleX": 125.00000000000003,
									"scaleY": 125.00000000000003,
									"scaleZ": 41.67,
									"rotationZ": -89.99999999999999,
									"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
									"emissive": 3,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "Spinner",
											"source": "hrt.shader.Spinner",
											"props": {
												"scaleX": 0.13,
												"scaleY": 0.7,
												"scaleTime": 0.04,
												"timeOffset": 0,
												"correctTextureNormals": false,
												"numTrails": 10,
												"useTimeTexture": false,
												"debugShowShape": false,
												"shapeSDF": "Fx/Alphas/PatternCircuit02.png",
												"trailTexture": "Fx/Alphas/T_Spinner01.png",
												"timeTexture": null
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
												"progress": 0.33,
												"saturation": 1,
												"width": 0.9,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0.2
												]
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
												"progress": 0.27,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
												"alpha": 0.5
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
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/circGrad01.png",
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
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 9.61172518910566e-17,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.0006682254168133839,
														"dt": 0.7862882814207282
													}
												},
												{
													"time": 1.2147435541753175,
													"value": 1,
													"prevHandle": {
														"dv": -0.4652462244089647,
														"dt": -0.22052844921192094
													},
													"nextHandle": {
														"dv": 0.21038801208152544,
														"dt": 0.09980922588497793
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
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Fire.png",
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 9.61172518910566e-17,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.0006682254168133839,
														"dt": 0.7862882814207282
													}
												},
												{
													"time": 1.2147435541753175,
													"value": 1,
													"prevHandle": {
														"dv": -0.4652462244089647,
														"dt": -0.22052844921192094
													},
													"nextHandle": {
														"dv": 0.21038801208152544,
														"dt": 0.09980922588497793
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6847962056646442,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6947962056646442,
											"value": 2,
											"prevHandle": {
												"dv": 0,
												"dt": -0.03616334778362549
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0469946109390483
											}
										},
										{
											"time": 1.0170173390101158,
											"value": 1,
											"prevHandle": {
												"dv": 0.01220930422611688,
												"dt": -0.15055761118080818
											},
											"nextHandle": {
												"dv": -0.01220930422611688,
												"dt": 0.15055761118080818
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Dots",
							"z": 1.741753333333334,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Dots",
									"scaleX": 150.00000000000003,
									"scaleY": 150.00000000000003,
									"scaleZ": 50,
									"rotationZ": -89.99999999999999,
									"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.2
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
													1,
													1
												]
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
												"progress": 0.82,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/bluenoise_raw.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.075,
													0
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Dots",
									"scaleX": 150.00000000000003,
									"scaleY": 150.00000000000003,
									"scaleZ": 50,
									"rotationZ": -89.99999999999999,
									"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.2
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
													1,
													1
												]
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
												"progress": 0.82,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/bluenoise_raw.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.075,
													0
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
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
													"time": 0.41467224467884434,
													"value": 0,
													"prevHandle": {
														"dv": -0.05140481118718075,
														"dt": -0.4999567230708499
													},
													"nextHandle": {
														"dv": 0.037388481077600726,
														"dt": 0.484847547624495
													}
												},
												{
													"time": 1.0047827467218151,
													"value": 1,
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
													"value": 0,
													"prevHandle": {
														"dv": -0.04114912760556359,
														"dt": -0.49996190040761035
													},
													"nextHandle": {
														"dv": 0.03333333333333333,
														"dt": 0.405
													}
												},
												{
													"time": 0.9940525627136232,
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
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.5,
								"sandColorSet": false,
								"envBlend": 1,
								"envColorSet": false
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}