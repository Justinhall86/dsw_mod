{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "logo",
					"x": -1.5407439555097887e-33,
					"y": 0.19439333333333336,
					"z": -0.19131166666666666,
					"scaleX": 1.4,
					"scaleY": 1.4,
					"scaleZ": 1.4,
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.25,
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499999999999996
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666674
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
											"loop": true,
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
											]
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.25,
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499999999999996
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666674
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4949999999999999,
											"value": 0.99,
											"mode": 0,
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
											"value": 1,
											"mode": 0
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"enabled": false,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.0160535573959348,
											"value": 0.99,
											"mode": 0,
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
											"value": 1,
											"mode": 0
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
											"loop": true,
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
											]
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
											"loop": true,
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
											]
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
											"loop": true,
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
											"mode": 0,
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
					"name": "Glitch",
					"z": 2.335636666666667,
					"scaleX": 1.45,
					"scaleY": 1.45,
					"scaleZ": 0.96,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Dots",
							"z": 1.741753333333334,
							"scaleX": 150.00000000000003,
							"scaleY": 150.00000000000003,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.4
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
							"name": "advancedDecal_Waves",
							"z": 1.7417533333333348,
							"scaleX": 150.00000000000006,
							"scaleY": 150.00000000000006,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
							"emissive": 0.25,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.4
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
										"progress": 0.8,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/bluenoise_raw.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
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
										"useScale": true,
										"wrap": true,
										"progress": 0.28,
										"saturation": 1,
										"width": 0.68,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_GlitchNoise01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.15
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
										"progress": 0.28,
										"saturation": 1,
										"width": 0.68,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_GlitchNoise01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.025
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Glitch",
							"z": 0.5938833333333338,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
							"fadePower": 1.64,
							"emissive": 5,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 0,
										"width": 0.49,
										"uvScaleX": 2,
										"uvScaleY": 6,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.25
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"loop": true,
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
										"progress": 1,
										"saturation": 0,
										"width": 0.34,
										"uvScaleX": 2,
										"uvScaleY": 6,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.25
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"loop": true,
											"keys": [
												{
													"time": 0.700096015930177,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.710096015930177,
													"value": 0.6632480621337892,
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
													"value": 0.6632480621337892,
													"mode": 2
												},
												{
													"time": 1.5125998115539558,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5225998115539559,
													"value": 0.6632480621337892,
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
										"progress": 0.62,
										"saturation": 0,
										"width": 0.17,
										"uvScaleX": 4,
										"uvScaleY": 6,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.5
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
											1,
											1
										]
									}
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
		},
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
		}
	]
}