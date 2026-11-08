{
	"type": "fx",
	"duration": 6,
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
					"type": "object",
					"name": "GrenadeExplosion",
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
											"name": "Fireball",
											"enabled": false,
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
												"instScale": 28,
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
												"warmUpTime": -1.6
											},
											"z": -1.58,
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
																	"emissive": 3
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
																	0.5176470588235293,
																	0.7254901960784313,
																	0.2627450980392157
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
															"value": -0.509348731270885,
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
															"time": 0.1959318440816542,
															"value": 0.377995077377486,
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
												"instScale": 19,
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
												"lifeTime": 1.5,
												"alignMode": "Screen",
												"warmUpTime": -1.5
											},
											"z": 4.73877,
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
																	0.23137254901960785,
																	0.28627450980392155,
																	0.09803921568627451
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
											"name": "Smoke",
											"enabled": false,
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
												"instScale": 21,
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
												"lifeTime": 1.5,
												"warmUpTime": -1.3
											},
											"z": -1.65,
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
																	0.2,
																	0.2392156862745098,
																	0.09411764705882353
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
																"uvScaleX": 1,
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
																				"dv": 0.3386111111111111,
																				"dt": -0.385
																			},
																			"nextHandle": {
																				"dv": -0.3675355137339586,
																				"dt": 0.4178869745982501
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
												"instScale": 25,
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
												"warmUpTime": -1.6
											},
											"z": 0.96528,
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
																	"emissive": 3
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
																	0.5098039215686274,
																	0.7254901960784313,
																	0.2627450980392157
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
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "LensFlare",
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
										"warmUpTime": -1.6,
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
															"emissive": 1
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
												"instScale": 8,
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
												"warmUpTime": -1.6,
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
										},
										{
											"type": "emitter",
											"name": "LensFlare_color",
											"enabled": false,
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
												"warmUpTime": -1.6,
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
									"enabled": false,
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
										"warmUpTime": -1.6,
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
									"x": 0.54727,
									"y": -0.68901,
									"z": -0.3792,
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
														"alpha": 0.05,
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
						},
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"props": {
								"amount": 1,
								"color": [
									0.5882352941176471,
									1,
									0.40784313725490196
								]
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Sand",
					"z": -0.7515000000000001,
					"children": [
						{
							"type": "emitter",
							"name": "SandResiduel",
							"props": {
								"lifeTime": 2.4,
								"lifeTimeRand": 0.25,
								"speedFactor": 0.8,
								"warmUpTime": -1.3,
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
								"instScale": 22,
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
									-1
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
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
							"z": -0.4545000000000001,
							"scaleX": 4.500000000000001,
							"scaleY": 22.5,
							"scaleZ": 22.500000000000004,
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
													0.8274509803921568,
													0.8823529411764706,
													0.6627450980392157
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
												"range": 7.58,
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
				}
			]
		}
	]
}