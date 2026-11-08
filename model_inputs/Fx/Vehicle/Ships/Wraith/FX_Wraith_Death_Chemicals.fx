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
					"source": "Vehicle/Smuggler/Wraith/Wraith.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": -4,
							"animation": "Anim/Wraith/Anim_Wraith_Death.fbx"
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
														"warmUpTime": -0.1
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
															"emissive": 2
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
																		"color": -13879006
																	},
																	{
																		"position": 1,
																		"color": -8079037
																	}
																],
																"resolution": 64,
																"isVertical": false
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
																"isVertical": false
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
							"x": 9.713686964285714,
							"y": -3.608649464285714,
							"z": 0.7798312500000001,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"children": [
								{
									"type": "object",
									"name": "-----------------------------Fireball",
									"x": -1.75859,
									"y": -1.18149,
									"z": 2.04,
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
											"z": 1.56,
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
											"z": 1.84,
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
																	"emissive": 20
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
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.25,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
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
									"type": "object",
									"name": "-----------------------------Fireball",
									"z": 2.04,
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
											"z": 1.56,
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
											"z": 1.84,
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
																	"emissive": 20
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
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.25,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
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
									"type": "object",
									"name": "-----------------------------Fireball",
									"z": 2.04,
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
												"burstParticleCount": 2,
												"emitShape": "Cylinder",
												"emitRad1": 0.83,
												"emitSurface": true,
												"lifeTimeRand": 0.3,
												"lifeTime": 1.6,
												"warmUpTime": -0.1,
												"alignMode": "Screen"
											},
											"z": 1.56,
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
												"burstParticleCount": 4,
												"emitShape": "Cylinder",
												"emitRad1": 0.83,
												"emitSurface": true,
												"lifeTimeRand": 0.2,
												"alignMode": "Screen",
												"lifeTime": 1.2,
												"warmUpTime": -0.15
											},
											"z": 1.84,
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
																	"emissive": 25
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
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.25,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "object",
							"name": "explomid",
							"x": -3.246992321428571,
							"y": -3.365180178571429,
							"z": 4.261066250000001,
							"children": [
								{
									"type": "object",
									"name": "-----------------------------Fireball",
									"x": -1.98442,
									"z": 2.04,
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
											"z": 1.56,
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
											"z": 1.84,
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
																	"emissive": 20
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
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.25,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "SandShockWave",
					"x": -1.91605,
					"y": 3.50311,
					"z": 4.00942,
					"scaleX": 0.7,
					"scaleY": 0.7,
					"scaleZ": 0.7,
					"children": [
						{
							"type": "emitter",
							"name": "Impact_Burst_Mid_SandJet_L",
							"props": {
								"instScale_rand": 3.5,
								"simulationSpace": "World",
								"animationSpeed": 0.1,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 3,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 25,
								"lifeTime": 8,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8431372549019608,
									0.7607843137254902,
									0.7254901960784313,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 64,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"warmUpTime": -0.1,
								"emitType": "Burst",
								"burstParticleCount": 8,
								"emitAngle": 180,
								"emitDuration": 20,
								"burstDelay": 1.35,
								"seedGroup": 3,
								"instSpeed": [
									2,
									0,
									0
								],
								"emitRad2": 0.9,
								"useRandomColor": true
							},
							"x": -0.7514,
							"z": -0.32935,
							"scaleX": 35,
							"scaleY": 35,
							"scaleZ": 0.23,
							"rotationZ": -90,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.7
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
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
													0.6705882352941176,
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
												"uvScaleX": 0.25,
												"uvScaleY": 0.25,
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.3,
												"sandColorSet": false,
												"envBlend": 0.3,
												"envColorSet": false
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.388476860780481,
												"dt": -0.06199247660355442
											},
											"nextHandle": {
												"dv": 0.7972549709272361,
												"dt": 0.03559570312500002
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.92880859375
											},
											"nextHandle": {
												"dv": -2.5729900539317147e-16,
												"dt": 0.42212406308208533
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Impact_Burst_Mid_SandJet_R",
							"props": {
								"instScale_rand": 3.5,
								"simulationSpace": "World",
								"animationSpeed": 0.1,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 3,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 25,
								"lifeTime": 8,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8431372549019608,
									0.7607843137254902,
									0.7254901960784313,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 64,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"warmUpTime": -0.1,
								"emitType": "Burst",
								"burstParticleCount": 8,
								"emitAngle": 180,
								"emitDuration": 20,
								"burstDelay": 1.35,
								"seedGroup": 2,
								"instSpeed": [
									2,
									0,
									0
								],
								"emitRad2": 0.9,
								"useRandomColor": true
							},
							"x": -0.7514,
							"z": -0.32935,
							"scaleX": 35,
							"scaleY": 35,
							"scaleZ": 0.23,
							"rotationZ": 90,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.7
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
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
													0.6705882352941176,
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
												"uvScaleX": 0.25,
												"uvScaleY": 0.25,
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.3,
												"sandColorSet": false,
												"envBlend": 0.3,
												"envColorSet": false
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.388476860780481,
												"dt": -0.06199247660355442
											},
											"nextHandle": {
												"dv": 0.7972549709272361,
												"dt": 0.03559570312500002
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.92880859375
											},
											"nextHandle": {
												"dv": -2.5729900539317147e-16,
												"dt": 0.42212406308208533
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Impact_Burst_Far_SandJet_L",
							"props": {
								"instScale_rand": 4,
								"simulationSpace": "World",
								"animationSpeed": 0.1,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 3,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 18,
								"lifeTime": 8,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8431372549019608,
									0.7607843137254902,
									0.7254901960784313,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 64,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"warmUpTime": -0.4,
								"emitType": "Burst",
								"burstParticleCount": 13,
								"emitAngle": 180,
								"emitDuration": 20,
								"burstDelay": 1.35,
								"seedGroup": 4,
								"instSpeed": [
									6,
									0,
									0
								],
								"useRandomColor": true
							},
							"x": -0.7514,
							"z": -0.32935,
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 0.16,
							"rotationZ": -90,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.7
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
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
													0.6705882352941176,
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
												"uvScaleX": 0.25,
												"uvScaleY": 0.25,
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.3,
												"sandColorSet": false,
												"envBlend": 0.3,
												"envColorSet": false
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.388476860780481,
												"dt": -0.06199247660355442
											},
											"nextHandle": {
												"dv": 0.7972549709272361,
												"dt": 0.03559570312500002
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.92880859375
											},
											"nextHandle": {
												"dv": -2.5729900539317147e-16,
												"dt": 0.42212406308208533
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Impact_Burst_Far_SandJet_L",
							"props": {
								"instScale_rand": 4,
								"simulationSpace": "World",
								"animationSpeed": 0.1,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 3,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 18,
								"lifeTime": 8,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8431372549019608,
									0.7607843137254902,
									0.7254901960784313,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 64,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"warmUpTime": -0.4,
								"emitType": "Burst",
								"burstParticleCount": 13,
								"emitAngle": 180,
								"emitDuration": 20,
								"burstDelay": 1.35,
								"seedGroup": 4,
								"instSpeed": [
									6,
									0,
									0
								],
								"useRandomColor": true
							},
							"x": -0.7514,
							"z": -0.32935,
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 0.16,
							"rotationZ": 90,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.7
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
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
													0.6705882352941176,
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
												"uvScaleX": 0.25,
												"uvScaleY": 0.25,
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.3,
												"sandColorSet": false,
												"envBlend": 0.3,
												"envColorSet": false
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.388476860780481,
												"dt": -0.06199247660355442
											},
											"nextHandle": {
												"dv": 0.7972549709272361,
												"dt": 0.03559570312500002
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.92880859375
											},
											"nextHandle": {
												"dv": -2.5729900539317147e-16,
												"dt": 0.42212406308208533
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
								"range": 4,
								"power": 0.8
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}