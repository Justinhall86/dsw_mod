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
					"scaleX": 200,
					"scaleY": 200,
					"scaleZ": 200,
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
					"name": "group",
					"z": 0.28565,
					"children": [
						{
							"type": "advancedDecal",
							"name": "NUCLEAR",
							"scaleX": 27,
							"scaleY": 27,
							"scaleZ": 50,
							"albedoMap": "Fx/Alphas/T_NuclearSign.png",
							"fadeStart": 0.95,
							"emissive": 0.5,
							"renderMode": "AfterTonemapping",
							"blendMode": 2,
							"children": [
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
											"time": 10,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											0.12156862745098039,
											0.1843137254901961
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "CIRCLE CUT",
							"scaleX": 90,
							"scaleY": 90,
							"scaleZ": 90,
							"albedoMap": "Fx/Alphas/T_circle_2.png",
							"fadeStart": 0.95,
							"emissive": 0.5,
							"renderMode": "AfterTonemapping",
							"blendMode": 2,
							"children": [
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
											"time": 10,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 0.81,
										"color": [
											1,
											0.12156862745098039,
											0.1843137254901961
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "CIRCLE",
							"scaleX": 65,
							"scaleY": 65,
							"scaleZ": 50,
							"albedoMap": "Fx/Alphas/FloorScan_Round_08.png",
							"fadeStart": 0.95,
							"emissive": 0.5,
							"renderMode": "AfterTonemapping",
							"blendMode": 2,
							"children": [
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
											"time": 10,
											"value": -1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											0.12156862745098039,
											0.1843137254901961
										]
									}
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
											"value": 0.6,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 1.3333333333333333
											}
										},
										{
											"time": 2.5,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0183333333333332,
												"dt": -1.1861251693032677
											},
											"nextHandle": {
												"dv": 0.01838942180092917,
												"dt": 1.2656014816664312
											}
										},
										{
											"time": 5,
											"value": 0.6,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01111111111111096,
												"dt": -1.023321928419171
											},
											"nextHandle": {
												"dv": 0.01111111111111096,
												"dt": 1.023321928419171
											}
										},
										{
											"time": 7.5,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0011111111111110628,
												"dt": -1.136540974699889
											},
											"nextHandle": {
												"dv": -3.375761331355511e-16,
												"dt": 1.2993822408850602
											}
										},
										{
											"time": 10,
											"value": 0.6,
											"mode": 0,
											"prevHandle": {
												"dv": 0.00732954545454545,
												"dt": -1.5465
											},
											"nextHandle": {
												"dv": -0.001173887156453005,
												"dt": 0.24616322671815238
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Range",
							"scaleX": 170,
							"scaleY": 170,
							"scaleZ": 170,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
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
										"alpha": 0.66,
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
													"time": 0.9949999999999999,
													"value": 1,
													"mode": 0,
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
										},
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
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
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0.5,
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											0.12549019607843137,
											0.1843137254901961
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
								"sandBlend": 0.6,
								"sandColorSet": false,
								"envBlend": 0.6,
								"envColorSet": false
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
				}
			]
		}
	]
}