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
					"name": "AttackDistance",
					"scaleX": 0.58,
					"scaleY": 0.58,
					"scaleZ": 0.58,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"editorOnly": true,
							"scaleX": 4000.000000000001,
							"scaleY": 4000.0000000000005,
							"color": -14869219,
							"kind": 0,
							"args": [
								0
							]
						},
						{
							"type": "object",
							"name": "Floor",
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"children": [
								{
									"type": "object",
									"name": "Poison",
									"children": [
										{
											"type": "object",
											"name": "PoisonFloor",
											"z": 5.18567,
											"scaleX": 0.7,
											"scaleY": 0.7,
											"scaleZ": 0.7,
											"children": [
												{
													"type": "advancedDecal",
													"name": "FloorVapors",
													"x": 6.4014,
													"y": 1.05842,
													"scaleX": 160,
													"scaleY": 160,
													"scaleZ": 27,
													"rotationZ": 109.2,
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
																"alpha": 1.2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_PosionAlpha03.png"
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
																"progress": 0.36,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 3,
																"texture": "Fx/Gradients/circGrad3.jpg",
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
																"progress": 0.45,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1.5,
																"uvScaleY": 2,
																"texture": "Fx/noise/Wave_01.jpg",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	-0.02,
																	0.05
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
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 3,
																"power": 0.8
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorMap",
															"source": "shaders/ColorMap.hx",
															"props": {
																"USE_ALPHA": true,
																"colorA": [
																	0.22352941176470587,
																	0.39215686274509803,
																	0.07450980392156863
																],
																"pointA": 0,
																"colorB": [
																	0.40784313725490196,
																	0.4588235294117647,
																	0.16470588235294117
																],
																"pointB": 1
															}
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
																	"time": 64,
																	"value": 1,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "FloorVapors-motif",
													"scaleX": 160,
													"scaleY": 160,
													"scaleZ": 27,
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
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_PosionAlpha03.png"
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
																"progress": 0.45,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1.5,
																"uvScaleY": 2,
																"texture": "Fx/noise/Wave_01.jpg",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	-0.02,
																	0.05
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
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 3,
																"power": 0.8
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
																"progress": 0.42,
																"saturation": 0.39,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/causticTexture-2.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	-0.01,
																	null
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64,
																		"interpolation": "Linear",
																		"colorMode": 0
																	}
																}
															}
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.1,
																"sandColorSet": false,
																"envBlend": 0.3,
																"envColorSet": false
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
																	"time": 0.9959638068297902,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.005396193672220227,
																		"dt": -0.4999945410973484
																	},
																	"nextHandle": {
																		"dv": -0.03333333333333333,
																		"dt": 3.0885631086677323
																	}
																},
																{
																	"time": 6.985467031582633,
																	"value": 1,
																	"mode": 2
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
														"sandBlend": 0.7,
														"sandColorSet": false,
														"envBlend": 0.75,
														"envColorSet": false
													},
													"isInstance": true
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
										},
										{
											"type": "advancedDecal",
											"name": "outsidecircle",
											"scaleX": 90,
											"scaleY": 90,
											"scaleZ": 112.5,
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
														"minAlpha": 0.85,
														"maxAlpha": 1,
														"frequency": 0.25
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
																		"position": 0.07421875,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -8108
																	}
																],
																"resolution": 64,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.7,
														"sandColorSet": false,
														"envBlend": 0.75,
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
					]
				},
				{
					"type": "model",
					"name": "Wraith",
					"source": "Vehicle/Smuggler/Wraith/Wraith.fbx",
					"editorOnly": true,
					"z": 6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Wraith/Anim_Wraith_AttackRange.fbx"
						}
					]
				}
			]
		},
		{
			"type": "constraint",
			"name": "constraint",
			"enabled": false,
			"object": "FXAnimation.FXRoot.AttackDistance",
			"target": "FXAnimation.FXRoot.Wraith.root.B_ROOT.B_Body.B_BigCircle"
		}
	]
}