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
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "SandBackup",
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Sand1",
							"enabled": false,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"alpha": 0.9,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.3,
										"saturation": 0,
										"width": 0.49,
										"uvScaleX": 2,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.1
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.7,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 0.08,
										"texture": "Fx/noise/perlin06.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.05
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Sand2",
							"scaleX": 150,
							"scaleY": 150,
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
										"alpha": 1.1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.52,
										"saturation": 0,
										"width": 0.28,
										"uvScaleX": 1.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.2
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
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
										"progress": 0.7,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 0.08,
										"texture": "Fx/noise/perlin06.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.1
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
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
									0.9686274509803922,
									0.8549019607843137,
									0.7764705882352941
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.9,
								"sandColorSet": false,
								"envBlend": 0.85,
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
											"mode": 0,
											"prevHandle": {
												"dv": 2.0415445129270002e-16,
												"dt": -0.5001142813622025
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.565
											}
										},
										{
											"time": 1.9949999999999999,
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
					"name": "logo",
					"enabled": false,
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
										"texture": "Fx/Alphas/T_Logo_FremenSabotage.png"
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
					"type": "advancedDecal",
					"name": "Sand",
					"enabled": false,
					"scaleX": 150,
					"scaleY": 150,
					"scaleZ": 16.67,
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
								"alpha": 0.8,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 1,
								"vOffset": 1,
								"texture": "Fx/Alphas/T_SpiceAlpha.png"
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.3,
								"saturation": 0,
								"width": 0.49,
								"uvScaleX": 2,
								"uvScaleY": 1,
								"texture": "Fx/noise/Wave_01.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									-0.1
								],
								"uvScaleSpeed": [
									0,
									0
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.68,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 0.08,
								"texture": "Fx/noise/perlin06.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									-0.05
								],
								"uvScaleSpeed": [
									0,
									0
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.9,
								"sandColorSet": false,
								"envBlend": 0.85,
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
											"mode": 0,
											"prevHandle": {
												"dv": 2.0415445129270002e-16,
												"dt": -0.5001142813622025
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.565
											}
										},
										{
											"time": 1.9949999999999999,
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
					"name": "CrossPattern",
					"enabled": false,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Pattern",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 45,
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
										"uScale": 6,
										"vScale": 6,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Pattern03.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.86,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									},
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.86,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.075,
													0.05
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Inside",
							"children": [
								{
									"type": "advancedDecal",
									"name": "HextileInside",
									"scaleX": 150,
									"scaleY": 150,
									"scaleZ": 50,
									"rotationZ": 45.00000000000001,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "BeforeTonemapping",
									"children": [
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
												"alpha": 0.8,
												"uScale": 6,
												"vScale": 6,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/Pattern03_Inside02.png"
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
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.5
															}
														},
														{
															"time": 2.5,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.5
															}
														},
														{
															"time": 4,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.5
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
												"useScale": false,
												"wrap": true,
												"progress": 0.32,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.86,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.075,
													0.05
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "HextileInside",
									"scaleX": 150,
									"scaleY": 150,
									"scaleZ": 50,
									"rotationZ": 45.00000000000001,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "BeforeTonemapping",
									"children": [
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
												"alpha": 0.8,
												"uScale": 6,
												"vScale": 6,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/Pattern03_Inside01.png"
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
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.5
															}
														},
														{
															"time": 1.5,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.5
															}
														},
														{
															"time": 3,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
															}
														},
														{
															"time": 4,
															"value": 0,
															"mode": 0
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
												"useScale": false,
												"wrap": true,
												"progress": 0.32,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.86,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.075,
													0.05
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "PatternGlow",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 45.00000000000001,
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
										"alpha": 0.75,
										"uScale": 6,
										"vScale": 6,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Pattern03.png"
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.5
													}
												},
												{
													"time": 2,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.5
													}
												},
												{
													"time": 4,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.5
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
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.89,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
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
					"name": "group",
					"enabled": false,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Pattern",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
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
										"alpha": 0.1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
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
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2,
													"value": 0,
													"mode": 0,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": false,
										"progress": 0.35,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3.5,
										"uvScaleY": 4,
										"texture": "Fx/Alphas/Pattern04_scan.png",
										"uvShift": [
											0,
											0.465
										],
										"uvShiftSpeed": [
											0,
											-0.5
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333326,
														"dt": -0.6127117714791925
													},
													"nextHandle": {
														"dv": -0.018119518866537634,
														"dt": 0.33333012726488687
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
										"progress": 0.86,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											-0.25
										]
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"enabled": false,
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0.45,
										"shiftSpeedY": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"enabled": false,
											"loop": true,
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
										"useScale": false,
										"wrap": true,
										"progress": 0.3,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/Gradients/Cyl11u_A.png",
										"uvShift": [
											0,
											0.1
										],
										"uvShiftSpeed": [
											0,
											-0.5
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333326,
														"dt": -0.6127117714791925
													},
													"nextHandle": {
														"dv": -0.018119518866537634,
														"dt": 0.33333012726488687
													}
												}
											]
										},
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
													"time": 1,
													"value": 0.3,
													"mode": 2
												},
												{
													"time": 2,
													"value": 0.1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "saturation",
											"enabled": false,
											"loop": true,
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
												},
												{
													"time": 2,
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
							"type": "advancedDecal",
							"name": "Pattern",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
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
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
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
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2,
													"value": 0,
													"mode": 0,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": false,
										"progress": 0.35,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/Alphas/Pattern04.png",
										"uvShift": [
											0,
											0.1
										],
										"uvShiftSpeed": [
											0,
											-2
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333326,
														"dt": -0.6127117714791925
													},
													"nextHandle": {
														"dv": -0.018119518866537634,
														"dt": 0.33333012726488687
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
										"progress": 0.86,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											-0.25
										]
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"enabled": false,
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0.45,
										"shiftSpeedY": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"enabled": false,
											"loop": true,
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
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.3,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/Gradients/Cyl11u_A.png",
										"uvShift": [
											0,
											0.1
										],
										"uvShiftSpeed": [
											0,
											-0.5
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333326,
														"dt": -0.6127117714791925
													},
													"nextHandle": {
														"dv": -0.018119518866537634,
														"dt": 0.33333012726488687
													}
												}
											]
										},
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
													"time": 1,
													"value": 0.3,
													"mode": 2
												},
												{
													"time": 2,
													"value": 0.1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "saturation",
											"enabled": false,
											"loop": true,
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
												},
												{
													"time": 2,
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
								"alpha": 0.8
							}
						},
						{
							"type": "advancedDecal",
							"name": "Hextilescan",
							"enabled": false,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"emissive": 5,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"alpha": 1,
										"uScale": 2.5,
										"vScale": 3,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Pattern04.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.3,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/Gradients/Cyl16u_A.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.35
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
										"progress": 0.86,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "testHextile",
					"enabled": false,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Hextile",
							"enabled": false,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"alpha": 0.5,
										"uScale": 4,
										"vScale": 4,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Pattern04_01.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.89,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Hextilescan",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 4,
										"vScale": 4,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Pattern04_01.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
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
										"texture": "Fx/Alphas/Pattern04_scan.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.5
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
										"progress": 0.85,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "HextileInside",
							"enabled": false,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"alpha": 0.85,
										"uScale": 2.5,
										"vScale": 3,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Hextile_hex02-Inside.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.37,
										"saturation": 1,
										"width": 0.93,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/Gradients/Cyl16u_A.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.35
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
										"progress": 0.84,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
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
					"name": "testSabotage_aniso",
					"enabled": false,
					"y": -168.15037,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Hextile",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"alpha": 1,
										"uScale": 4,
										"vScale": 4,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Pattern04_01.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.89,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Hextilescan",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/Alphas/Pattern04_01.png",
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
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 2,
										"vScale": 2,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Pattern04_01.png"
									},
									"isInstance": true
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
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
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
										"texture": "Fx/Alphas/Pattern04_scan.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.5
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
										"progress": 0.85,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"enabled": false,
									"props": {
										"noiseTexture": "Fx/noise/causticTexture_02.png",
										"directionalNoise": false,
										"intensity": 0.4,
										"scrollSpeed": [
											0,
											0
										],
										"scale": [
											1,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/noise/N_AnisotropicPixel03.png",
										"directionalNoise": false,
										"intensity": 1,
										"scrollSpeed": [
											0,
											0
										],
										"scale": [
											1,
											0.5
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "HextileInside",
							"enabled": false,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"alpha": 0.85,
										"uScale": 2.5,
										"vScale": 3,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Hextile_hex02-Inside.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.37,
										"saturation": 1,
										"width": 0.93,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/Gradients/Cyl16u_A.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.35
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
										"progress": 0.84,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
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
					"name": "testSabotage_distort",
					"children": [
						{
							"type": "advancedDecal",
							"name": "Hextile",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03333333333333333,
														"dt": -0.5840237545517254
													},
													"nextHandle": {
														"dv": 0.02755535379334641,
														"dt": 0.4822101582002017
													}
												},
												{
													"time": 2,
													"value": 0,
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
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/Alphas/Pattern04_01.png",
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2,
													"value": -1,
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
										"progress": 0.89,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"enabled": false,
									"props": {
										"noiseTexture": "Fx/noise/Smoke10.png",
										"directionalNoise": false,
										"intensity": 0.48,
										"scrollSpeed": [
											0,
											0.2
										],
										"scale": [
											1,
											0.5
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Hextilescan",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03333333333333333,
														"dt": -0.5840237545517254
													},
													"nextHandle": {
														"dv": 0.02755535379334641,
														"dt": 0.4822101582002017
													}
												},
												{
													"time": 2,
													"value": 0,
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
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/Alphas/Pattern04_01.png",
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2,
													"value": -1,
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
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/Pattern04_scan.png",
										"uvShift": [
											0,
											0.45
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.48,
													"mode": 2
												},
												{
													"time": 2,
													"value": -0.48,
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
										"progress": 0.85,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/noise/T_Noise_Water_04.png",
										"directionalNoise": false,
										"intensity": 0.11,
										"scrollSpeed": [
											0,
											0
										],
										"scale": [
											2,
											2
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03333333333333333,
														"dt": -0.5840237545517254
													},
													"nextHandle": {
														"dv": 0.02755535379334641,
														"dt": 0.4822101582002017
													}
												},
												{
													"time": 2,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "intensity",
											"keyMode": 1,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.00851272713660441,
														"dt": -0.49998634549090837
													},
													"nextHandle": {
														"dv": -0.01712592256322243,
														"dt": 1.0058735935193193
													}
												},
												{
													"time": 2,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.5033482456665492,
														"dt": -0.6068381779598733
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0
													}
												},
												{
													"time": 2,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"enabled": false,
									"props": {
										"noiseTexture": "Fx/noise/N_AnisotropicPixel03.png",
										"directionalNoise": false,
										"intensity": 1,
										"scrollSpeed": [
											0,
											0
										],
										"scale": [
											1,
											0.5
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "HextileInside",
							"enabled": false,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"alpha": 0.85,
										"uScale": 2.5,
										"vScale": 3,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Hextile_hex02-Inside.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.37,
										"saturation": 1,
										"width": 0.93,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/Gradients/Cyl16u_A.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.35
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
										"progress": 0.84,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
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
					"name": "testSabotage_distort",
					"enabled": false,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Hextile",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03333333333333333,
														"dt": -0.5840237545517254
													},
													"nextHandle": {
														"dv": 0.02755535379334641,
														"dt": 0.4822101582002017
													}
												},
												{
													"time": 2,
													"value": 0,
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
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/Alphas/Pattern04_01.png",
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
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2,
													"value": -1,
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
										"progress": 0.89,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Hextilescan",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03333333333333333,
														"dt": -0.5840237545517254
													},
													"nextHandle": {
														"dv": 0.02755535379334641,
														"dt": 0.4822101582002017
													}
												},
												{
													"time": 2,
													"value": 0,
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
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/Alphas/Pattern04_01.png",
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
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2,
													"value": -1,
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
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/Pattern04_scan.png",
										"uvShift": [
											0,
											0.45
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.48,
													"mode": 2
												},
												{
													"time": 2,
													"value": -0.48,
													"mode": 2
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
										"noiseTexture": "Fx/noise/T_Noise_Water_04.png",
										"directionalNoise": false,
										"intensity": 0.11,
										"scrollSpeed": [
											0,
											0
										],
										"scale": [
											2,
											2
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03333333333333333,
														"dt": -0.5840237545517254
													},
													"nextHandle": {
														"dv": 0.02755535379334641,
														"dt": 0.4822101582002017
													}
												},
												{
													"time": 2,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "intensity",
											"keyMode": 1,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.00851272713660441,
														"dt": -0.49998634549090837
													},
													"nextHandle": {
														"dv": -0.01712592256322243,
														"dt": 1.0058735935193193
													}
												},
												{
													"time": 2,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.5033482456665492,
														"dt": -0.6068381779598733
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0
													}
												},
												{
													"time": 2,
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
								"alpha": 0.8
							}
						}
					]
				},
				{
					"type": "object",
					"name": "testSabotage_pattern",
					"enabled": false,
					"y": 156.34121,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Hextile",
							"y": 6.8816,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 4,
										"vScale": 4,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Pattern04_02.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.37,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/Alphas/Pattern04_02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.4
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
										"progress": 0.37,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/Alphas/Pattern04_02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.2
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
										"progress": 0.89,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"enabled": false,
									"props": {
										"noiseTexture": "Fx/noise/Smoke10.png",
										"directionalNoise": false,
										"intensity": 0.48,
										"scrollSpeed": [
											0,
											0.2
										],
										"scale": [
											1,
											0.5
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Hextile",
							"enabled": false,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"alpha": 1,
										"uScale": 4,
										"vScale": 4,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Pattern04_01.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.89,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"enabled": false,
									"props": {
										"noiseTexture": "Fx/noise/Smoke10.png",
										"directionalNoise": false,
										"intensity": 0.48,
										"scrollSpeed": [
											0,
											0.2
										],
										"scale": [
											1,
											0.5
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Hextilescan",
							"enabled": false,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/Alphas/Pattern04_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.5
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 2,
										"vScale": 2,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Pattern04_01.png"
									},
									"isInstance": true
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
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
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
										"texture": "Fx/Alphas/Pattern04_scan.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.5
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
										"progress": 0.85,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/noise/T_Noise_Water_04.png",
										"directionalNoise": false,
										"intensity": 0.27,
										"scrollSpeed": [
											0,
											0
										],
										"scale": [
											1,
											1
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03333333333333333,
														"dt": -0.5840237545517254
													},
													"nextHandle": {
														"dv": 0.02755535379334641,
														"dt": 0.4822101582002017
													}
												},
												{
													"time": 2,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"enabled": false,
									"props": {
										"noiseTexture": "Fx/noise/N_AnisotropicPixel03.png",
										"directionalNoise": false,
										"intensity": 1,
										"scrollSpeed": [
											0,
											0
										],
										"scale": [
											1,
											0.5
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "HextileInside",
							"enabled": false,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"alpha": 0.85,
										"uScale": 2.5,
										"vScale": 3,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Hextile_hex02-Inside.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.37,
										"saturation": 1,
										"width": 0.93,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/Gradients/Cyl16u_A.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.35
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
										"progress": 0.84,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
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