{
	"type": "fx",
	"duration": 9,
	"markers": [
		{
			"t": 0
		}
	],
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
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
		},
		{
			"type": "object",
			"name": "Backup",
			"enabled": false,
			"rotationZ": 120,
			"children": [
				{
					"type": "model",
					"name": "BaseArrakeen",
					"source": "Structure/Base/Arrakeen/BaseArrakeen.fbx",
					"z": -0.15
				},
				{
					"type": "object",
					"name": "placeholderExplo",
					"enabled": false,
					"x": 3.12404,
					"y": -0.48981,
					"children": [
						{
							"type": "emitter",
							"name": "emitter",
							"props": {
								"lifeTime": 0.25,
								"emitType": "Burst",
								"alignMode": "Screen"
							},
							"y": -2.22966,
							"z": 18.83246,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 50,
									"scaleY": 49.999999999999986,
									"scaleZ": 50.00000000000001,
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
													"depthTest": "LessEqual",
													"alphaKill": false,
													"enableStencil": false,
													"drawOrder": "100",
													"emissive": 40
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
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.9,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
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
															"time": 0.71,
															"value": 0.9833333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03144094491268983,
																"dt": -0.49991102411176125
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.2649999999999999
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/NoisyWave_01.png",
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
															"time": 0.7749999999999999,
															"value": 1,
															"mode": 2
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
													"name": "width",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
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
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"enabled": false,
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"enabled": false,
											"props": {
												"saturation": 0,
												"width": 0.48,
												"useU": false,
												"progress": 0.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.9949999999999999,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.2666666666666667,
																"dt": -1.79
															},
															"nextHandle": {
																"dv": 0.09929240604583035,
																"dt": 0.6665002755826369
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
													0,
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0.12000000000000001,
															"value": 0.21448624542580919,
															"mode": 2
														},
														{
															"time": 0.33,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.47000000000000003,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6749999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.21448624542580919,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keys": [
														{
															"time": 0.12000000000000001,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.33,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.47000000000000003,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6749999999999999,
															"value": 0,
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
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.12000000000000001,
															"value": 0.6745098039215687,
															"mode": 0,
															"prevHandle": {
																"dv": 1.177032890353281,
																"dt": -0.3531098671059842
															},
															"nextHandle": {
																"dv": -0.457843137254902,
																"dt": 0.135
															}
														},
														{
															"time": 0.33,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.47000000000000003,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6749999999999999,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0.6745098039215687,
															"mode": 0
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
												"range": 50,
												"power": 0.5
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "GrenadeExplosion",
							"y": 3.00933,
							"z": -6.26871,
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 5,
							"children": [
								{
									"type": "object",
									"name": "Explosion_medium",
									"z": -1.7756,
									"scaleX": 0.75,
									"scaleY": 0.75,
									"scaleZ": 0.75,
									"children": [
										{
											"type": "object",
											"name": "-----------------------------Fireball",
											"z": 2.89756,
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
														"instScale": 15,
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
														"alignMode": "Screen",
														"warmUpTime": -0.1
													},
													"y": -1.49022,
													"z": 5.16632,
													"scaleX": 0.1,
													"scaleY": 0.1,
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
																			"emissive": 35
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
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			1,
																			0.6509803921568628,
																			0.5490196078431373
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
																		"uvScaleX": 0.8,
																		"uvScaleY": 0.8,
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
																						"dv": -0.021397407793399287,
																						"dt": -0.6290837891259519
																					},
																					"nextHandle": {
																						"dv": 0.016666666666666607,
																						"dt": 0.49000000000000005
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.23333333333333334,
																						"dt": -0.040000000000000036
																					},
																					"nextHandle": {
																						"dv": -1.2622263339976019,
																						"dt": 0.21638165725673145
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
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 10,
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
										}
									]
								},
								{
									"type": "emitter",
									"name": "SandFloor",
									"props": {
										"instScale_rand": 3,
										"maxCount": 50,
										"simulationSpace": "World",
										"animationSpeed": 0.3,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											1,
											1,
											1,
											0.8509803921568627
										],
										"emitRate": 1,
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
										"lifeTime": 3.5,
										"emitType": "Burst",
										"burstParticleCount": 8,
										"emitOrientation": "Normal",
										"emitShape": "Cylinder",
										"emitRad1": 0.73,
										"emitRad2": 0.73,
										"emitSurface": true,
										"instScale": 30,
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"instStartSpeed_rand": [
											0,
											0,
											0
										],
										"lifeTimeRand": 1,
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instAcceleration_rand": [
											0.2,
											0,
											0
										],
										"instAcceleration": [
											1,
											0,
											0
										],
										"warmUpTime": -0.15
									},
									"z": 1.84649,
									"scaleX": 14,
									"scaleY": 14,
									"scaleZ": 0.01,
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
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": false,
															"parallax": 0,
															"textureWrap": true
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Structure/Smoke/white.png",
													"color": [
														1,
														1,
														1,
														0.12941176470588234
													]
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
																	"time": 0,
																	"value": -0.032777777777777795,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.05083333333333336
																	}
																},
																{
																	"time": 0.045,
																	"value": 0.9833333333333334,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.07562525672400151,
																		"dt": -0.02399211269568948
																	},
																	"nextHandle": {
																		"dv": -0.8333333333333334,
																		"dt": 0.2643750000000001
																	}
																},
																{
																	"time": 0.95,
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
															1,
															1
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
														"width": 0.5,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.01,
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
																		"dv": 0.8483515290485304,
																		"dt": -0.43041364341432775
																	},
																	"nextHandle": {
																		"dv": -1.1333333333333333,
																		"dt": 0.575
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
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topIntensity": 0.4,
													"topSpan": 0.5,
													"dirIntensity": 0.5,
													"dirSpan": 0.9,
													"sandBlend": 0.6,
													"envBlend": 0.5
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
													"value": 0.75,
													"mode": 0,
													"prevHandle": {
														"dv": -0.22802103774116936,
														"dt": -4.6905750256010215e-17
													},
													"nextHandle": {
														"dv": 0.3021941037419147,
														"dt": 0
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01592731329366892,
														"dt": -0.97
													},
													"nextHandle": {
														"dv": 0.005310297331676772,
														"dt": 0.33332890503740775
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "SandResiduel",
									"props": {
										"lifeTime": 1.5,
										"lifeTimeRand": 0.25,
										"speedFactor": 0.8,
										"emitType": "Burst",
										"burstParticleCount": 3,
										"emitShape": "Cone",
										"emitAngle": 19.09,
										"emitSurface": true,
										"alignMode": "Screen",
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0,
										"instScale": 24,
										"instSpeed": [
											25,
											0,
											0
										],
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
										"instRotation_rand": [
											0,
											0,
											360
										],
										"instScale_rand": 5,
										"instSpeed_rand": [
											3,
											0,
											0
										],
										"instWorldSpeed": [
											0,
											0,
											-4
										],
										"instWorldSpeed_rand": [
											0,
											0,
											-1
										],
										"randomColor1": [
											0.9803921568627451,
											0.9254901960784314,
											0.8980392156862745,
											1
										],
										"randomColor2": [
											0.7490196078431373,
											0.6705882352941176,
											0.6313725490196078,
											1
										]
									},
									"z": 0.95487,
									"scaleX": 5,
									"scaleY": 25,
									"scaleZ": 25,
									"rotationY": -90,
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
														"scale": 1.5
													},
													"isInstance": true
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
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
																	"value": 0.7,
																	"mode": 2
																},
																{
																	"time": 0.85,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.6533333333333333,
																		"dt": -0.2350000000000001
																	},
																	"nextHandle": {
																		"dv": -0.7068174305257382,
																		"dt": 0.25423790230645144
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
															0.9764705882352941,
															0.9607843137254902,
															0.9490196078431372
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
														"range": 50,
														"power": 1
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.4,
													"topSpan": 0.5,
													"dirIntensity": 0.5,
													"dirSpan": 0.9,
													"sandBlend": 0.6,
													"envBlend": 0.5
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
														"dv": 2.9173338952643375,
														"dt": -0.34612783862841096
													},
													"nextHandle": {
														"dv": -1.1533247604966166,
														"dt": 0.1375675736137951
													}
												},
												{
													"time": 0.9903769144228197,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.012976087629794963,
														"dt": -0.6555012670999958
													},
													"nextHandle": {
														"dv": -0.012976087629794963,
														"dt": 0.6555012670999958
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "InstWorldSpeed.z",
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
														"dv": -1.140345982142858,
														"dt": -0.13896948945309906
													},
													"nextHandle": {
														"dv": 0.7341459191045832,
														"dt": 0.08913588385340426
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
							"name": "LensFlare",
							"x": 0.14333,
							"y": -2.33833,
							"z": 32.89661,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
							"children": [
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
											"name": "LensFlare_color_small2",
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
												"instScale": 4,
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
												],
												"lifeTime": 0.3
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
																	"emissive": 20
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
																"alpha": 0.2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_LensFlare_04.png",
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
										},
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
																"alpha": 0.1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_LensFlare_04.png",
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
										},
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
												"instScale": 4,
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
																	"emissive": 20
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
																"alpha": 0.2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_LensFlare_04.png",
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
											"type": "emitter",
											"name": "LensFlare_color",
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
												"warmUpTime": -0.1,
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
																	"emissive": 15
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
																"alpha": 0.1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_LensFlare_04.png",
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
								},
								{
									"type": "emitter",
									"name": "LensFlare_circle",
									"props": {
										"alignMode": "Screen",
										"instScale_rand": 1.5,
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
										"instScale": 5.5,
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
									"x": -0.14,
									"y": -0.23,
									"z": 0.55,
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
														"alpha": 0.07,
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
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "SmallExplosions",
					"children": [
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": -5.82252,
							"y": 15.59646,
							"z": 2.94337,
							"rotationX": 59,
							"children": [
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
							"type": "subFX",
							"name": "02 - FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
							"x": 15.67706,
							"y": 0.11421,
							"z": 3.46251,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"rotationX": -42.7,
							"rotationY": 8.6,
							"rotationZ": 86.5,
							"time": 0.51444,
							"children": [
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
							"type": "subFX",
							"name": "03 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": 4.25873,
							"y": 4.2279,
							"z": 4.6397,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"rotationX": 15,
							"time": 1.06726,
							"children": [
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
							"type": "subFX",
							"name": "04 - FX_Explosion_Mid_Slow_SmallDistort",
							"source": "Fx/Explosion/FX_Explosion_Mid_Slow_SmallDistort.fx",
							"x": 7.89036,
							"y": 9.3223,
							"z": -0.43613,
							"scaleX": 0.6,
							"scaleY": 0.6,
							"scaleZ": 0.6,
							"rotationZ": -180,
							"time": 0.32778,
							"children": [
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
						}
					]
				},
				{
					"type": "object",
					"name": "Electricity",
					"rotationZ": -130,
					"children": [
						{
							"type": "object",
							"name": "Explo1",
							"x": -8.27187,
							"y": -14.39217,
							"z": 3.49577,
							"rotationZ": 130,
							"children": [
								{
									"type": "subFX",
									"name": "03 - FX_ElectricArcs02",
									"source": "Fx/Vehicle/Common/FX_ElectricArcs02.fx",
									"x": -1.15788,
									"y": 2.39569,
									"z": -1.37549,
									"scaleX": 1.9999999999999993,
									"scaleY": 4.999999999999999,
									"scaleZ": 3,
									"rotationX": 77.3,
									"rotationY": -26.2,
									"rotationZ": -146.9,
									"time": 1.30117,
									"children": [
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "subFX",
									"name": "02 - FX_ElectricArcs",
									"source": "Fx/Vehicle/Common/FX_ElectricArcs.fx",
									"x": 1.53738,
									"y": -1.28674,
									"z": 0.46107,
									"scaleX": 2.25,
									"scaleY": 2.25,
									"scaleZ": 2.25,
									"rotationX": 43,
									"rotationY": -2.2,
									"rotationZ": -40.7,
									"time": 1.10731,
									"children": [
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "subFX",
									"name": "FX_ElectricSparkles02",
									"source": "Fx/Vehicle/Common/FX_ElectricSparkles02.fx",
									"x": -0.052083333333333925,
									"y": -0.6293100000000003,
									"z": -0.9718466666666665,
									"rotationX": 40.9,
									"time": 0.92485
								}
							]
						},
						{
							"type": "object",
							"name": "Tower",
							"x": 4.18263,
							"y": 1.77807,
							"z": 3.49577,
							"children": [
								{
									"type": "subFX",
									"name": "03 - FX_ElectricArcs02",
									"source": "Fx/Vehicle/Common/FX_ElectricArcs02.fx",
									"x": -5.2926,
									"y": -4.48435,
									"z": 8.63535,
									"scaleX": 1.9999999999999993,
									"scaleY": 4.999999999999999,
									"scaleZ": 1.9999999999999998,
									"rotationX": -47.5,
									"rotationY": 48.5,
									"rotationZ": -168.1,
									"time": 1.69333,
									"children": [
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "subFX",
									"name": "02 - FX_ElectricArcs",
									"source": "Fx/Vehicle/Common/FX_ElectricArcs.fx",
									"x": -8.12834,
									"y": 0.27822,
									"z": 3.29238,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"rotationX": -30.7,
									"rotationY": -37,
									"rotationZ": -15.7,
									"time": 1.49778,
									"children": [
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "subFX",
									"name": "FX_ElectricArcs03",
									"source": "Fx/Vehicle/Common/FX_ElectricArcs03.fx",
									"x": -4.18263,
									"y": -1.77807,
									"z": -3.49577,
									"time": 1.26667
								},
								{
									"type": "subFX",
									"name": "01 - FX_ElectricSparkles",
									"source": "Fx/Vehicle/Common/FX_ElectricSparkles.fx",
									"x": -6.54345,
									"y": -3.02694,
									"z": 5.44105,
									"scaleX": 1.1,
									"scaleY": 1.1,
									"scaleZ": 1.1,
									"rotationX": 32.5,
									"rotationY": -49.1,
									"time": 2.08889
								},
								{
									"type": "subFX",
									"name": "FX_ElectricSparkles02",
									"source": "Fx/Vehicle/Common/FX_ElectricSparkles02.fx",
									"x": -5.27208,
									"y": 1.09863,
									"z": 2.85417,
									"scaleX": 1.25,
									"scaleY": 1.25,
									"scaleZ": 1.25,
									"rotationX": 3.8,
									"rotationY": -48.2,
									"rotationZ": -39.7,
									"time": 2.21333
								},
								{
									"type": "subFX",
									"name": "03 - FX_ElectricArcs02",
									"source": "Fx/Vehicle/Common/FX_ElectricArcs02.fx",
									"x": -7.06581,
									"y": -1.95124,
									"z": 5.15081,
									"scaleX": 2,
									"scaleY": 5,
									"scaleZ": 2,
									"rotationX": -107.7,
									"rotationY": 28.6,
									"rotationZ": 78.4,
									"time": 1.70029,
									"children": [
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 3,
												"power": 0.8
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Explo4",
							"x": -10.06627,
							"y": 1.56004,
							"children": [
								{
									"type": "subFX",
									"name": "03 - FX_ElectricArcs02",
									"source": "Fx/Vehicle/Common/FX_ElectricArcs02.fx",
									"x": -0.69499,
									"y": 0.06183,
									"z": 3.43788,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 2,
									"rotationX": -3.9,
									"rotationY": -16.6,
									"rotationZ": -32,
									"time": 3.2793,
									"children": [
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "subFX",
									"name": "03 - FX_ElectricArcs02",
									"source": "Fx/Vehicle/Common/FX_ElectricArcs02.fx",
									"x": 2.68687,
									"y": 10.7544,
									"z": 3.12006,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 2,
									"rotationX": -6.6,
									"rotationY": 41.3,
									"rotationZ": 11,
									"time": 3.36,
									"children": [
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "subFX",
									"name": "02 - FX_ElectricArcs",
									"source": "Fx/Vehicle/Common/FX_ElectricArcs.fx",
									"x": -2.02537,
									"y": -4.64749,
									"z": 2.17543,
									"scaleX": 0.75,
									"rotationX": 75.5,
									"rotationY": -6.2,
									"rotationZ": -122.6,
									"time": 1.61343,
									"children": [
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "subFX",
									"name": "FX_ElectricArcs03",
									"source": "Fx/Vehicle/Common/FX_ElectricArcs03.fx",
									"x": -1.2401,
									"y": -5.35287,
									"z": 3.82598,
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"rotationY": -24.7,
									"rotationZ": -67,
									"time": 1.53334,
									"children": [
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2,
												"power": 0.8
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Tower02",
							"x": 4.18263,
							"y": 1.77807,
							"z": 3.49577,
							"children": [
								{
									"type": "subFX",
									"name": "03 - FX_ElectricArcs02",
									"source": "Fx/Vehicle/Common/FX_ElectricArcs02.fx",
									"x": -7.06581,
									"y": -1.95124,
									"z": 5.15081,
									"scaleX": 2,
									"scaleY": 5,
									"scaleZ": 2,
									"rotationX": -107.7,
									"rotationY": 28.6,
									"rotationZ": 78.4,
									"time": 4.32703,
									"children": [
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 3,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "subFX",
									"name": "02 - FX_ElectricArcs",
									"source": "Fx/Vehicle/Common/FX_ElectricArcs.fx",
									"x": -6.10508,
									"y": -3.76255,
									"z": 9.7958,
									"rotationX": 67.9,
									"rotationY": -37,
									"rotationZ": -15.7,
									"time": 4.53253,
									"children": [
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "subFX",
									"name": "FX_ElectricArcs03",
									"source": "Fx/Vehicle/Common/FX_ElectricArcs03.fx",
									"x": -4.28072,
									"y": -5.16065,
									"z": 7.1177,
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2,
									"rotationX": 53,
									"time": 4.65582,
									"children": [
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.8
											}
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
			"name": "FXRoot",
			"rotationZ": 120,
			"children": [
				{
					"type": "object",
					"name": "SmallExplosions",
					"x": 2.36314,
					"y": -2.803138571428571,
					"z": 3.3610814285714286,
					"children": [
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": -1.68843,
							"y": -0.19603,
							"z": 6.53665,
							"scaleX": 1.5,
							"scaleY": 1.5000000000000009,
							"scaleZ": 1.5000000000000009,
							"rotationX": 90,
							"children": [
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
							"type": "subFX",
							"name": "02 - FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
							"x": -3.71347,
							"y": 14.274978571428571,
							"z": -1.1677814285714287,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"rotationX": -29.999999999999993,
							"time": 0.39244,
							"children": [
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
							"type": "subFX",
							"name": "03 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": 4.67634,
							"y": -11.38393142857143,
							"z": 1.2737085714285712,
							"scaleX": 1.3,
							"scaleY": 1.3,
							"scaleZ": 1.3,
							"rotationX": 14.999999999999998,
							"time": 1.06726,
							"children": [
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
							"type": "subFX",
							"name": "05 - FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
							"x": 7.846580000000001,
							"y": 1.904708571428571,
							"z": -2.6813714285714285,
							"rotationX": -29.999999999999993,
							"rotationZ": 180,
							"time": 1.2469,
							"children": [
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
							"type": "subFX",
							"name": "06 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": 4.67634,
							"y": 6.332458571428571,
							"z": -2.2076114285714286,
							"scaleX": 1.3,
							"scaleY": 1.3,
							"scaleZ": 1.3,
							"rotationX": -29.89999999999999,
							"rotationY": 89.99999999999999,
							"time": 1.33757,
							"children": [
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
							"type": "subFX",
							"name": "07 - FX_Explosion_Mid_Slow_SmallDistort",
							"source": "Fx/Explosion/FX_Explosion_Mid_Slow_SmallDistort.fx",
							"x": -13.724419999999999,
							"y": 8.52667857142857,
							"z": -3.3610814285714286,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationZ": -180,
							"time": 0.10412,
							"children": [
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
							"type": "subFX",
							"name": "08 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/FX_Directional_Explosion_trails.fx",
							"x": -12.402389999999999,
							"y": -13.19817142857143,
							"z": -3.4166214285714287,
							"scaleY": 0.9999999999999999,
							"rotationX": -60.5,
							"rotationZ": -180,
							"time": 1.36,
							"children": [
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
							"type": "subFX",
							"name": "09 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/FX_Directional_Explosion_trails.fx",
							"x": 0.6050300000000002,
							"y": 1.611788571428571,
							"z": 1.6630285714285717,
							"scaleX": 1.5,
							"scaleY": 1.5000000000000002,
							"scaleZ": 1.5,
							"rotationX": 55.4,
							"rotationY": -18.9,
							"rotationZ": 154.8,
							"time": 1.36,
							"children": [
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
						}
					]
				},
				{
					"type": "model",
					"name": "BaseArrakeen",
					"source": "Structure/Base/Arrakeen/BaseArrakeen.fbx",
					"editorOnly": true,
					"z": -0.15
				}
			]
		}
	]
}