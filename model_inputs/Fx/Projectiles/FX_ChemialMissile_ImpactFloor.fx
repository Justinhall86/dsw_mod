{
	"type": "fx",
	"duration": 2.5,
	"cullingRadius": 10,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Characters",
					"editorOnly": true,
					"x": -1.17,
					"y": -0.57,
					"children": [
						{
							"type": "model",
							"name": "Male01_HeavyWeaponSquad",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2
						},
						{
							"type": "model",
							"name": "Male01_HeavyWeaponSquad",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"x": 3.25,
							"y": -1.59,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2
						},
						{
							"type": "model",
							"name": "Male01_HeavyWeaponSquad",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"x": 2.71,
							"y": 2.06,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2
						}
					]
				},
				{
					"type": "object",
					"name": "MissileNormal",
					"scaleX": 1.75,
					"scaleY": 1.75,
					"scaleZ": 1.75,
					"children": [
						{
							"type": "object",
							"name": "Explosion",
							"scaleX": 1.75,
							"scaleY": 1.75,
							"scaleZ": 1.75,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Light_advancedDecal",
									"x": 1.0571541983841468,
									"z": 0.38477266124137743,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 20,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
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
													"emissive": 4,
													"depthTest": "LessEqual"
												}
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.07000000000000028,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.142767811320464,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.142767811320464,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.142767811320464,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.142767811320464,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.142767811320464,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15276781132046402,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.15276781132046402,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.15276781132046402,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.15276781132046402,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.15276781132046402,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.1781273096271372,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.1781273096271372,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.1781273096271372,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.1781273096271372,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.1781273096271372,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.1931273096271373,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.1931273096271373,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.1931273096271373,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.1931273096271373,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.1931273096271373,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.21386167997892058,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.21386167997892058,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.21386167997892058,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.28455834290340465,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.28455834290340465,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.28455834290340465,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.3492270339114669,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.3492270339114669,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.3492270339114669,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 1.0228532235939638,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1863074193327504
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1863074193327504
															}
														},
														{
															"time": 1.4793689986282574,
															"value": 0,
															"mode": 2
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
													0.42745098039215684,
													0.6313725490196078,
													0.1764705882352941
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.79,
												"ATTENUATE": true,
												"emissiveMap": "Fx/Gradients/z_FillOrange.png"
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "object",
									"name": "LensFlare",
									"z": 4.02,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"children": [
										{
											"type": "object",
											"name": "Anticipation",
											"enabled": false,
											"scaleX": 0.8,
											"scaleY": 0.8,
											"scaleZ": 0.8,
											"children": [
												{
													"type": "emitter",
													"name": "LensFlare",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0,
														"maxCount": 50,
														"simulationSpace": "World",
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"randomColor2": [
															0.9215686274509803,
															0.9215686274509803,
															0.9215686274509803,
															0.8509803921568627
														],
														"emitAngle": 0,
														"emitRate": 1,
														"instRotation_rand": [
															0,
															0,
															360
														],
														"instScale": 12,
														"emitType": "Burst",
														"burstDelay": 0.12,
														"instWorldSpeed_rand": [
															0,
															0,
															0
														],
														"warmUpTime": -0.05,
														"instOffset": [
															0,
															1,
															0
														],
														"lifeTime": 0.04
													},
													"y": 5.551115123125783e-17,
													"scaleX": 0.09999999999999999,
													"scaleY": 0.09999999999999998,
													"scaleZ": 0.09999999999999998,
													"rotationX": 70,
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
																			"depthTest": "Less",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": true,
																			"parallax": 0,
																			"textureWrap": true,
																			"emissive": 2
																		}
																	},
																	"wrapRepeat": true,
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			1,
																			0.8784313725490196,
																			0.32941176470588235
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMap",
																	"source": "shaders/AlphaMap.hx",
																	"props": {
																		"useSourceUVs": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 1,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_Flare02.png",
																		"onDecal": false
																	},
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0.0049999999999999975,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.03352751080665441,
																						"dt": -0.5098493884736074
																					},
																					"nextHandle": {
																						"dv": -0.032222222222222374,
																						"dt": 0.49000000000000005
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.033333333333333326,
																					"mode": 2
																				}
																			]
																		}
																	]
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 1,
																		"power": 0.8
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
																	},
																	"isInstance": true
																}
															]
														},
														{
															"type": "curve",
															"name": "instScale",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.8,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.2031330657866298,
																		"dt": -0.011491216884901312
																	},
																	"nextHandle": {
																		"dv": 0.1776762318069669,
																		"dt": 0.009999999999999995
																	}
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.004036962159623458,
																		"dt": -0.8049999999999999
																	},
																	"nextHandle": {
																		"dv": 0.0016825760508064648,
																		"dt": 0.3333076171372348
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "LensFlare_blue",
													"enabled": false,
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 1,
														"maxCount": 50,
														"simulationSpace": "World",
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"randomColor2": [
															0.9215686274509803,
															0.9215686274509803,
															0.9215686274509803,
															0.8509803921568627
														],
														"emitAngle": 0,
														"emitRate": 1,
														"instRotation_rand": [
															0,
															0,
															360
														],
														"instScale": 6.5,
														"emitType": "Burst",
														"burstDelay": 0.12,
														"instWorldSpeed_rand": [
															0,
															0,
															0
														],
														"instStretch_rand": [
															1,
															0.2,
															0
														],
														"warmUpTime": -0.1,
														"instOffset": [
															0,
															1,
															0
														],
														"lifeTime": 0.08,
														"seedGroup": 2,
														"burstParticleCount": 2,
														"instStretch": [
															2,
															1,
															1
														]
													},
													"y": 5.551115123125783e-17,
													"scaleX": 0.09999999999999999,
													"scaleY": 0.09999999999999998,
													"scaleZ": 0.09999999999999998,
													"rotationX": 70,
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
																			"depthTest": "Less",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": true,
																			"parallax": 0,
																			"textureWrap": true,
																			"emissive": 8
																		}
																	},
																	"wrapRepeat": true,
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.26666666666666666,
																			0.34901960784313724,
																			0.2
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMap",
																	"source": "shaders/AlphaMap.hx",
																	"props": {
																		"useSourceUVs": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 0.2,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_Flare04.png",
																		"onDecal": false
																	},
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0.0049999999999999975,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.03352751080665441,
																						"dt": -0.5098493884736074
																					},
																					"nextHandle": {
																						"dv": -0.032222222222222374,
																						"dt": 0.49000000000000005
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.033333333333333326,
																					"mode": 2
																				}
																			]
																		}
																	]
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 1,
																		"power": 0.8
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
																	},
																	"isInstance": true
																}
															]
														},
														{
															"type": "curve",
															"name": "instScale",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.8,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.2031330657866298,
																		"dt": -0.011491216884901312
																	},
																	"nextHandle": {
																		"dv": 0.1776762318069669,
																		"dt": 0.009999999999999995
																	}
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.004036962159623458,
																		"dt": -0.8049999999999999
																	},
																	"nextHandle": {
																		"dv": 0.0016825760508064648,
																		"dt": 0.3333076171372348
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "LensFlare",
											"children": [
												{
													"type": "emitter",
													"name": "LensFlare_circle",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 1,
														"maxCount": 5,
														"simulationSpace": "World",
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"randomColor2": [
															0.9215686274509803,
															0.9215686274509803,
															0.9215686274509803,
															0.8509803921568627
														],
														"emitAngle": 0,
														"emitRate": 1,
														"instRotation_rand": [
															0,
															0,
															150
														],
														"instScale": 6,
														"emitType": "Burst",
														"burstDelay": 0.12,
														"instWorldSpeed_rand": [
															0,
															0,
															0
														],
														"instStretch_rand": [
															0,
															0,
															0
														],
														"warmUpTime": -0.1,
														"instOffset": [
															1.5,
															0,
															0
														],
														"instRotation": [
															0,
															0,
															25
														],
														"instOffset_rand": [
															0.2,
															0,
															0
														]
													},
													"y": -0.14500000000000002,
													"z": 0.030000000000000027,
													"scaleX": 0.09999999999999999,
													"scaleY": 0.09999999999999999,
													"scaleZ": 0.09999999999999999,
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
																			"depthTest": "Less",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": true,
																			"parallax": 0,
																			"textureWrap": true,
																			"emissive": 10
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
																		"useSourceUVs": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 0.01,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_LensFlare_01.png",
																		"onDecal": false
																	},
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0.0049999999999999975,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.2619278819653144,
																						"dt": -0.3266166282733753
																					},
																					"nextHandle": {
																						"dv": -0.85,
																						"dt": 0.22000000000000003
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.033333333333333326,
																					"mode": 2
																				}
																			]
																		}
																	]
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 1,
																		"power": 1
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			1,
																			0.8784313725490196,
																			0.32941176470588235
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.8,
																		"ATTENUATE": true,
																		"emissiveMap": null
																	},
																	"isInstance": true
																}
															]
														},
														{
															"type": "curve",
															"name": "instScale",
															"keys": [
																{
																	"time": 0,
																	"value": 1.0666666666666667,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1.1,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "object",
													"name": "LensFlare_Colored",
													"x": -0.14,
													"y": 0.06,
													"z": 0.49,
													"scaleX": 0.9999999999999998,
													"scaleY": 0.9999999999999998,
													"scaleZ": 0.9999999999999998,
													"rotationX": -40,
													"children": [
														{
															"type": "emitter",
															"name": "LensFlare_color2",
															"props": {
																"alignMode": "Screen",
																"instScale_rand": 0,
																"maxCount": 50,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	1,
																	1,
																	1,
																	1
																],
																"randomColor2": [
																	0.9215686274509803,
																	0.9215686274509803,
																	0.9215686274509803,
																	0.8509803921568627
																],
																"emitAngle": 0,
																"emitRate": 1,
																"instRotation_rand": [
																	0,
																	0,
																	0
																],
																"instScale": 9,
																"emitType": "Burst",
																"burstDelay": 0.12,
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instStretch_rand": [
																	0,
																	0,
																	0
																],
																"warmUpTime": -0.18,
																"instOffset": [
																	0,
																	1,
																	0
																],
																"instRotation": [
																	0,
																	0,
																	-30
																]
															},
															"y": 5.551115123125783e-17,
															"scaleX": 0.09999999999999999,
															"scaleY": 0.09999999999999999,
															"scaleZ": 0.09999999999999999,
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
																					"culling": "Back",
																					"depthTest": "Less",
																					"colorMask": 15,
																					"enableStencil": false,
																					"alphaKill": true,
																					"parallax": 0,
																					"textureWrap": true,
																					"emissive": 15
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
																				"useSourceUVs": false,
																				"wrap": true,
																				"invert": false,
																				"replace": false,
																				"alpha": 0.04,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_LensFlare_Double.png",
																				"onDecal": false
																			},
																			"isInstance": true,
																			"children": [
																				{
																					"type": "curve",
																					"name": "alpha",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0.0049999999999999975,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.2619278819653144,
																								"dt": -0.3266166282733753
																							},
																							"nextHandle": {
																								"dv": -0.85,
																								"dt": 0.22000000000000003
																							}
																						},
																						{
																							"time": 1,
																							"value": 0.033333333333333326,
																							"mode": 2
																						}
																					]
																				}
																			]
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 5,
																				"power": 0.2
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					1,
																					0.8784313725490196,
																					0.32941176470588235
																				]
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "NightEmissive",
																			"source": "shaders/NightEmissive.hx",
																			"props": {
																				"amount": 0.8,
																				"ATTENUATE": true,
																				"emissiveMap": null
																			},
																			"isInstance": true
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "instScale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1.0666666666666667,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 1.1,
																			"mode": 2
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
									"type": "object",
									"name": "projection",
									"scaleX": 0.6,
									"scaleY": 0.6,
									"scaleZ": 0.3,
									"children": [
										{
											"type": "emitter",
											"name": "SandProjectionMesh",
											"props": {
												"enableSort": false,
												"emitSurface": true,
												"frameCount": 2,
												"frameDivisionY": 2,
												"animationSpeed": 0,
												"instSpeed": [
													0,
													0,
													10
												],
												"instStretch": [
													1,
													1,
													2
												],
												"lifeTime": 4,
												"lifeTimeRand": 0.1,
												"warmUpTime": -0.15,
												"emitType": "Burst",
												"instStretch_rand": [
													0.1,
													0.1,
													0.3
												],
												"instScale": 3.5,
												"instScale_rand": 0.5,
												"seedGroup": 3,
												"useRandomColor": true,
												"randomColor1": [
													0.8941176470588235,
													0.8431372549019608,
													0.792156862745098,
													1
												],
												"instSpeed_rand": [
													0,
													0,
													1
												],
												"maxCount": 1,
												"randomColor2": [
													0.9764705882352941,
													0.9647058823529412,
													0.9529411764705882,
													1
												],
												"instRotation_rand": [
													0,
													0,
													360
												]
											},
											"z": -0.5,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.08,
											"rotationY": -3.975693351829396e-15,
											"children": [
												{
													"type": "model",
													"name": "CylinderCone_StraightUV",
													"source": "Fx/Meshes_Common/CylinderCone.fbx",
													"scaleX": 0.5,
													"scaleY": 0.5,
													"scaleZ": 0.5,
													"rotationX": 90,
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
																	"emissive": 0.3
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
															"children": [
																{
																	"type": "shader",
																	"name": "AlphaMap",
																	"source": "shaders/AlphaMap.hx",
																	"props": {
																		"useSourceUVs": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 2,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_SandProjection_Mesh6.png",
																		"onDecal": false
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 0.6,
																		"color": [
																			0.8274509803921568,
																			0.8823529411764706,
																			0.6627450980392157
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DissolveMapNoise",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": true,
																		"wrap": true,
																		"progress": 0.5,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/noise/T_Noise_Grunge_01.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			0.02
																		],
																		"uvScaleSpeed": [
																			0,
																			0
																		]
																	},
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "progress",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.7,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.4807997904821406,
																						"dt": -0.4951636786304198
																					},
																					"nextHandle": {
																						"dv": -0.8169921875000001,
																						"dt": 0.27309197069853475
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 2
																				}
																			]
																		}
																	]
																},
																{
																	"type": "shader",
																	"name": "DissolveMapGradient",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": false,
																		"wrap": true,
																		"progress": 0.5,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 1,
																		"texture": "Fx/Alphas/T_SandProjection_Gradient.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			0
																		],
																		"uvScaleSpeed": [
																			0,
																			0
																		]
																	},
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "progress",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.5,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.644021307982501,
																						"dt": -0.3649454078567505
																					},
																					"nextHandle": {
																						"dv": -0.6,
																						"dt": 0.34
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
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
																		"sandBlend": 0.6,
																		"sandColorSet": false,
																		"envBlend": 0.5,
																		"envColorSet": false
																	},
																	"isInstance": true
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "instStretch.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.6,
															"mode": 0,
															"prevHandle": {
																"dv": -0.8360452004908794,
																"dt": -0.004266167276962038
															},
															"nextHandle": {
																"dv": 0.4833333333333333,
																"dt": 0.0017933693486200664
															}
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.885
															},
															"nextHandle": {
																"dv": -1.3607186657192811e-16,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 3.0890297805850073,
																"dt": -0.11575828486016804
															},
															"nextHandle": {
																"dv": -0.9363636363636363,
																"dt": 0.03508928571428571
															}
														},
														{
															"time": 0.6549999999999999,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.009090909090909038,
																"dt": -0.6245892857142856
															},
															"nextHandle": {
																"dv": 0.008774267419493307,
																"dt": 0.6028344762228577
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Explosion",
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 0.4,
									"children": [
										{
											"type": "object",
											"name": "Explosion_medium",
											"z": 0.12,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "object",
													"name": "-----------------------------Fireball",
													"z": 1.89159,
													"children": [
														{
															"type": "emitter",
															"name": "Smoke_Screen",
															"props": {
																"instScale_rand": 0,
																"maxCount": 50,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	1,
																	1,
																	1,
																	1
																],
																"randomColor2": [
																	0.9215686274509803,
																	0.9215686274509803,
																	0.9215686274509803,
																	0.8509803921568627
																],
																"emitRate": 1,
																"instRotation_rand": [
																	0,
																	0,
																	180
																],
																"frameCount": 32,
																"frameDivisionX": 8,
																"frameDivisionY": 8,
																"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
																"instScale": 22,
																"emitType": "Burst",
																"burstDelay": 0.15,
																"instStretch_rand": [
																	0,
																	0,
																	0
																],
																"burstParticleCount": 2,
																"emitShape": "Cylinder",
																"emitRad1": 0.83,
																"emitSurface": true,
																"lifeTimeRand": 0.3,
																"lifeTime": 0.95,
																"alignMode": "Screen",
																"warmUpTime": -0.1,
																"seedGroup": 1
															},
															"z": 2,
															"scaleX": 3,
															"scaleY": 3,
															"scaleZ": 0.1,
															"rotationZ": 43.6,
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
																					"culling": "Back",
																					"depthTest": "Less",
																					"colorMask": 15,
																					"enableStencil": false,
																					"alphaKill": true,
																					"parallax": 0,
																					"textureWrap": true,
																					"drawOrder": "-80"
																				}
																			},
																			"wrapRepeat": true,
																			"diffuseMap": "Fx/Structure/Smoke/white.png"
																		},
																		{
																			"type": "shader",
																			"name": "AutoAlpha",
																			"source": "shaders/AutoAlpha.hx",
																			"props": {
																				"scale": 2
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
																								"dv": -0.5993723360016039,
																								"dt": -0.47238667159448466
																							},
																							"nextHandle": {
																								"dv": 0.19666666666666666,
																								"dt": 0.15500000000000003
																							}
																						},
																						{
																							"time": 0.44,
																							"value": 0.9833333333333334,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.05499999999999999
																							},
																							"nextHandle": {
																								"dv": -2.85750919801049e-16,
																								"dt": 0.3499999999999999
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.18666666666666668
																							},
																							"nextHandle": {
																								"dv": 0,
																								"dt": 0.18666666666666668
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
																					0.26666666666666666,
																					0.34901960784313724,
																					0.2
																				]
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DissolveMap",
																			"source": "shaders/DissolveMap.hx",
																			"props": {
																				"useSourceUVs": true,
																				"useScale": true,
																				"wrap": true,
																				"progress": 0.35,
																				"saturation": 0,
																				"width": 1,
																				"uvScaleX": 2,
																				"uvScaleY": 2,
																				"texture": "Fx/noise/Wave_01.jpg",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0,
																					0
																				],
																				"uvScaleSpeed": [
																					0,
																					0
																				]
																			},
																			"isInstance": true,
																			"children": [
																				{
																					"type": "curve",
																					"name": "progress",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 0.016666666666666663,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -2.071010349029589,
																								"dt": -0.0988436757491396
																							},
																							"nextHandle": {
																								"dv": 0.7333333333333334,
																								"dt": 0.035
																							}
																						},
																						{
																							"time": 0.19,
																							"value": 0.8833333333333333,
																							"mode": 0
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.3,
																								"dt": -0.39
																							},
																							"nextHandle": {
																								"dv": -0.3268941348737974,
																								"dt": 0.42496237533593706
																							}
																						}
																					]
																				},
																				{
																					"type": "curve",
																					"name": "width",
																					"enabled": false,
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.0520769766684747,
																								"dt": -0.49993897601734766
																							},
																							"nextHandle": {
																								"dv": -0.06666666666666665,
																								"dt": 0.6399999999999999
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
																						}
																					]
																				}
																			]
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1,
																				"power": 1
																			},
																			"isInstance": true
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "instScale",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.012707392165911546,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.05166666666666666
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.01469963255798,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.07620241819144336,
																				"dt": -0.9450000000000001
																			},
																			"nextHandle": {
																				"dv": 0.021440078189261927,
																				"dt": 0.265882295729136
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "emitter",
															"name": "Fireball_Screen",
															"props": {
																"instScale_rand": 0,
																"maxCount": 50,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	1,
																	1,
																	1,
																	1
																],
																"randomColor2": [
																	0.9215686274509803,
																	0.9215686274509803,
																	0.9215686274509803,
																	0.8509803921568627
																],
																"emitRate": 1,
																"instRotation_rand": [
																	0,
																	0,
																	180
																],
																"frameCount": 32,
																"frameDivisionX": 8,
																"frameDivisionY": 8,
																"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
																"instScale": 23,
																"emitType": "Burst",
																"burstDelay": 0.15,
																"instStretch_rand": [
																	0,
																	0,
																	0
																],
																"burstParticleCount": 5,
																"emitShape": "Cylinder",
																"emitRad1": 0.83,
																"emitSurface": true,
																"lifeTimeRand": 0.2,
																"alignMode": "Screen",
																"lifeTime": 1.2,
																"warmUpTime": -0.2
															},
															"z": 0.97,
															"scaleX": 3,
															"scaleY": 3,
															"scaleZ": 0.1,
															"rotationZ": 43.6,
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
																					"culling": "Back",
																					"depthTest": "Less",
																					"colorMask": 15,
																					"enableStencil": false,
																					"alphaKill": true,
																					"parallax": 0,
																					"textureWrap": true,
																					"emissive": 1
																				}
																			},
																			"wrapRepeat": true,
																			"diffuseMap": "Fx/Structure/Smoke/white.png"
																		},
																		{
																			"type": "shader",
																			"name": "AutoAlpha",
																			"source": "shaders/AutoAlpha.hx",
																			"props": {
																				"scale": 1
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "AlphaMult",
																			"source": "shaders/AlphaMult.hx",
																			"props": {
																				"alpha": 1.5
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
																							"time": -0.0050000000000000044,
																							"value": 0,
																							"mode": 2
																						},
																						{
																							"time": 0.039999999999999994,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.029812589848475162,
																								"dt": -0.03384131820637717
																							},
																							"nextHandle": {
																								"dv": -0.6166666666666667,
																								"dt": 0.7
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
																						}
																					]
																				},
																				{
																					"type": "curve",
																					"name": "alpha",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": -0.0050000000000000044,
																							"value": 0,
																							"mode": 2
																						},
																						{
																							"time": 0.039999999999999994,
																							"value": 0.8,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.029812589848475162,
																								"dt": -0.03384131820637717
																							},
																							"nextHandle": {
																								"dv": -0.6166666666666667,
																								"dt": 0.7
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
																						}
																					]
																				}
																			]
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1,
																				"power": 1
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DissolveMap",
																			"source": "shaders/DissolveMap.hx",
																			"props": {
																				"useSourceUVs": true,
																				"useScale": true,
																				"wrap": true,
																				"progress": 0.5,
																				"saturation": 0,
																				"width": 1,
																				"uvScaleX": 0.6,
																				"uvScaleY": 0.6,
																				"texture": "Fx/noise/T_Noise_Wave_02.png",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0,
																					0
																				],
																				"uvScaleSpeed": [
																					0,
																					0
																				]
																			},
																			"isInstance": true,
																			"children": [
																				{
																					"type": "curve",
																					"name": "progress",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.4501476276915423,
																								"dt": -0.6144515117989549
																							},
																							"nextHandle": {
																								"dv": -0.33333333333333337,
																								"dt": 0.455
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.2833333333333333,
																								"dt": -0.29500000000000004
																							},
																							"nextHandle": {
																								"dv": -0.40250763363430087,
																								"dt": 0.41908147737218393
																							}
																						}
																					]
																				},
																				{
																					"type": "curve",
																					"name": "width",
																					"enabled": false,
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.0520769766684747,
																								"dt": -0.49993897601734766
																							},
																							"nextHandle": {
																								"dv": -0.06666666666666665,
																								"dt": 0.6399999999999999
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
																						}
																					]
																				}
																			]
																		},
																		{
																			"type": "shader",
																			"name": "NightEmissive",
																			"source": "shaders/NightEmissive.hx",
																			"props": {
																				"amount": 0.7,
																				"ATTENUATE": true,
																				"emissiveMap": null
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorMult",
																			"source": "shaders/ColorMult.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.6705882352941176,
																					0.7529411764705882,
																					0.2823529411764706
																				]
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "instScale",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.012707392165911546,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.05166666666666666
																			}
																		},
																		{
																			"time": 0.05499999999999999,
																			"value": -0.6831296854521036,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.6178478332448459,
																				"dt": -0.024810868515554432
																			},
																			"nextHandle": {
																				"dv": 0.8715807006116155,
																				"dt": 0.03500000000000003
																			}
																		},
																		{
																			"time": 0.12499999999999999,
																			"value": 0.30347706277117636,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.09186223587130012,
																				"dt": -0.05987522403665296
																			},
																			"nextHandle": {
																				"dv": 0.636704555180494,
																				"dt": 0.4140681559183458
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.01469963255798,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.1819155871944269,
																				"dt": -0.38
																			},
																			"nextHandle": {
																				"dv": 0.12673911289324527,
																				"dt": 0.2647429153388605
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "emitter",
															"name": "Fireball",
															"props": {
																"instScale_rand": 0,
																"maxCount": 50,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	1,
																	1,
																	1,
																	1
																],
																"randomColor2": [
																	0.9215686274509803,
																	0.9215686274509803,
																	0.9215686274509803,
																	0.8509803921568627
																],
																"emitRate": 1,
																"instRotation_rand": [
																	0,
																	0,
																	180
																],
																"frameCount": 32,
																"frameDivisionX": 8,
																"frameDivisionY": 8,
																"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
																"instScale": 23,
																"emitType": "Burst",
																"burstDelay": 0.15,
																"instStretch_rand": [
																	0,
																	0,
																	0
																],
																"burstParticleCount": 2,
																"emitShape": "Cylinder",
																"emitRad1": 0.83,
																"emitSurface": true,
																"lifeTimeRand": 0.2,
																"lifeTime": 1.2,
																"warmUpTime": -0.2
															},
															"z": -1.77424,
															"scaleX": 2,
															"scaleY": 2,
															"scaleZ": 0.1,
															"rotationZ": 43.6,
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
																					"culling": "Back",
																					"depthTest": "Less",
																					"colorMask": 15,
																					"enableStencil": false,
																					"alphaKill": true,
																					"parallax": 0,
																					"textureWrap": true,
																					"emissive": 2
																				}
																			},
																			"wrapRepeat": true,
																			"diffuseMap": "Fx/Structure/Smoke/white.png"
																		},
																		{
																			"type": "shader",
																			"name": "AutoAlpha",
																			"source": "shaders/AutoAlpha.hx",
																			"props": {
																				"scale": 1
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "AlphaMult",
																			"source": "shaders/AlphaMult.hx",
																			"props": {
																				"alpha": 1.5
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
																							"time": -0.0050000000000000044,
																							"value": 0,
																							"mode": 2
																						},
																						{
																							"time": 0.039999999999999994,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.029812589848475162,
																								"dt": -0.03384131820637717
																							},
																							"nextHandle": {
																								"dv": -0.6166666666666667,
																								"dt": 0.7
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
																						}
																					]
																				},
																				{
																					"type": "curve",
																					"name": "alpha",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": -0.0050000000000000044,
																							"value": 0,
																							"mode": 2
																						},
																						{
																							"time": 0.039999999999999994,
																							"value": 0.8,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.029812589848475162,
																								"dt": -0.03384131820637717
																							},
																							"nextHandle": {
																								"dv": -0.6166666666666667,
																								"dt": 0.7
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
																						}
																					]
																				}
																			]
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1,
																				"power": 1
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DissolveMap",
																			"source": "shaders/DissolveMap.hx",
																			"props": {
																				"useSourceUVs": true,
																				"useScale": true,
																				"wrap": true,
																				"progress": 0.5,
																				"saturation": 0,
																				"width": 1,
																				"uvScaleX": 0.6,
																				"uvScaleY": 0.6,
																				"texture": "Fx/noise/T_Noise_Wave_02.png",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0,
																					0
																				],
																				"uvScaleSpeed": [
																					0,
																					0
																				]
																			},
																			"isInstance": true,
																			"children": [
																				{
																					"type": "curve",
																					"name": "progress",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.4501476276915423,
																								"dt": -0.6144515117989549
																							},
																							"nextHandle": {
																								"dv": -0.33333333333333337,
																								"dt": 0.455
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.2833333333333333,
																								"dt": -0.29500000000000004
																							},
																							"nextHandle": {
																								"dv": -0.40250763363430087,
																								"dt": 0.41908147737218393
																							}
																						}
																					]
																				},
																				{
																					"type": "curve",
																					"name": "width",
																					"enabled": false,
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.0520769766684747,
																								"dt": -0.49993897601734766
																							},
																							"nextHandle": {
																								"dv": -0.06666666666666665,
																								"dt": 0.6399999999999999
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
																						}
																					]
																				}
																			]
																		},
																		{
																			"type": "shader",
																			"name": "NightEmissive",
																			"source": "shaders/NightEmissive.hx",
																			"props": {
																				"amount": 0.7,
																				"ATTENUATE": true,
																				"emissiveMap": null
																			},
																			"isInstance": true
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
																								"position": 0,
																								"color": 4282669363
																							},
																							{
																								"position": 1,
																								"color": -8283567
																							}
																						],
																						"resolution": 64
																					}
																				}
																			}
																		},
																		{
																			"type": "shader",
																			"name": "ColorMult",
																			"source": "shaders/ColorMult.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.6705882352941176,
																					0.7529411764705882,
																					0.2823529411764706
																				]
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "instScale",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.012707392165911546,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.05166666666666666
																			}
																		},
																		{
																			"time": 0.05499999999999999,
																			"value": -0.6831296854521036,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.6178478332448459,
																				"dt": -0.024810868515554432
																			},
																			"nextHandle": {
																				"dv": 0.8715807006116155,
																				"dt": 0.03500000000000003
																			}
																		},
																		{
																			"time": 0.12499999999999999,
																			"value": 0.30347706277117636,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.09186223587130012,
																				"dt": -0.05987522403665296
																			},
																			"nextHandle": {
																				"dv": 0.636704555180494,
																				"dt": 0.4140681559183458
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.01469963255798,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.1819155871944269,
																				"dt": -0.38
																			},
																			"nextHandle": {
																				"dv": 0.12673911289324527,
																				"dt": 0.2647429153388605
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "emitter",
															"name": "Residu_Screen",
															"props": {
																"instScale_rand": 4,
																"maxCount": 50,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	1,
																	1,
																	1,
																	1
																],
																"randomColor2": [
																	0.9215686274509803,
																	0.9215686274509803,
																	0.9215686274509803,
																	0.8509803921568627
																],
																"emitRate": 1,
																"instRotation_rand": [
																	0,
																	0,
																	180
																],
																"frameCount": 32,
																"frameDivisionX": 8,
																"frameDivisionY": 8,
																"instScale": 13,
																"emitType": "Burst",
																"burstDelay": 0.15,
																"instStretch_rand": [
																	0,
																	0,
																	0
																],
																"burstParticleCount": 2,
																"emitShape": "Cylinder",
																"emitRad1": 0.83,
																"emitSurface": true,
																"lifeTimeRand": 0.2,
																"alignMode": "Screen",
																"warmUpTime": -0.2
															},
															"z": 0.97,
															"scaleX": 3,
															"scaleY": 3,
															"scaleZ": 3,
															"rotationZ": 43.6,
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
																					"culling": "Back",
																					"depthTest": "Less",
																					"colorMask": 15,
																					"enableStencil": false,
																					"alphaKill": true,
																					"parallax": 0,
																					"textureWrap": true,
																					"emissive": 2
																				}
																			},
																			"wrapRepeat": true,
																			"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																				"texture": "Fx/Alphas/T_HitBloodShape02_Alpha02.png"
																			}
																		},
																		{
																			"type": "shader",
																			"name": "AlphaMult",
																			"source": "shaders/AlphaMult.hx",
																			"props": {
																				"alpha": 2
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1,
																				"power": 1
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DissolveMap",
																			"source": "shaders/DissolveMap.hx",
																			"props": {
																				"useSourceUVs": true,
																				"useScale": true,
																				"wrap": true,
																				"progress": 0.25,
																				"saturation": 0.5,
																				"width": 1,
																				"uvScaleX": 0.6,
																				"uvScaleY": 0.6,
																				"texture": "Fx/Alphas/T_HitBloodShape02_Dissolve.png",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0,
																					0
																				],
																				"uvScaleSpeed": [
																					0,
																					0
																				]
																			},
																			"isInstance": true,
																			"children": [
																				{
																					"type": "curve",
																					"name": "progress",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.289548825013608,
																								"dt": -0.6014787784827603
																							},
																							"nextHandle": {
																								"dv": -0.6833333333333333,
																								"dt": 0.3189579781620688
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.5320730729086454
																							},
																							"nextHandle": {
																								"dv": -9.925303148317463e-16,
																								"dt": 0.4211642364791689
																							}
																						}
																					]
																				},
																				{
																					"type": "curve",
																					"name": "width",
																					"enabled": false,
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.0520769766684747,
																								"dt": -0.49993897601734766
																							},
																							"nextHandle": {
																								"dv": -0.06666666666666665,
																								"dt": 0.6399999999999999
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
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
																					1,
																					0.8784313725490196,
																					0.32941176470588235
																				]
																			}
																		},
																		{
																			"type": "shader",
																			"name": "NightEmissive",
																			"source": "shaders/NightEmissive.hx",
																			"props": {
																				"amount": 0.7,
																				"ATTENUATE": true,
																				"emissiveMap": null
																			},
																			"isInstance": true
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "instScale",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.012707392165911546,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.05166666666666666
																			}
																		},
																		{
																			"time": 0.05499999999999999,
																			"value": -0.6831296854521036,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.6178478332448459,
																				"dt": -0.024810868515554432
																			},
																			"nextHandle": {
																				"dv": 0.8715807006116155,
																				"dt": 0.03500000000000003
																			}
																		},
																		{
																			"time": 0.12499999999999999,
																			"value": 0.30347706277117636,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.09186223587130012,
																				"dt": -0.05987522403665296
																			},
																			"nextHandle": {
																				"dv": 0.636704555180494,
																				"dt": 0.4140681559183458
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.01469963255798,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.1819155871944269,
																				"dt": -0.38
																			},
																			"nextHandle": {
																				"dv": 0.12673911289324527,
																				"dt": 0.2647429153388605
																			}
																		}
																	]
																}
															]
														}
													]
												},
												{
													"type": "object",
													"name": "Anticipation",
													"z": 4.5,
													"scaleX": 2.2,
													"scaleY": 2.2,
													"scaleZ": 2.2,
													"children": [
														{
															"type": "object",
															"name": "Anticipation",
															"children": [
																{
																	"type": "emitter",
																	"name": "LensFlare",
																	"props": {
																		"alignMode": "Screen",
																		"instScale_rand": 0,
																		"maxCount": 50,
																		"simulationSpace": "World",
																		"animationSpeed": 0,
																		"randomColor1": [
																			1,
																			1,
																			1,
																			1
																		],
																		"randomColor2": [
																			0.9215686274509803,
																			0.9215686274509803,
																			0.9215686274509803,
																			0.8509803921568627
																		],
																		"emitAngle": 0,
																		"emitRate": 1,
																		"instRotation_rand": [
																			0,
																			0,
																			360
																		],
																		"instScale": 15,
																		"emitType": "Burst",
																		"burstDelay": 0.12,
																		"instWorldSpeed_rand": [
																			0,
																			0,
																			0
																		],
																		"warmUpTime": -0.2,
																		"instOffset": [
																			0,
																			1,
																			0
																		],
																		"lifeTime": 0.04
																	},
																	"y": 5.551115123125783e-17,
																	"scaleX": 0.09999999999999999,
																	"scaleY": 0.09999999999999998,
																	"scaleZ": 0.09999999999999998,
																	"rotationX": 70,
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
																							"depthTest": "Less",
																							"colorMask": 15,
																							"enableStencil": false,
																							"alphaKill": true,
																							"parallax": 0,
																							"textureWrap": true,
																							"emissive": 5
																						}
																					},
																					"wrapRepeat": true,
																					"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																				},
																				{
																					"type": "shader",
																					"name": "ColorSet",
																					"source": "shaders/ColorSet.hx",
																					"enabled": false,
																					"props": {
																						"amount": 1,
																						"color": [
																							0.6941176470588235,
																							0.4156862745098039,
																							0.2588235294117647
																						]
																					},
																					"isInstance": true
																				},
																				{
																					"type": "shader",
																					"name": "ColorSet",
																					"source": "shaders/ColorSet.hx",
																					"props": {
																						"amount": 1,
																						"color": [
																							1,
																							0.8784313725490196,
																							0.32941176470588235
																						]
																					},
																					"isInstance": true
																				},
																				{
																					"type": "shader",
																					"name": "AlphaMap",
																					"source": "shaders/AlphaMap.hx",
																					"props": {
																						"useSourceUVs": false,
																						"wrap": true,
																						"invert": false,
																						"replace": false,
																						"alpha": 1,
																						"uScale": 1,
																						"vScale": 1,
																						"uOffset": 0,
																						"vOffset": 0,
																						"texture": "Fx/Alphas/T_Flare02.png",
																						"onDecal": false
																					},
																					"isInstance": true,
																					"children": [
																						{
																							"type": "curve",
																							"name": "alpha",
																							"keyMode": 0,
																							"keys": [
																								{
																									"time": 0.0049999999999999975,
																									"value": 1,
																									"mode": 0,
																									"prevHandle": {
																										"dv": 0.03352751080665441,
																										"dt": -0.5098493884736074
																									},
																									"nextHandle": {
																										"dv": -0.032222222222222374,
																										"dt": 0.49000000000000005
																									}
																								},
																								{
																									"time": 1,
																									"value": 0.033333333333333326,
																									"mode": 2
																								}
																							]
																						}
																					]
																				},
																				{
																					"type": "shader",
																					"name": "DepthBlend",
																					"source": "shaders/DepthBlend.hx",
																					"props": {
																						"REVERSE": false,
																						"range": 1,
																						"power": 1
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
																					},
																					"isInstance": true
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "instScale",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.2031330657866298,
																						"dt": -0.011491216884901312
																					},
																					"nextHandle": {
																						"dv": 0.1776762318069669,
																						"dt": 0.009999999999999995
																					}
																				},
																				{
																					"time": 1,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.004036962159623458,
																						"dt": -0.8049999999999999
																					},
																					"nextHandle": {
																						"dv": 0.0016825760508064648,
																						"dt": 0.3333076171372348
																					}
																				}
																			]
																		}
																	]
																}
															]
														},
														{
															"type": "object",
															"name": "LensFlare",
															"children": [
																{
																	"type": "object",
																	"name": "LensFlare_Colored",
																	"y": 0.14500000000000002,
																	"z": -0.030000000000000027,
																	"scaleX": 0.9999999999999998,
																	"scaleY": 0.9999999999999998,
																	"scaleZ": 0.9999999999999998,
																	"rotationX": -40,
																	"children": [
																		{
																			"type": "emitter",
																			"name": "LensFlare_color_small",
																			"props": {
																				"alignMode": "Screen",
																				"instScale_rand": 0,
																				"maxCount": 50,
																				"simulationSpace": "World",
																				"animationSpeed": 0,
																				"randomColor1": [
																					1,
																					1,
																					1,
																					1
																				],
																				"randomColor2": [
																					0.9215686274509803,
																					0.9215686274509803,
																					0.9215686274509803,
																					0.8509803921568627
																				],
																				"emitAngle": 0,
																				"emitRate": 1,
																				"instRotation_rand": [
																					0,
																					0,
																					0
																				],
																				"instScale": 9,
																				"emitType": "Burst",
																				"burstDelay": 0.12,
																				"instWorldSpeed_rand": [
																					0,
																					0,
																					0
																				],
																				"instStretch_rand": [
																					0,
																					0,
																					0
																				],
																				"warmUpTime": -0.2,
																				"instOffset": [
																					0,
																					1,
																					0
																				],
																				"instRotation": [
																					0,
																					0,
																					-30
																				],
																				"lifeTime": 0.04
																			},
																			"y": 5.551115123125783e-17,
																			"scaleX": 0.09999999999999999,
																			"scaleY": 0.09999999999999999,
																			"scaleZ": 0.09999999999999999,
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
																									"culling": "Back",
																									"depthTest": "Less",
																									"colorMask": 15,
																									"enableStencil": false,
																									"alphaKill": true,
																									"parallax": 0,
																									"textureWrap": true,
																									"emissive": 1
																								}
																							},
																							"wrapRepeat": true,
																							"diffuseMap": "Fx/Gradients/T_circleGradient_color02.png",
																							"color": [
																								0.9411764705882353,
																								0.807843137254902,
																								0.7058823529411764,
																								1
																							]
																						},
																						{
																							"type": "shader",
																							"name": "AlphaMap",
																							"source": "shaders/AlphaMap.hx",
																							"props": {
																								"useSourceUVs": false,
																								"wrap": true,
																								"invert": false,
																								"replace": false,
																								"alpha": 0.25,
																								"uScale": 1,
																								"vScale": 1,
																								"uOffset": 0,
																								"vOffset": 0,
																								"texture": "Fx/Alphas/T_LensFlare_Double.png",
																								"onDecal": false
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
																											"time": 0.0049999999999999975,
																											"value": 1,
																											"mode": 0,
																											"prevHandle": {
																												"dv": 1.2619278819653144,
																												"dt": -0.3266166282733753
																											},
																											"nextHandle": {
																												"dv": -0.85,
																												"dt": 0.22000000000000003
																											}
																										},
																										{
																											"time": 1,
																											"value": 0.033333333333333326,
																											"mode": 2
																										}
																									]
																								}
																							]
																						},
																						{
																							"type": "shader",
																							"name": "DepthBlend",
																							"source": "shaders/DepthBlend.hx",
																							"props": {
																								"REVERSE": false,
																								"range": 1,
																								"power": 1
																							},
																							"isInstance": true
																						},
																						{
																							"type": "shader",
																							"name": "NightEmissive",
																							"source": "shaders/NightEmissive.hx",
																							"props": {
																								"amount": 0.8,
																								"ATTENUATE": true,
																								"emissiveMap": null
																							},
																							"isInstance": true
																						},
																						{
																							"type": "shader",
																							"name": "ColorSet",
																							"source": "shaders/ColorSet.hx",
																							"props": {
																								"amount": 1,
																								"color": [
																									1,
																									0.8784313725490196,
																									0.32941176470588235
																								]
																							},
																							"isInstance": true
																						}
																					]
																				},
																				{
																					"type": "curve",
																					"name": "instScale",
																					"keys": [
																						{
																							"time": 0,
																							"value": 1.0666666666666667,
																							"mode": 2
																						},
																						{
																							"time": 1,
																							"value": 1.1,
																							"mode": 2
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
									]
								},
								{
									"type": "object",
									"name": "Debris",
									"z": -1.1,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"children": [
										{
											"type": "emitter",
											"name": "Debris",
											"props": {
												"lifeTimeRand": 0.25,
												"warmUpTime": -0.2,
												"emitType": "Burst",
												"burstParticleCount": 5,
												"emitShape": "Cone",
												"emitSurface": true,
												"alignMode": "Screen",
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"instScale": 1.75,
												"instSpeed": [
													180,
													0,
													0
												],
												"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
												"instRotation_rand": [
													0,
													0,
													360
												],
												"instScale_rand": 0.5,
												"instSpeed_rand": [
													20,
													0,
													0
												],
												"instWorldSpeed": [
													0,
													0,
													-10
												],
												"instWorldSpeed_rand": [
													0,
													0,
													-3
												],
												"seedGroup": 1,
												"useRandomColor": true,
												"randomColor1": [
													0.9529411764705882,
													0.9529411764705882,
													0.9529411764705882,
													1
												],
												"randomColor2": [
													0.42745098039215684,
													0.42745098039215684,
													0.42745098039215684,
													1
												],
												"simulationSpace": "World"
											},
											"scaleX": 8,
											"scaleY": 35,
											"scaleZ": 35,
											"rotationY": -89.99999999999999,
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
																	"culling": "Back",
																	"colorMask": 255,
																	"depthTest": "LessEqual",
																	"textureWrap": true
																}
															},
															"wrapRepeat": true
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.63,
																			"value": 1.0142450142450146,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.21166666666666667
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.12166666666666666
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.16500000000000004
																			},
																			"nextHandle": {
																				"dv": -1.860811850556283e-16,
																				"dt": 0.33333333333333337
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
																	1,
																	1,
																	1
																]
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6705882352941176,
																	0.7529411764705882,
																	0.2823529411764706
																]
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.1231445518988399,
																				"dt": -0.4040716782957579
																			},
																			"nextHandle": {
																				"dv": -0.7157227774511725,
																				"dt": 0.2591159821441452
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.008361094780847868,
																				"dt": -0.46684502659331484
																			},
																			"nextHandle": {
																				"dv": 0.005970108735119745,
																				"dt": 0.3334272151821127
																			}
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
																"sandBlend": 0.6,
																"sandColorSet": false,
																"envBlend": 0.5,
																"envColorSet": false
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 3.1230642893642835,
																"dt": -0.08923040826755088
															},
															"nextHandle": {
																"dv": -1.05,
																"dt": 0.03
															}
														},
														{
															"time": 0.9903769144228197,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.09999999999999998,
																"dt": -0.9003769144228198
															},
															"nextHandle": {
																"dv": -0.07279432839662904,
																"dt": 0.6551489555696561
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "InstWorldSpeed.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.009057837245436214,
																"dt": -0.49999261594807487
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.9199999999999999
															}
														},
														{
															"time": 1.92,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.8166666666666667,
																"dt": -0.355
															},
															"nextHandle": {
																"dv": 0.4498541012841457,
																"dt": 0.19554882361943476
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.012707392165911546,
															"mode": 0,
															"prevHandle": {
																"dv": -1.562544836391683,
																"dt": -0.057312053992565525
															},
															"nextHandle": {
																"dv": 0.8951335055594681,
																"dt": 0.03233660096897972
															}
														},
														{
															"time": 1,
															"value": 1.01469963255798,
															"mode": 0,
															"prevHandle": {
																"dv": -0.024099204996862578,
																"dt": -0.9873942064019231
															},
															"nextHandle": {
																"dv": 0.0055778337215589505,
																"dt": 0.265963721460112
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "DirectionalExplo_mesh",
									"x": 0.5,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"children": [
										{
											"type": "emitter",
											"name": "DirectionalFire_Mesh",
											"props": {
												"enableSort": false,
												"emitSurface": true,
												"frameCount": 4,
												"animationSpeed": 0,
												"instSpeed": [
													0,
													0,
													20
												],
												"instStretch": [
													0.9,
													0.9,
													1.5
												],
												"lifeTime": 0.5,
												"lifeTimeRand": 0.1,
												"warmUpTime": -0.27,
												"emitType": "Burst",
												"instStretch_rand": [
													0.2,
													0.2,
													0.55
												],
												"instScale": 3.5,
												"instScale_rand": 1,
												"seedGroup": 3,
												"useRandomColor": true,
												"randomColor1": [
													0.8235294117647058,
													0.7686274509803921,
													0.7176470588235294,
													1
												],
												"instSpeed_rand": [
													0,
													0,
													5
												],
												"maxCount": 1,
												"randomColor2": [
													0.9764705882352941,
													0.9647058823529412,
													0.9529411764705882,
													1
												],
												"instRotation_rand": [
													0,
													0,
													180
												],
												"frameDivisionX": 2,
												"frameDivisionY": 2,
												"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2_02.png"
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "model",
													"name": "CylinderCone_StraightUV",
													"source": "Fx/Meshes_Common/BendedCrossPlane.fbx",
													"scaleX": 0.5,
													"scaleY": 0.2,
													"scaleZ": 0.5,
													"rotationX": 90,
													"rotationZ": -90,
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
																	"depthTest": "Less",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": true,
																	"parallax": 0,
																	"textureWrap": true,
																	"emissive": 8
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.75
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": -0.0050000000000000044,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.039999999999999994,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.029812589848475162,
																				"dt": -0.03384131820637717
																			},
																			"nextHandle": {
																				"dv": -0.6166666666666667,
																				"dt": 0.7
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 2
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
																	0.7372549019607844,
																	0.7529411764705882,
																	0.2823529411764706
																]
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.5,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 0.6,
																"uvScaleY": 0.6,
																"texture": "Fx/noise/T_Noise_Wave_02.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	0
																],
																"uvScaleSpeed": [
																	0,
																	0
																]
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "progress",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0910902540606407,
																				"dt": -0.6285227530184213
																			},
																			"nextHandle": {
																				"dv": -0.016666666666666663,
																				"dt": 0.115
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.6166666666666667,
																				"dt": -0.2300000000000001
																			},
																			"nextHandle": {
																				"dv": -0.9111632769276069,
																				"dt": 0.3398392762594855
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0520769766684747,
																				"dt": -0.49993897601734766
																			},
																			"nextHandle": {
																				"dv": -0.06666666666666665,
																				"dt": 0.6399999999999999
																			}
																		},
																		{
																			"time": 1,
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
													"type": "curve",
													"name": "instStretch.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.832419311974865,
																"dt": -0.023411793149293023
															},
															"nextHandle": {
																"dv": 0.5333333333333332,
																"dt": 0.015
															}
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.885
															},
															"nextHandle": {
																"dv": -1.3607186657192811e-16,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 3.0890297805850073,
																"dt": -0.11575828486016804
															},
															"nextHandle": {
																"dv": -0.9363636363636363,
																"dt": 0.03508928571428571
															}
														},
														{
															"time": 0.6549999999999999,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.009090909090909038,
																"dt": -0.6245892857142856
															},
															"nextHandle": {
																"dv": 0.008774267419493307,
																"dt": 0.6028344762228577
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "DirectionalSmoke_Mesh",
											"props": {
												"enableSort": false,
												"emitSurface": true,
												"frameCount": 4,
												"animationSpeed": 0,
												"instSpeed": [
													0,
													0,
													20
												],
												"instStretch": [
													1.1,
													1.1,
													2
												],
												"lifeTime": 1.25,
												"lifeTimeRand": 0.1,
												"warmUpTime": -0.28,
												"emitType": "Burst",
												"instStretch_rand": [
													0.2,
													0.2,
													0.75
												],
												"instScale": 3,
												"instScale_rand": 0.5,
												"seedGroup": 3,
												"useRandomColor": true,
												"randomColor1": [
													0.8235294117647058,
													0.7686274509803921,
													0.7176470588235294,
													1
												],
												"instSpeed_rand": [
													0,
													0,
													5
												],
												"maxCount": 1,
												"randomColor2": [
													0.9764705882352941,
													0.9647058823529412,
													0.9529411764705882,
													1
												],
												"instRotation_rand": [
													0,
													0,
													180
												],
												"frameDivisionX": 2,
												"frameDivisionY": 2,
												"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png"
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "model",
													"name": "CylinderCone_StraightUV",
													"source": "Fx/Meshes_Common/BendedCrossPlane.fbx",
													"scaleX": 0.5,
													"scaleY": 0.2,
													"scaleZ": 0.5,
													"rotationX": 90,
													"rotationZ": -90,
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
																	"depthTest": "Less",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": true,
																	"parallax": 0,
																	"textureWrap": true
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Structure/Smoke/white.png"
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 2
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.65
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": -0.0050000000000000044,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.039999999999999994,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.00782367857939008,
																				"dt": -0.03520655360725527
																			},
																			"nextHandle": {
																				"dv": -0.15000000000000002,
																				"dt": 0.674375
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.01666666666666672,
																				"dt": -0.15625
																			},
																			"nextHandle": {
																				"dv": 0.03384085855991686,
																				"dt": 0.3197961133912159
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
																	0.28627450980392155,
																	0.34509803921568627,
																	0.2392156862745098
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
																"range": 0.1,
																"power": 1
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.5,
																"saturation": 0.1,
																"width": 1,
																"uvScaleX": 0.7,
																"uvScaleY": 0.7,
																"texture": "Fx/noise/causticTexture_03-2-Blured.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	0.05
																],
																"uvScaleSpeed": [
																	0,
																	0
																]
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "progress",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.17597127610376737,
																				"dt": -0.6268976711196711
																			},
																			"nextHandle": {
																				"dv": -0.1333333333333333,
																				"dt": 0.47500000000000003
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.009090909090909038,
																				"dt": -0.4642857142857143
																			},
																			"nextHandle": {
																				"dv": 0.008539703073546545,
																				"dt": 0.4361348355418391
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.0520769766684747,
																				"dt": -0.49993897601734766
																			},
																			"nextHandle": {
																				"dv": -0.06666666666666665,
																				"dt": 0.6399999999999999
																			}
																		},
																		{
																			"time": 1,
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
													"type": "curve",
													"name": "instStretch.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.832419311974865,
																"dt": -0.023411793149293023
															},
															"nextHandle": {
																"dv": 0.5333333333333332,
																"dt": 0.015
															}
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.885
															},
															"nextHandle": {
																"dv": -1.3607186657192811e-16,
																"dt": 0.33333333333333326
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 3.0890297805850073,
																"dt": -0.11575828486016804
															},
															"nextHandle": {
																"dv": -0.9363636363636363,
																"dt": 0.03508928571428571
															}
														},
														{
															"time": 0.6549999999999999,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.009090909090909038,
																"dt": -0.6245892857142856
															},
															"nextHandle": {
																"dv": 0.008774267419493307,
																"dt": 0.6028344762228577
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
			]
		},
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
		}
	]
}