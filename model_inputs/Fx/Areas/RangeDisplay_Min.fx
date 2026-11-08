{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
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
					"name": "BackupModel",
					"editorOnly": true,
					"children": [
						{
							"type": "areaDisplay",
							"name": "full",
							"borderTexture": "Fx/Areas/vgrad_alpha.png",
							"border": 0.6,
							"renderMode": "AfterTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "areaDisplay",
							"name": "over",
							"borderTexture": "Fx/Areas/vgrad_alpha_dash.png",
							"borderTiling": 20,
							"border": 0.6,
							"renderMode": "AfterTonemapping",
							"sideThickness": 1.69,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.43
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "object",
							"name": "decal_group",
							"children": [
								{
									"type": "advancedDecal",
									"name": "decal",
									"scaleX": 26,
									"scaleY": 26,
									"scaleZ": 26,
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
												"alpha": 0.1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T-InnerGradient.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
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
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "AoE",
					"scaleX": 0.245,
					"scaleY": 0.245,
					"scaleZ": 0.245,
					"children": [
						{
							"type": "object",
							"name": "decal_group",
							"children": [
								{
									"type": "advancedDecal",
									"name": "over",
									"scaleX": 85,
									"scaleY": 85,
									"scaleZ": 85,
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
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_UI_InnerGradient_512_test.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
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
															"time": 0.9949999999999999,
															"value": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.2649999999999999
															},
															"nextHandle": {
																"dv": -2.735044518095755e-16,
																"dt": 0.335
															}
														},
														{
															"time": 1.9999999999999998,
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
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
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
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.5,
												"maxAlpha": 1,
												"frequency": 0.25
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0.07421875,
																"color": -8283567
															},
															{
																"position": 1,
																"color": -8108
															}
														],
														"resolution": 64
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.01,
												"useRGB": false
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "selected",
									"scaleX": 85,
									"scaleY": 85,
									"scaleZ": 85,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_UI_InnerGradient_512_test.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
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
															"time": 0.9949999999999999,
															"value": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.2649999999999999
															},
															"nextHandle": {
																"dv": -2.735044518095755e-16,
																"dt": 0.335
															}
														},
														{
															"time": 1.9999999999999998,
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
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
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
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.6,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0.07421875,
																"color": -8283567
															},
															{
																"position": 1,
																"color": -8108
															}
														],
														"resolution": 64
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.41,
												"sandColorSet": false,
												"envBlend": 0.4,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.01,
												"useRGB": false
											}
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