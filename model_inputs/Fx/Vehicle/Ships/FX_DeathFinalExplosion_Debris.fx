{
	"type": "fx",
	"duration": 8,
	"cullingRadius": 3,
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
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Wraith",
					"source": "Vehicle/Atreide/Kraken/Kraken.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": -4,
							"animation": "Anim/Kraken/Anim_Kraken_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "ChemicalExplosion",
					"z": -2.13457,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 3,
					"children": [
						{
							"type": "object",
							"name": "GrenadeExplosion",
							"z": -0.55488,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"children": [
								{
									"type": "object",
									"name": "Explosion_medium",
									"z": 0.12,
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
																			0.24705882352941178,
																			0.24705882352941178,
																			0.24705882352941178
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
														"warmUpTime": -0.1
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
																			"emissive": 10
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
																			1,
																			0.45098039215686275,
																			0.2901960784313725
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
												}
											]
										},
										{
											"type": "object",
											"name": "Anticipation",
											"z": 4.5,
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
																"warmUpTime": -0.1,
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
																					"emissive": 20
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
																					0.6941176470588235,
																					0.4156862745098039,
																					0.2588235294117647
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
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "SmokeTrails",
									"props": {
										"lifeTime": 3,
										"lifeTimeRand": 0.25,
										"warmUpTime": -0.25,
										"emitType": "Burst",
										"emitRate": 10,
										"burstParticleCount": 5,
										"emitOrientation": "Random",
										"frameCount": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0,
										"instStretch": [
											1,
											3,
											7
										],
										"spriteSheet": "Fx/Alphas/T_Smoketrails04.png",
										"instStretch_rand": [
											0,
											0.5,
											1
										]
									},
									"z": 3.25,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
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
															"emissive": 8
														}
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1.2
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
													},
													"isInstance": true
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
																		"position": 0.75390625,
																		"color": -15329770
																	},
																	{
																		"position": 1,
																		"color": -26056
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
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 3,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.45,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 1,
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
																	"time": 0.06,
																	"value": 0.8391666666666666,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.3903477004485572,
																		"dt": -0.1794338991344239
																	},
																	"nextHandle": {
																		"dv": -0.6625,
																		"dt": 0.08511576177892854
																	}
																},
																{
																	"time": 1,
																	"value": 0.3,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.014722222222222192,
																		"dt": -0.41000000000000003
																	},
																	"nextHandle": {
																		"dv": 0.01577045693061334,
																		"dt": 0.4391923477280234
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
														"progress": 0.4,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0.3984375,
																		"color": -1
																	},
																	{
																		"position": 1,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
																	"time": 0.185,
																	"value": 0.8833333333333333,
																	"mode": 2
																},
																{
																	"time": 0.575,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.014722222222222192,
																		"dt": -0.41000000000000003
																	},
																	"nextHandle": {
																		"dv": 0.01577045693061334,
																		"dt": 0.4391923477280234
																	}
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
														"dv": -1.1600833491630587,
														"dt": -0.13779380507257405
													},
													"nextHandle": {
														"dv": 0.5833333333333333,
														"dt": 0.0695215985595434
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666607,
														"dt": -0.994569693421661
													},
													"nextHandle": {
														"dv": 0.005587501538838047,
														"dt": 0.3333328387067263
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
							"z": 1.792113333333333,
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"children": [
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
												"instScale": 7,
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
																	0.6941176470588235,
																	0.3607843137254902,
																	0.2588235294117647
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
														"instScale": 10,
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
														"warmUpTime": -0.08,
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
																	"diffuseMap": "Fx/Gradients/T_circleGradient_color_double.png"
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
				},
				{
					"type": "object",
					"name": "explo",
					"x": 2.51854,
					"y": 1.2888,
					"rotationZ": -152.9,
					"children": [
						{
							"type": "object",
							"name": "explomid",
							"x": 9.71369,
							"y": -3.60865,
							"z": -3.85356,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
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
										"instScale": 16,
										"emitType": "Burst",
										"burstDelay": 0.15,
										"instStretch_rand": [
											0,
											0,
											0
										],
										"emitShape": "Cylinder",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.3,
										"lifeTime": 1.2,
										"warmUpTime": -0.1,
										"alignMode": "Screen"
									},
									"x": -1.7585899999999999,
									"y": -1.1814899999999997,
									"z": 3.6,
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
																	"time": 0.3,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.4631592881906408,
																		"dt": -0.2394260653402867
																	},
																	"nextHandle": {
																		"dv": 0.3666666666666667,
																		"dt": 0.06
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
															0.24705882352941178,
															0.24705882352941178,
															0.24705882352941178
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
														"progress": 0.4,
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
										"instScale": 12,
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
										"lifeTime": 0.8,
										"warmUpTime": -0.15
									},
									"x": -1.7585899999999999,
									"y": -1.1814899999999997,
									"z": 3.88,
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
															1,
															0.45098039215686275,
															0.2901960784313725
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
							"name": "explomid",
							"x": -6.889912321428572,
							"y": 3.9820298214285716,
							"z": -2.1551237500000004,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"children": [
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
										"instScale": 12,
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
										"lifeTime": 0.8,
										"warmUpTime": -0.15
									},
									"x": 8.881784197001252e-16,
									"y": -2.220446049250313e-16,
									"z": 3.8800000000000003,
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
															1,
															0.45098039215686275,
															0.2901960784313725
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
										"instScale": 16,
										"emitType": "Burst",
										"burstDelay": 0.15,
										"instStretch_rand": [
											0,
											0,
											0
										],
										"emitShape": "Cylinder",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.3,
										"lifeTime": 1.2,
										"warmUpTime": -0.1,
										"alignMode": "Screen"
									},
									"x": 8.881784197001252e-16,
									"y": -2.220446049250313e-16,
									"z": 3.6,
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
																	"time": 0.3,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.4631592881906408,
																		"dt": -0.2394260653402867
																	},
																	"nextHandle": {
																		"dv": 0.3666666666666667,
																		"dt": 0.06
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
															0.24705882352941178,
															0.24705882352941178,
															0.24705882352941178
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
														"progress": 0.4,
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
								}
							]
						},
						{
							"type": "object",
							"name": "explomid",
							"x": 0.4232176785714288,
							"y": 2.9917998214285717,
							"z": -2.8857737500000002,
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"children": [
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
										"instScale": 12,
										"emitType": "Burst",
										"burstDelay": 0.15,
										"instStretch_rand": [
											0,
											0,
											0
										],
										"burstParticleCount": 4,
										"emitShape": "Cylinder",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.2,
										"alignMode": "Screen",
										"lifeTime": 1.2,
										"warmUpTime": -0.15
									},
									"x": -2.220446049250313e-16,
									"z": 3.8800000000000003,
									"scaleX": 3.0000000000000004,
									"scaleY": 3.0000000000000004,
									"scaleZ": 0.1,
									"rotationZ": 43.60000000000001,
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
															1,
															0.45098039215686275,
															0.2901960784313725
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
														"uvScaleX": 0.9,
														"uvScaleY": 0.9,
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
										"instScale": 16,
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
										"lifeTime": 1.6,
										"warmUpTime": -0.1,
										"alignMode": "Screen"
									},
									"x": -2.220446049250313e-16,
									"z": 3.6,
									"scaleX": 3.0000000000000004,
									"scaleY": 3.0000000000000004,
									"scaleZ": 0.1,
									"rotationZ": 43.60000000000001,
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
																	"time": 0.3,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.4631592881906408,
																		"dt": -0.2394260653402867
																	},
																	"nextHandle": {
																		"dv": 0.3666666666666667,
																		"dt": 0.06
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
															0.24705882352941178,
															0.24705882352941178,
															0.24705882352941178
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
														"progress": 0.4,
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
								}
							]
						},
						{
							"type": "object",
							"name": "explomid",
							"x": -3.24699,
							"y": -3.36518,
							"z": -0.65108,
							"children": [
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
										"instScale": 12,
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
										"lifeTime": 0.8,
										"warmUpTime": -0.15
									},
									"x": -1.9844199999999992,
									"y": 4.440892098500626e-16,
									"z": 3.8800000000000003,
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
															1,
															0.45098039215686275,
															0.2901960784313725
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
										"instScale": 16,
										"emitType": "Burst",
										"burstDelay": 0.15,
										"instStretch_rand": [
											0,
											0,
											0
										],
										"emitShape": "Cylinder",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.3,
										"lifeTime": 1.2,
										"warmUpTime": -0.1,
										"alignMode": "Screen"
									},
									"x": -1.9844199999999992,
									"y": 4.440892098500626e-16,
									"z": 3.6,
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
																	"time": 0.3,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.4631592881906408,
																		"dt": -0.2394260653402867
																	},
																	"nextHandle": {
																		"dv": 0.3666666666666667,
																		"dt": 0.06
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
															0.24705882352941178,
															0.24705882352941178,
															0.24705882352941178
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
														"progress": 0.4,
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
								}
							]
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
					"type": "emitter",
					"name": "DebrisCylinder",
					"props": {
						"lifeTimeRand": 0.75,
						"emitType": "Burst",
						"burstParticleCount": 7,
						"emitShape": "Cylinder",
						"alignMode": "Screen",
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0,
						"instScale": 3,
						"instSpeed": [
							85,
							0,
							75
						],
						"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
						"instRotation_rand": [
							0,
							0,
							360
						],
						"instScale_rand": 2.5,
						"instSpeed_rand": [
							100,
							0,
							17
						],
						"instWorldSpeed": [
							0,
							0,
							-25
						],
						"instWorldSpeed_rand": [
							0,
							0,
							-16
						],
						"seedGroup": 1,
						"randomColor1": [
							0.9294117647058824,
							0.36470588235294116,
							0.19215686274509802,
							1
						],
						"randomColor2": [
							0.19607843137254902,
							0.19607843137254902,
							0.19607843137254902,
							1
						],
						"simulationSpace": "World",
						"emitOrientation": "Normal",
						"emitRad1": 0.7,
						"emitAngle": 360,
						"warmUpTime": -0.25
					},
					"z": 10.13105,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 5,
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
											"textureWrap": true,
											"emissive": 25
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
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "color.h",
											"keys": [
												{
													"time": 0,
													"value": 0.2628260520650284,
													"mode": 2
												},
												{
													"time": 0.61,
													"value": 0.2628205811313724,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.2628,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "color.s",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.61,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.19
													},
													"nextHandle": {
														"dv": -2.1499354918364647e-16,
														"dt": 0.26333333333333336
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
											"name": "color.l",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 0.61,
													"value": 0.05882,
													"mode": 0,
													"prevHandle": {
														"dv": 0.009403613664215618,
														"dt": -0.21999999999999997
													},
													"nextHandle": {
														"dv": -0.01119188451440024,
														"dt": 0.26326535002683493
													}
												},
												{
													"time": 1,
													"value": 0.058823529411764705,
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
							"name": "instSpeed.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 3.022033566727083,
										"dt": -0.2526618227919364
									},
									"nextHandle": {
										"dv": -1.0166666666666666,
										"dt": 0.085
									}
								},
								{
									"time": 0.9903769144228197,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.016666666666666663,
										"dt": -0.5253769144228198
									},
									"nextHandle": {
										"dv": -0.020808987292503984,
										"dt": 0.6554830997138851
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
										"dv": 2.9713780548902946,
										"dt": -0.3019303507388523
									},
									"nextHandle": {
										"dv": -1.0333333333333332,
										"dt": 0.105
									}
								},
								{
									"time": 0.9903769144228197,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.016666666666666663,
										"dt": -0.6053769144228197
									},
									"nextHandle": {
										"dv": -0.0180575879092897,
										"dt": 0.6554904411072038
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
										"dv": -0.03316093014576553,
										"dt": -0.4999010219474131
									},
									"nextHandle": {
										"dv": 0.06666666666666665,
										"dt": 1.005
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.1666666666666665,
										"dt": -0.010000000000000009
									},
									"nextHandle": {
										"dv": 0.7916682837335377,
										"dt": 0.006785728146287541
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
						},
						{
							"type": "trails",
							"name": "trails_Smoke",
							"enabled": false,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
							"startWidth": 3,
							"endWidth": 1,
							"minSpeed": 0.1,
							"maxSpeed": 20,
							"uvStretch": 2,
							"uvRepeat": "EClamp",
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
											"depthTest": "LessEqual"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Alphas/T_SmokeTrail_Missile.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.5
									},
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
													"time": 0.01,
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
											0.24705882352941178,
											0.24705882352941178,
											0.24705882352941178
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.01,
											"value": 1,
											"mode": 2
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
										"progress": 0.71,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad.png",
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": null,
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
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 0.36328125,
														"color": -13959424
													},
													{
														"position": 1,
														"color": -65536
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
						}
					]
				},
				{
					"type": "shader",
					"name": "DepthBlend",
					"source": "shaders/DepthBlend.hx",
					"props": {
						"REVERSE": false,
						"range": 1.5,
						"power": 0.8
					}
				}
			]
		}
	]
}