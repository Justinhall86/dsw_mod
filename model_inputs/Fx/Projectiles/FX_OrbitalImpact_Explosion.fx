{
	"type": "fx",
	"duration": 8,
	"cullingRadius": 30,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 70,
			"scaleY": 70,
			"scaleZ": 70,
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
			"scaleX": 0.45,
			"scaleY": 0.45,
			"scaleZ": 0.45,
			"children": [
				{
					"type": "object",
					"name": "backup",
					"enabled": false,
					"y": 83.35085,
					"children": [
						{
							"type": "object",
							"name": "Decal",
							"scaleX": 0.75,
							"scaleY": 0.75,
							"children": [
								{
									"type": "advancedDecal",
									"name": "SandDecal",
									"y": 0.47708799999999996,
									"z": -0.7724239999999991,
									"scaleX": 70,
									"scaleY": 70,
									"scaleZ": 20,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"normalMap": "Fx/DistortionMaps/sand-normal.png",
									"fadePower": 2,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SandDecal_04.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.008393107932128274,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.018393107932128283,
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
													0,
													0,
													0
												]
											}
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
										"progress": 1,
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
										]
									},
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
														"dv": 0.004816259989233215,
														"dt": -0.5003174060411008
													},
													"nextHandle": {
														"dv": -0.008611111111111125,
														"dt": 1.760204081632653
													}
												},
												{
													"time": 2.9974489795918364,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Lightorange",
									"x": -0.01653,
									"y": 0.42902,
									"z": 1.15864,
									"scaleX": 75,
									"scaleY": 75,
									"scaleZ": 20,
									"rotationZ": 90,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"normalMap": "Fx/DistortionMaps/sand-normal.png",
									"renderMode": "BeforeTonemapping",
									"centered": false,
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8549019607843137,
													0.11372549019607843,
													0
												]
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
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1.8,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.2350464952793597,
																"dt": -0.5697909948203433
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 1.7360265640076256
															}
														},
														{
															"time": 2.107422958699724,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.5362274899014466,
																"dt": -0.03051465728228661
															},
															"nextHandle": {
																"dv": -1.0833333333333335,
																"dt": 0.06763066874190042
															}
														},
														{
															"time": 2.348619992178345,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -1.5001100955933375
															},
															"nextHandle": {
																"dv": -2.645156755157441e-16,
																"dt": 1.3315641396163127
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
							"name": "Explosion",
							"scaleX": 1.75,
							"scaleY": 1.75,
							"scaleZ": 1.75,
							"children": [
								{
									"type": "object",
									"name": "Explosion",
									"z": 0.5,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
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
												"instScale": 9,
												"emitType": "Burst",
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
												"lifeTime": 1.6,
												"warmUpTime": 0.2
											},
											"z": 1,
											"scaleZ": 0.03,
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
																	"emissive": 14
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
												},
												{
													"type": "curve",
													"name": "instWorldSpeed.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9287547447276908,
																"dt": -0.3140594330283246
															},
															"nextHandle": {
																"dv": -0.6097393689986282,
																"dt": 0.2053336318658323
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6938775510204082
															},
															"nextHandle": {
																"dv": -8.001025754429375e-16,
																"dt": 0.3333333333333333
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
												"lifeTime": 2.4,
												"lifeTimeRand": 0.25,
												"speedFactor": 0.8,
												"warmUpTime": 0.2,
												"emitType": "Burst",
												"burstParticleCount": 4,
												"emitShape": "Cone",
												"emitAngle": 8.18,
												"emitSurface": true,
												"alignMode": "Screen",
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"instScale": 20,
												"instSpeed": [
													30,
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
													4,
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
											"z": -1.34,
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
																"scale": 1
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
																"range": 1,
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
										},
										{
											"type": "emitter",
											"name": "Debris",
											"props": {
												"lifeTimeRand": 0.25,
												"emitType": "Burst",
												"burstParticleCount": 10,
												"emitShape": "Cone",
												"emitAngle": 20,
												"emitSurface": true,
												"alignMode": "Screen",
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"instScale": 1.8,
												"instSpeed": [
													275,
													0,
													0
												],
												"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
												"instRotation_rand": [
													0,
													0,
													360
												],
												"instScale_rand": 0.9,
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
											"z": -2.66245,
											"scaleX": 8,
											"scaleY": 35,
											"scaleZ": 35,
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
																	"textureWrap": true,
																	"emissive": 5
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
															"name": "ParticleColorRandom",
															"source": "hrt.shader.ParticleColorRandom",
															"props": {
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -13750738
																			},
																			{
																				"position": 1,
																				"color": -8026747
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
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.9882352941176471,
																	0.6588235294117647,
																	0.5450980392156862
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
																				"dv": 2.482331685236416,
																				"dt": -0.43376521434073423
																			},
																			"nextHandle": {
																				"dv": -0.7299382716049383,
																				"dt": 0.1275501709627762
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.0015432098765432167,
																				"dt": -0.688777582850826
																			},
																			"nextHandle": {
																				"dv": -8.149085208076218e-16,
																				"dt": 0.33332670854541535
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
									"name": "projection",
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 0.59,
									"children": [
										{
											"type": "emitter",
											"name": "ExploMesh",
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
													1.1,
													1.1,
													1.6
												],
												"lifeTime": 4,
												"lifeTimeRand": 0.1,
												"emitType": "Burst",
												"instStretch_rand": [
													0.1,
													0.1,
													0.3
												],
												"instScale": 5,
												"instScale_rand": 0.5,
												"seedGroup": 2,
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
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.08,
											"children": [
												{
													"type": "model",
													"name": "CylinderCone_StraightUV",
													"source": "Fx/Meshes_Common/CylinderCone_Double.fbx",
													"scaleX": 40,
													"scaleY": 32,
													"scaleZ": 40,
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
																	"emissive": 10
																}
															},
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
																"alpha": 1,
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
																"amount": 1,
																"color": [
																	1,
																	0.45098039215686275,
																	0.2901960784313725
																]
															}
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
																"saturation": 0.5,
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
										},
										{
											"type": "emitter",
											"name": "SmokeMesh",
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
													1.1,
													1.1,
													1.4
												],
												"lifeTime": 4,
												"lifeTimeRand": 0.1,
												"emitType": "Burst",
												"instStretch_rand": [
													0.1,
													0.1,
													0.3
												],
												"instScale": 5.5,
												"instScale_rand": 0.4,
												"seedGroup": 2,
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
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.08,
											"children": [
												{
													"type": "model",
													"name": "CylinderCone_StraightUV",
													"source": "Fx/Meshes_Common/CylinderCone_Double.fbx",
													"scaleX": 50,
													"scaleY": 40,
													"scaleZ": 50,
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
																	"colorMask": 255
																}
															},
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
																"alpha": 1,
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
																"amount": 1,
																"color": [
																	0.24705882352941178,
																	0.24705882352941178,
																	0.24705882352941178
																]
															}
														},
														{
															"type": "shader",
															"name": "DissolveMapNoise",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.5,
																"saturation": 0.5,
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
																				"dv": -0.03769584106115341,
																				"dt": -0.4990321125962197
																			},
																			"nextHandle": {
																				"dv": 0.03769584106115341,
																				"dt": 0.4990321125962197
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
															"name": "DissolveMapNoise",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 2,
																"uvScaleY": 2,
																"texture": "Fx/noise/NoisyWave_01.png",
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
									"name": "DirectionalExplo_mesh",
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
													0.8,
													4.5,
													0.8
												],
												"lifeTime": 2,
												"lifeTimeRand": 0.1,
												"emitType": "Burst",
												"instStretch_rand": [
													0.2,
													0.55,
													0.2
												],
												"instScale": 3,
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
													0
												],
												"frameDivisionX": 2,
												"frameDivisionY": 2,
												"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2_02.png",
												"alignMode": "Axis"
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
													"rotationX": 180,
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
																	"emissive": 22
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
																	1,
																	0.45098039215686275,
																	0.2901960784313725
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
																	"enabled": false,
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
																	"name": "progress",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.7,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.6759235085971853,
																				"dt": -0.5048474369246049
																			},
																			"nextHandle": {
																				"dv": -0.6759235085971853,
																				"dt": 0.5048474369246049
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
													"name": "instStretch.y",
													"enabled": false,
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
												},
												{
													"type": "curve",
													"name": "instStretch.y",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 0.39762553474525003,
															"mode": 1,
															"prevHandle": {
																"dv": -0.5609260576910832,
																"dt": -0.42893757473558736
															},
															"nextHandle": {
																"dv": 0.10885961743662093,
																"dt": 0.055
															}
														},
														{
															"time": 1,
															"value": 0.9976255347452492,
															"mode": 0,
															"prevHandle": {
																"dv": -0.025293869065672436,
																"dt": -0.4
															},
															"nextHandle": {
																"dv": 0.025293869065672436,
																"dt": 0.4
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
									"name": "light",
									"z": 0.25,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"z": 0.1,
											"scaleX": 20.000000000000004,
											"scaleY": 20.000000000000004,
											"scaleZ": 25.000000000000004,
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
															"emissive": 4
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
														"alpha": 1,
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.002280847618514034,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0.026095232485612962,
																		"dt": 0.008652268165183816
																	}
																},
																{
																	"time": 0.01228084761851403,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.973904767514387,
																		"dt": -0.002469846066785797
																	},
																	"nextHandle": {
																		"dv": -0.0018454413425113003,
																		"dt": 0.03563629180943606
																	}
																},
																{
																	"time": 0.6600217987442046,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.008313947201887162,
																		"dt": -0.4014366734228142
																	},
																	"nextHandle": {
																		"dv": 0.0017579545054934535,
																		"dt": 0.08203710929735801
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
														"power": 0.8
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
											"type": "lookAt",
											"name": "lookAt",
											"z": 0.18088500000000018,
											"scaleX": 0.9999999999999999,
											"scaleY": 0.9999999999999999,
											"rotationZ": -171.4665692135599,
											"target": "camera",
											"lockAxis": [
												0,
												0,
												1
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"scaleX": 20,
													"scaleY": 20,
													"scaleZ": 20,
													"rotationX": 90,
													"rotationZ": 90,
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
																	"emissive": 4
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
																"alpha": 1,
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
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.002280847618514034,
																			"value": 0,
																			"mode": 1,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0.026095232485612962,
																				"dt": 0.008652268165183816
																			}
																		},
																		{
																			"time": 0.01228084761851403,
																			"value": 1,
																			"mode": 1,
																			"prevHandle": {
																				"dv": -0.973904767514387,
																				"dt": -0.002469846066785797
																			},
																			"nextHandle": {
																				"dv": -0.0018454413425113003,
																				"dt": 0.03563629180943606
																			}
																		},
																		{
																			"time": 0.6600217987442046,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.008313947201887162,
																				"dt": -0.4014366734228142
																			},
																			"nextHandle": {
																				"dv": 0.0017579545054934535,
																				"dt": 0.08203710929735801
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
																"range": 3,
																"power": 0.8
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
					"name": "Spikes",
					"z": -5.660724999999999,
					"children": [
						{
							"type": "emitter",
							"name": "SPIKES",
							"props": {
								"enableSort": false,
								"emitSurface": true,
								"frameCount": 4,
								"frameDivisionY": 2,
								"animationSpeed": 0,
								"instSpeed": [
									0,
									0,
									6
								],
								"instStretch": [
									1.7,
									1.7,
									0.9
								],
								"lifeTime": 0.5,
								"lifeTimeRand": 0.1,
								"emitType": "Burst",
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instScale": 5,
								"instScale_rand": 0,
								"seedGroup": 1,
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
								],
								"frameDivisionX": 2
							},
							"scaleX": 0.1225,
							"scaleY": 0.1225,
							"scaleZ": 0.09799999999999999,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV.fbx",
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
													"emissive": 18,
													"drawOrder": "100"
												}
											},
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
												"alpha": 1,
												"uScale": 2,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SpikesExplo.png",
												"onDecal": false
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
													0.45098039215686275,
													0.2901960784313725
												]
											}
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
												"saturation": 0.5,
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
													0.2
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
															"value": 0.8,
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
									"name": "instStretch.x",
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
									"name": "instStretch.y",
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
						},
						{
							"type": "emitter",
							"name": "SPIKESBIG",
							"props": {
								"enableSort": false,
								"emitSurface": true,
								"frameCount": 4,
								"frameDivisionY": 2,
								"animationSpeed": 0,
								"instSpeed": [
									0,
									0,
									6.5
								],
								"instStretch": [
									1,
									1,
									1.5
								],
								"lifeTime": 0.5,
								"lifeTimeRand": 0.1,
								"emitType": "Burst",
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instScale": 6,
								"instScale_rand": 0.25,
								"seedGroup": 2,
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
								],
								"frameDivisionX": 2
							},
							"scaleX": 0.1225,
							"scaleY": 0.1225,
							"scaleZ": 0.09799999999999999,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV.fbx",
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
													"emissive": 18,
													"drawOrder": "100"
												}
											},
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
												"alpha": 1,
												"uScale": 1.2,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SpikesExplo2.png",
												"onDecal": false
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
													0.45098039215686275,
													0.2901960784313725
												]
											}
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
												"saturation": 0.5,
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
													0.2
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
															"value": 0.8,
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
					"type": "emitter",
					"name": "Fireball",
					"props": {
						"instScale_rand": 5,
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
						"instScale": 35,
						"emitType": "Burst",
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
						"lifeTime": 2,
						"warmUpTime": 0.1
					},
					"z": 0.25,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 0.09,
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
											"textureWrap": true,
											"emissive": 14
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
						},
						{
							"type": "curve",
							"name": "instWorldSpeed.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 0.9287547447276908,
										"dt": -0.3140594330283246
									},
									"nextHandle": {
										"dv": -0.6097393689986282,
										"dt": 0.2053336318658323
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.6938775510204082
									},
									"nextHandle": {
										"dv": -8.001025754429375e-16,
										"dt": 0.3333333333333333
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "light",
					"z": 0.8749999999999999,
					"scaleX": 2.7999999999999994,
					"scaleY": 2.7999999999999994,
					"scaleZ": 2.7999999999999994,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"z": 0.1,
							"scaleX": 20.000000000000004,
							"scaleY": 20.000000000000004,
							"scaleZ": 25,
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
											"emissive": 4
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
										"alpha": 1,
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.002280847618514034,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.026095232485612962,
														"dt": 0.008652268165183816
													}
												},
												{
													"time": 0.01228084761851403,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.973904767514387,
														"dt": -0.002469846066785797
													},
													"nextHandle": {
														"dv": -0.0018454413425113003,
														"dt": 0.03563629180943606
													}
												},
												{
													"time": 0.6600217987442046,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.008313947201887162,
														"dt": -0.4014366734228142
													},
													"nextHandle": {
														"dv": 0.0017579545054934535,
														"dt": 0.08203710929735801
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
										"power": 0.8
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
							"type": "lookAt",
							"name": "lookAt",
							"z": 0.18088500000000018,
							"rotationZ": -171.4665692135599,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 15,
									"scaleY": 20,
									"scaleZ": 20,
									"rotationX": 90,
									"rotationZ": 90,
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
													"emissive": 4
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
												"alpha": 1,
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0.002280847618514034,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.026095232485612962,
																"dt": 0.008652268165183816
															}
														},
														{
															"time": 0.01228084761851403,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.973904767514387,
																"dt": -0.002469846066785797
															},
															"nextHandle": {
																"dv": -0.0018454413425113003,
																"dt": 0.03563629180943606
															}
														},
														{
															"time": 0.6600217987442046,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.008313947201887162,
																"dt": -0.4014366734228142
															},
															"nextHandle": {
																"dv": 0.0017579545054934535,
																"dt": 0.08203710929735801
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
												"range": 8,
												"power": 0.7
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
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "projection",
					"z": -3,
					"scaleX": 0.9,
					"scaleY": 0.9,
					"scaleZ": 0.9,
					"children": [
						{
							"type": "emitter",
							"name": "ProjectionLight",
							"props": {
								"enableSort": false,
								"emitSurface": true,
								"frameCount": 4,
								"frameDivisionY": 2,
								"animationSpeed": 0,
								"instStretch": [
									1.5,
									1.5,
									1.5
								],
								"lifeTime": 4,
								"lifeTimeRand": 0.1,
								"emitType": "Burst",
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instScale": 5.5,
								"instScale_rand": 0.25,
								"seedGroup": 2,
								"useRandomColor": true,
								"randomColor1": [
									0.8235294117647058,
									0.7686274509803921,
									0.7176470588235294,
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
								],
								"frameDivisionX": 2
							},
							"scaleX": 0.1225,
							"scaleY": 0.1225,
							"scaleZ": 0.09799999999999999,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV.fbx",
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
													"emissive": 5
												}
											},
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SpikesExplo1.png",
												"onDecal": false
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
													0.24705882352941178,
													0.16470588235294117,
													0.12549019607843137
												]
											}
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
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.1
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.8,
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
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06760381862153372,
																"dt": -0.4976087178514101
															},
															"nextHandle": {
																"dv": -0.06760381862153372,
																"dt": 0.4976087178514101
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
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.8,
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													4,
													1
												],
												"alpha": 1,
												"MULTIPLY": false,
												"color": [
													0.996078431372549,
													0.5098039215686274,
													0.3529411764705882,
													1
												],
												"mask": "Fx/noise/causticTexture.png",
												"UVOffset": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 0.2554140368772189,
															"mode": 2
														},
														{
															"time": 0.8452667378408738,
															"value": 0.2617993877991494,
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
															"time": 0.003826530612244898,
															"value": 0.9879518072289157,
															"mode": 2
														},
														{
															"time": 0.8452667378408738,
															"value": 0.21052631578947367,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1254251700680272
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1254251700680272
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 0.6745098039215687,
															"mode": 2
														},
														{
															"time": 0.8452667378408738,
															"value": 0.07450980392156863,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1254251700680272
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1254251700680272
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.a",
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8452667378408738,
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
						},
						{
							"type": "emitter",
							"name": "ProjectionSmoke",
							"props": {
								"enableSort": false,
								"emitSurface": true,
								"frameCount": 4,
								"frameDivisionY": 2,
								"animationSpeed": 0,
								"instStretch": [
									1.5,
									1.5,
									1.25
								],
								"lifeTime": 5,
								"lifeTimeRand": 0.1,
								"emitType": "Burst",
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instScale": 8,
								"instScale_rand": 0.25,
								"seedGroup": 2,
								"useRandomColor": true,
								"randomColor1": [
									0.8235294117647058,
									0.7686274509803921,
									0.7176470588235294,
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
								],
								"frameDivisionX": 2
							},
							"scaleX": 0.1225,
							"scaleY": 0.1225,
							"scaleZ": 0.09799999999999999,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV.fbx",
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
													"emissive": 3
												}
											},
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SpikesExplo1.png",
												"onDecal": false
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
													0.24705882352941178,
													0.16470588235294117,
													0.12549019607843137
												]
											}
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
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.1
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.8,
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
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06760381862153372,
																"dt": -0.4976087178514101
															},
															"nextHandle": {
																"dv": -0.06760381862153372,
																"dt": 0.4976087178514101
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
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.8,
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
				},
				{
					"type": "object",
					"name": "Decal",
					"scaleX": 1.65,
					"scaleY": 1.65,
					"scaleZ": 2.28,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Lightorange",
							"x": -0.016530000000000003,
							"y": 0.42902000000000007,
							"z": 1.15864,
							"scaleX": 60,
							"scaleY": 60,
							"scaleZ": 30,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"renderMode": "BeforeTonemapping",
							"centered": false,
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8549019607843137,
											0.11372549019607843,
											0
										]
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
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle2.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2350464952793597,
														"dt": -0.5697909948203433
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 1.7360265640076256
													}
												},
												{
													"time": 2.107422958699724,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5362274899014466,
														"dt": -0.03051465728228661
													},
													"nextHandle": {
														"dv": -1.0833333333333335,
														"dt": 0.06763066874190042
													}
												},
												{
													"time": 2.348619992178345,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -1.5001100955933375
													},
													"nextHandle": {
														"dv": -2.645156755157441e-16,
														"dt": 1.3315641396163127
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
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": false,
								"wrap": true,
								"progress": 1,
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
								]
							},
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
												"dv": 0.004816259989233215,
												"dt": -0.5003174060411008
											},
											"nextHandle": {
												"dv": -0.008611111111111125,
												"dt": 1.760204081632653
											}
										},
										{
											"time": 4.995690917968751,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "SandDecal",
							"y": 0.47708799999999996,
							"z": -0.7724239999999991,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 20,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"fadePower": 2,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.7,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_04.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.008393107932128274,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.018393107932128283,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.995818939208986,
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
											0,
											0,
											0
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Meshes",
					"z": -2,
					"scaleX": 0.8,
					"scaleY": 0.8,
					"scaleZ": 0.8,
					"children": [
						{
							"type": "model",
							"name": "Nuke_Pied_Smoke",
							"source": "Fx/Meshes_Common/Nuke_4.fbx",
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 0.79,
							"rotationZ": 8.179999999999996,
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
											"parallax": 0,
											"textureWrap": true,
											"drawOrder": "100",
											"depthWrite": "On",
											"emissive": 3
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Alphas/T_Nuke.png"
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.7,
										"scaleY": 0.7,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0.1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScale": 1,
										"tex": "Fx/Alphas/T_NukeVertex.png",
										"intensity": 1,
										"scrollSpeed": [
											0,
											0.07
										],
										"smoothEdge": 0,
										"texScaleX": 0.7,
										"texScaleY": 0.7
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
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.7,
										"uvScaleY": 0.7,
										"texture": "Fx/Alphas/T_Nuke.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.07
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
											"keyMode": 1,
											"keys": [
												{
													"time": -0.0031329162557812915,
													"value": 0.0033203124999993117,
													"mode": 1
												},
												{
													"time": 0.303,
													"value": 0.4541992187499996,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.20309069622494771
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.48429319869026005
													}
												},
												{
													"time": 0.4533347589476051,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": -0.02314686414930589,
														"dt": 0.9120488511724405
													}
												},
												{
													"time": 2.2047738186282992,
													"value": 1.5,
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
										"range": 4,
										"power": 0.8
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"enabled": false,
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": true,
										"bias": 0.07,
										"scale": 0.71,
										"power": 0.11,
										"color": [
											1,
											0.3058823529411765,
											0.12549019607843137
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "color.h",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.21601384464145068,
													"mode": 0,
													"prevHandle": {
														"dv": 0.03501594661492524,
														"dt": -0.49374169417723895
													},
													"nextHandle": {
														"dv": -0.13056972732838057,
														"dt": 1.8486805403232578
													}
												},
												{
													"time": 2.107099609375001,
													"value": 0,
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
													"mode": 0,
													"prevHandle": {
														"dv": 0.12051743008833779,
														"dt": -0.49131901196433725
													},
													"nextHandle": {
														"dv": -0.44999999999999996,
														"dt": 1.835851617753506
													}
												},
												{
													"time": 2.107099609375001,
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
													"value": 0.5627450980392157,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06046165613133731,
														"dt": -0.49270957779350577
													},
													"nextHandle": {
														"dv": -0.21882352941176475,
														"dt": 1.784535927474499
													}
												},
												{
													"time": 2.107099609375001,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": true,
										"bias": 0.44,
										"scale": 0.6,
										"power": 0.64,
										"color": [
											1,
											0.4823529411764706,
											0.2
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "color.h",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.003593013644042971,
													"value": 0.21601384464145068,
													"mode": 0,
													"prevHandle": {
														"dv": 0.04365518972487589,
														"dt": -0.49323382197499155
													},
													"nextHandle": {
														"dv": -0.13233724755599205,
														"dt": 1.5126587441420907
													}
												},
												{
													"time": 1.5126587441420907,
													"value": 0,
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
													"time": 0.003593013644042971,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.16219200841750742,
														"dt": -0.49087499737344853
													},
													"nextHandle": {
														"dv": -0.47709186595877573,
														"dt": 1.469542580413575
													}
												},
												{
													"time": 1.5126587441420907,
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
													"time": 0.003593013644042971,
													"value": 0.5627450980392157,
													"mode": 0,
													"prevHandle": {
														"dv": 0.07888062231620774,
														"dt": -0.49239781770985935
													},
													"nextHandle": {
														"dv": -0.23036816248158742,
														"dt": 1.4264264166850593
													}
												},
												{
													"time": 1.5126587441420907,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "Level",
									"source": "shaders/Level.hx",
									"props": {
										"levelMin": 0.15,
										"levelMax": 0.95
									},
									"children": [
										{
											"type": "curve",
											"name": "levelMax",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.7,
													"mode": 0,
													"prevHandle": {
														"dv": -0.1296712496229607,
														"dt": -0.5965807302666721
													},
													"nextHandle": {
														"dv": 0.14500000000000002,
														"dt": 0.6684196639060975
													}
												},
												{
													"time": 2,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "levelMin",
											"keyMode": 0,
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
														"dt": 1
													}
												},
												{
													"time": 2.1,
													"value": 0.05,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorMap3",
									"source": "shaders/ColorMap3.hx",
									"props": {
										"colorA": [
											1,
											1,
											1
										],
										"pointA": 1,
										"colorB": [
											1,
											1,
											1
										],
										"pointB": 0.98,
										"colorC": [
											1,
											1,
											1
										],
										"pointC": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "colorB.h",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.816922696929689,
													"value": 0.3182659224224954,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "colorB.s",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.816922696929689,
													"value": 0.5257731958762886,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "colorB.l",
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.816922696929689,
													"value": 0.3803921568627451,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": true,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0.02,
										"texture": "Fx/Gradients/vGrad_inv.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.0054947819521765,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1.0666666666666667,
											"mode": 0,
											"prevHandle": {
												"dv": -0.11929873224650708,
												"dt": -0.0436918738574221
											},
											"nextHandle": {
												"dv": 0.22166666666666668,
												"dt": 0.07989284101873641
											}
										},
										{
											"time": 1.93086582553573,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0038888888888888307,
												"dt": -1.5100042768428106
											},
											"nextHandle": {
												"dv": 0.0016574983077184554,
												"dt": 0.6435847371894798
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "MaskColorAlpha",
									"source": "hrt.shader.MaskColorAlpha",
									"props": {
										"UVScale": [
											2,
											2
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.996078431372549,
											0.5098039215686274,
											0.3529411764705882,
											1
										],
										"mask": "Fx/noise/causticTexture_02.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.518525528664492,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5061751762214973
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.5061751762214973
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter-toptop",
							"props": {
								"emitType": "Burst",
								"instScale": 0.9,
								"lifeTime": 5,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"seedGroup": 2,
								"instWorldSpeed": [
									0,
									0,
									20
								],
								"burstDelay": 0.3,
								"instScale_rand": 0,
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									2
								]
							},
							"z": 10,
							"children": [
								{
									"type": "model",
									"name": "Nuke_Torus",
									"source": "Fx/Meshes_Common/Nuke_TorusDeformed02.fbx",
									"rotationX": 90,
									"rotationZ": 90,
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
													"emissive": 15,
													"drawOrder": "100"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/noise/causticTexture_02_invert.png"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 1,
												"texScaleY": 2,
												"tex": "Fx/noise/Smoke10.png",
												"intensity": 1,
												"scrollSpeed": [
													0,
													0.2
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "scrollSpeed.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.00025,
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
															"time": 1.9925246182753416,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33035714285714285
															}
														},
														{
															"time": 1.9874225774590153,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
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
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 4,
												"scaleY": 2,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0.02,
												"texture": "Fx/Gradients/Cyl05u_A.jpg"
											}
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
												"progress": 0.5,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/noise/causticTexture_02_invert.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.2
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.3538039918132002
															},
															"nextHandle": {
																"dv": -0.03187249784980483,
																"dt": 0.6704616542270841
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "Level",
											"source": "shaders/Level.hx",
											"props": {
												"levelMin": 0,
												"levelMax": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "levelMax",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0184948931121538,
															"value": 0.6,
															"mode": 0,
															"prevHandle": {
																"dv": -0.1750246624940928,
																"dt": -0.4737065891079545
															},
															"nextHandle": {
																"dv": 0.27333333333333343,
																"dt": 0.7329337880952452
															}
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
													"name": "levelMin",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0184948931121538,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0005197340357864772,
																"dt": -0.4998357154547406
															},
															"nextHandle": {
																"dv": -0.0008333333333333318,
																"dt": 0.7945821481881221
															}
														},
														{
															"time": 1,
															"value": 0.05,
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
											"props": {
												"scaleX": 2,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.2
											}
										},
										{
											"type": "shader",
											"name": "Level",
											"source": "shaders/Level.hx",
											"enabled": false,
											"props": {
												"levelMin": 0,
												"levelMax": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "levelMax",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0184948931121538,
															"value": 0.3448611738160249,
															"mode": 0,
															"prevHandle": {
																"dv": -0.3087201590413261,
																"dt": -0.581487618931844
															},
															"nextHandle": {
																"dv": 0.3275694130919876,
																"dt": 0.6134425222362123
															}
														},
														{
															"time": 1.3242991897789782,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6463439655443873
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.6463439655443873
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "levelMin",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0184948931121538,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01763504563932453,
																"dt": -0.36323420847735793
															},
															"nextHandle": {
																"dv": 0.029166666666666667,
																"dt": 0.5972059171088702
															}
														},
														{
															"time": 1.5142991897789781,
															"value": 0.05,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.7096772988777206
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.7096772988777206
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													1,
													1
												],
												"alpha": 1,
												"MULTIPLY": false,
												"color": [
													0.996078431372549,
													0.5098039215686274,
													0.3529411764705882,
													1
												],
												"mask": "Fx/noise/causticTexture_02.png",
												"UVOffset": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 0.2554140368772189,
															"mode": 2
														},
														{
															"time": 0.38010204081632654,
															"value": 0.2617993877991494,
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
															"time": 0.003826530612244898,
															"value": 0.9879518072289157,
															"mode": 2
														},
														{
															"time": 0.38010204081632654,
															"value": 0.21052631578947367,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1254251700680272
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1254251700680272
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 0.6745098039215687,
															"mode": 2
														},
														{
															"time": 0.38010204081632654,
															"value": 0.07450980392156863,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1254251700680272
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1254251700680272
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.a",
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.38010204081632654,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.25,
												"scale": 1,
												"power": 1,
												"color": [
													0,
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "FresnelColor",
											"source": "shaders/Fresnel.hx",
											"enabled": false,
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": true,
												"bias": 0.07,
												"scale": 0.11,
												"power": 0.3,
												"color": [
													1,
													0.3058823529411765,
													0.12549019607843137
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5172372406181971,
															"value": 0.21601384464145068,
															"mode": 0,
															"prevHandle": {
																"dv": 0.08505125494931129,
																"dt": -0.34870079179559027
															},
															"nextHandle": {
																"dv": -0.19801269092132978,
																"dt": 0.8128741952058776
															}
														},
														{
															"time": 1.9006445312500007,
															"value": 0,
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
															"time": 0.5172372406181971,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.10864762725075004,
																"dt": -0.49393921407406066
															},
															"nextHandle": {
																"dv": -0.30000000000000004,
																"dt": 1.3649187695355072
															}
														},
														{
															"time": 1.9006445312500007,
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
															"time": 0.5172372406181971,
															"value": 0.5627450980392157,
															"mode": 0,
															"prevHandle": {
																"dv": 0.21687591134750409,
																"dt": -0.3703017052412526
															},
															"nextHandle": {
																"dv": -0.6846732026143791,
																"dt": 1.1700795080074027
															}
														},
														{
															"time": 1.9006445312500007,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": true,
												"bias": 0.3,
												"scale": 0.78,
												"power": 1,
												"color": [
													0.9882352941176471,
													0.7254901960784313,
													0.580392156862745
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.003593013644042971,
															"value": 0.21601384464145068,
															"mode": 0,
															"prevHandle": {
																"dv": 0.15551015494058143,
																"dt": -0.47544850076084466
															},
															"nextHandle": {
																"dv": -0.09050714469772617,
																"dt": 0.2783576450373984
															}
														},
														{
															"time": 0.3330286765585141,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.003593013644042971,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0.5039720120783625,
																"dt": -0.4837435682158458
															},
															"nextHandle": {
																"dv": -0.36079439537037095,
																"dt": 0.29061636932789586
															}
														},
														{
															"time": 0.3330286765585141,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.003593013644042971,
															"value": 0.5627450980392157,
															"mode": 1,
															"prevHandle": {
																"dv": 0.0883880585405169,
																"dt": -0.48972819152246067
															},
															"nextHandle": {
																"dv": -0.13499461780226674,
																"dt": 0.31717693862397367
															}
														},
														{
															"time": 0.3330286765585141,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "power",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2799075379663585,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.03333333333333333,
																"dt": -0.16753589863679852
															},
															"nextHandle": {
																"dv": 0.0663158467282843,
																"dt": 0.3333085492644985
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
									"name": "instScale",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.8445366358792664,
												"dt": -0.08802119155819672
											},
											"nextHandle": {
												"dv": 1.0588330453284742,
												"dt": 0.11024234693877553
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.05457195674714499,
												"dt": -0.782079081632653
											},
											"nextHandle": {
												"dv": 0.05457195674714499,
												"dt": 0.782079081632653
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.7722039512190322,
												"dt": -0.11216676286677635
											},
											"nextHandle": {
												"dv": -0.8334170534580158,
												"dt": 0.1215337587862599
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01934824365424488,
												"dt": -0.7646899563925605
											},
											"nextHandle": {
												"dv": 0.01934824365424488,
												"dt": 0.7646899563925605
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.384371446633738,
												"dt": -0.07126904577782352
											},
											"nextHandle": {
												"dv": -1.2283626663894607,
												"dt": 0.0630246412997343
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.04920744690213297,
												"dt": -0.9009612779575604
											},
											"nextHandle": {
												"dv": 0.04920744690213297,
												"dt": 0.9009612779575604
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.x",
									"enabled": false,
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
							"type": "emitter",
							"name": "emitter-top",
							"props": {
								"emitType": "Burst",
								"instScale": 1.1,
								"lifeTime": 4.5,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"seedGroup": 3,
								"instWorldSpeed": [
									0,
									0,
									13
								],
								"burstDelay": 0.3,
								"instScale_rand": 0,
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									1
								]
							},
							"z": 10,
							"children": [
								{
									"type": "model",
									"name": "Nuke_Torus",
									"source": "Fx/Meshes_Common/Nuke_TorusDeformed02.fbx",
									"rotationX": 90,
									"rotationZ": 90,
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
													"emissive": 10,
													"drawOrder": "100"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/noise/causticTexture_02_invert.png"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 1,
												"texScaleY": 2,
												"tex": "Fx/noise/Smoke10.png",
												"intensity": 1,
												"scrollSpeed": [
													0,
													0.2
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "scrollSpeed.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.00025,
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
															"time": 1.9925246182753416,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33035714285714285
															}
														},
														{
															"time": 1.9874225774590153,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
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
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 4,
												"scaleY": 2,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0.02,
												"texture": "Fx/Gradients/Cyl05u_A.jpg"
											}
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
												"progress": 0.5,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/noise/causticTexture_02_invert.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.2
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.3538039918132002
															},
															"nextHandle": {
																"dv": -0.03187249784980483,
																"dt": 0.6704616542270841
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "Level",
											"source": "shaders/Level.hx",
											"props": {
												"levelMin": 0,
												"levelMax": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "levelMax",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0184948931121538,
															"value": 0.6,
															"mode": 0,
															"prevHandle": {
																"dv": -0.1750246624940928,
																"dt": -0.4737065891079545
															},
															"nextHandle": {
																"dv": 0.27333333333333343,
																"dt": 0.7329337880952452
															}
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
													"name": "levelMin",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0184948931121538,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0005197340357864772,
																"dt": -0.4998357154547406
															},
															"nextHandle": {
																"dv": -0.0008333333333333318,
																"dt": 0.7945821481881221
															}
														},
														{
															"time": 1,
															"value": 0.05,
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
											"props": {
												"scaleX": 2,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.25
											}
										},
										{
											"type": "shader",
											"name": "FresnelColor",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": true,
												"bias": 0.07,
												"scale": 0.11,
												"power": 0.3,
												"color": [
													1,
													0.3058823529411765,
													0.12549019607843137
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5172372406181971,
															"value": 0.21601384464145068,
															"mode": 0,
															"prevHandle": {
																"dv": 0.08505125494931129,
																"dt": -0.34870079179559027
															},
															"nextHandle": {
																"dv": -0.19801269092132978,
																"dt": 0.8128741952058776
															}
														},
														{
															"time": 1.9006445312500007,
															"value": 0,
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
															"time": 0.5172372406181971,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.10864762725075004,
																"dt": -0.49393921407406066
															},
															"nextHandle": {
																"dv": -0.30000000000000004,
																"dt": 1.3649187695355072
															}
														},
														{
															"time": 1.9006445312500007,
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
															"time": 0.5172372406181971,
															"value": 0.5627450980392157,
															"mode": 0,
															"prevHandle": {
																"dv": 0.21687591134750409,
																"dt": -0.3703017052412526
															},
															"nextHandle": {
																"dv": -0.6846732026143791,
																"dt": 1.1700795080074027
															}
														},
														{
															"time": 1.9006445312500007,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													1,
													1
												],
												"alpha": 1,
												"MULTIPLY": false,
												"color": [
													0.996078431372549,
													0.5098039215686274,
													0.3529411764705882,
													1
												],
												"mask": "Fx/noise/causticTexture_02.png",
												"UVOffset": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 0.2554140368772189,
															"mode": 2
														},
														{
															"time": 0.38010204081632654,
															"value": 0.2617993877991494,
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
															"time": 0.003826530612244898,
															"value": 0.9879518072289157,
															"mode": 2
														},
														{
															"time": 0.38010204081632654,
															"value": 0.21052631578947367,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1254251700680272
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1254251700680272
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 0.6745098039215687,
															"mode": 2
														},
														{
															"time": 0.38010204081632654,
															"value": 0.07450980392156863,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1254251700680272
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1254251700680272
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.a",
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.38010204081632654,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.25,
												"scale": 1,
												"power": 1,
												"color": [
													0,
													0,
													0
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.8445366358792664,
												"dt": -0.08802119155819672
											},
											"nextHandle": {
												"dv": 1.0588330453284742,
												"dt": 0.11024234693877553
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.05457195674714499,
												"dt": -0.782079081632653
											},
											"nextHandle": {
												"dv": 0.05457195674714499,
												"dt": 0.782079081632653
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.7722039512190322,
												"dt": -0.11216676286677635
											},
											"nextHandle": {
												"dv": -0.8334170534580158,
												"dt": 0.1215337587862599
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01934824365424488,
												"dt": -0.7646899563925605
											},
											"nextHandle": {
												"dv": 0.01934824365424488,
												"dt": 0.7646899563925605
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.384371446633738,
												"dt": -0.07126904577782352
											},
											"nextHandle": {
												"dv": -1.2283626663894607,
												"dt": 0.0630246412997343
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.04920744690213297,
												"dt": -0.9009612779575604
											},
											"nextHandle": {
												"dv": 0.04920744690213297,
												"dt": 0.9009612779575604
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.x",
									"enabled": false,
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
							"type": "emitter",
							"name": "emitter-Bottom",
							"props": {
								"emitType": "Burst",
								"instScale": 1.6,
								"lifeTime": 2.5,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"seedGroup": 1,
								"instWorldSpeed": [
									0,
									0,
									5
								],
								"burstDelay": 0.3,
								"instScale_rand": 0,
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									3
								],
								"instStretch": [
									1,
									1,
									0.8
								]
							},
							"children": [
								{
									"type": "model",
									"name": "Nuke_Torus",
									"source": "Fx/Meshes_Common/Nuke_TorusDeformed02.fbx",
									"rotationX": 90,
									"rotationZ": 90,
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
													"emissive": 10,
													"drawOrder": "100"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/noise/causticTexture_02_invert.png"
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 1,
												"texScaleY": 2,
												"tex": "Fx/noise/Smoke10.png",
												"intensity": 1,
												"scrollSpeed": [
													0,
													0.2
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "scrollSpeed.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.00025,
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
															"time": 1.9925246182753416,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33035714285714285
															}
														},
														{
															"time": 1.9874225774590153,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
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
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 4,
												"scaleY": 2,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0.02,
												"texture": "Fx/Gradients/Cyl05u_A.jpg"
											}
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
												"progress": 0.5,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/noise/causticTexture_02_invert.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.2
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.3538039918132002
															},
															"nextHandle": {
																"dv": -0.03187249784980483,
																"dt": 0.6704616542270841
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "Level",
											"source": "shaders/Level.hx",
											"props": {
												"levelMin": 0,
												"levelMax": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "levelMax",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0184948931121538,
															"value": 0.6,
															"mode": 0,
															"prevHandle": {
																"dv": -0.1750246624940928,
																"dt": -0.4737065891079545
															},
															"nextHandle": {
																"dv": 0.27333333333333343,
																"dt": 0.7329337880952452
															}
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
													"name": "levelMin",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0184948931121538,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0005197340357864772,
																"dt": -0.4998357154547406
															},
															"nextHandle": {
																"dv": -0.0008333333333333318,
																"dt": 0.7945821481881221
															}
														},
														{
															"time": 1,
															"value": 0.05,
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
											"props": {
												"scaleX": 2,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.25
											}
										},
										{
											"type": "shader",
											"name": "Level",
											"source": "shaders/Level.hx",
											"enabled": false,
											"props": {
												"levelMin": 0,
												"levelMax": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "levelMax",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0184948931121538,
															"value": 0.3448611738160249,
															"mode": 0,
															"prevHandle": {
																"dv": -0.3087201590413261,
																"dt": -0.581487618931844
															},
															"nextHandle": {
																"dv": 0.3275694130919876,
																"dt": 0.6134425222362123
															}
														},
														{
															"time": 1.3242991897789782,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6463439655443873
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.6463439655443873
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "levelMin",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0184948931121538,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01763504563932453,
																"dt": -0.36323420847735793
															},
															"nextHandle": {
																"dv": 0.029166666666666667,
																"dt": 0.5972059171088702
															}
														},
														{
															"time": 1.5142991897789781,
															"value": 0.05,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.7096772988777206
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.7096772988777206
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "FresnelColor",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": true,
												"bias": 0.07,
												"scale": 0.11,
												"power": 0.3,
												"color": [
													1,
													0.3058823529411765,
													0.12549019607843137
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5172372406181971,
															"value": 0.21601384464145068,
															"mode": 0,
															"prevHandle": {
																"dv": 0.08505125494931129,
																"dt": -0.34870079179559027
															},
															"nextHandle": {
																"dv": -0.19801269092132978,
																"dt": 0.8128741952058776
															}
														},
														{
															"time": 1.9006445312500007,
															"value": 0,
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
															"time": 0.5172372406181971,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.10864762725075004,
																"dt": -0.49393921407406066
															},
															"nextHandle": {
																"dv": -0.30000000000000004,
																"dt": 1.3649187695355072
															}
														},
														{
															"time": 1.9006445312500007,
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
															"time": 0.5172372406181971,
															"value": 0.5627450980392157,
															"mode": 0,
															"prevHandle": {
																"dv": 0.21687591134750409,
																"dt": -0.3703017052412526
															},
															"nextHandle": {
																"dv": -0.6846732026143791,
																"dt": 1.1700795080074027
															}
														},
														{
															"time": 1.9006445312500007,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													1,
													1
												],
												"alpha": 1,
												"MULTIPLY": false,
												"color": [
													0.996078431372549,
													0.5098039215686274,
													0.3529411764705882,
													1
												],
												"mask": "Fx/noise/causticTexture_02.png",
												"UVOffset": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 0.2554140368772189,
															"mode": 2
														},
														{
															"time": 0.38010204081632654,
															"value": 0.2617993877991494,
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
															"time": 0.003826530612244898,
															"value": 0.9879518072289157,
															"mode": 2
														},
														{
															"time": 0.38010204081632654,
															"value": 0.21052631578947367,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1254251700680272
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1254251700680272
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 0.6745098039215687,
															"mode": 2
														},
														{
															"time": 0.38010204081632654,
															"value": 0.07450980392156863,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1254251700680272
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1254251700680272
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "color.a",
													"keys": [
														{
															"time": 0.003826530612244898,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.38010204081632654,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.25,
												"scale": 1,
												"power": 1,
												"color": [
													0,
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
												"range": 0.8,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.8445366358792664,
												"dt": -0.08802119155819672
											},
											"nextHandle": {
												"dv": 1.0588330453284742,
												"dt": 0.11024234693877553
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.05457195674714499,
												"dt": -0.782079081632653
											},
											"nextHandle": {
												"dv": 0.05457195674714499,
												"dt": 0.782079081632653
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.7722039512190322,
												"dt": -0.11216676286677635
											},
											"nextHandle": {
												"dv": -0.8334170534580158,
												"dt": 0.1215337587862599
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01934824365424488,
												"dt": -0.7646899563925605
											},
											"nextHandle": {
												"dv": 0.01934824365424488,
												"dt": 0.7646899563925605
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.384371446633738,
												"dt": -0.07126904577782352
											},
											"nextHandle": {
												"dv": -1.2283626663894607,
												"dt": 0.0630246412997343
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.04920744690213297,
												"dt": -0.9009612779575604
											},
											"nextHandle": {
												"dv": 0.04920744690213297,
												"dt": 0.9009612779575604
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.x",
									"enabled": false,
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
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.45,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 1,
								"texture": "Fx/noise/T_Noise_Grunge_03.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									-0.2
								]
							}
						}
					]
				},
				{
					"type": "emitter",
					"name": "Debris",
					"props": {
						"lifeTimeRand": 0.25,
						"emitType": "Burst",
						"burstParticleCount": 10,
						"emitShape": "Cone",
						"emitAngle": 50,
						"emitSurface": true,
						"alignMode": "Screen",
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0,
						"instScale": 2.75,
						"instSpeed": [
							300,
							0,
							0
						],
						"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
						"instRotation_rand": [
							0,
							0,
							360
						],
						"instScale_rand": 0.9,
						"instSpeed_rand": [
							30,
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
						"simulationSpace": "World",
						"lifeTime": 1.5
					},
					"z": -2.6624499999999998,
					"scaleX": 7.999999999999999,
					"scaleY": 34.99999999999999,
					"scaleZ": 34.99999999999999,
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
											"textureWrap": true,
											"emissive": 10
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
									"name": "ParticleColorRandom",
									"source": "hrt.shader.ParticleColorRandom",
									"props": {
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -13750738
													},
													{
														"position": 1,
														"color": -8026747
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9882352941176471,
											0.6588235294117647,
											0.5450980392156862
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
														"dv": 2.482331685236416,
														"dt": -0.43376521434073423
													},
													"nextHandle": {
														"dv": -0.7299382716049383,
														"dt": 0.1275501709627762
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0015432098765432167,
														"dt": -0.688777582850826
													},
													"nextHandle": {
														"dv": -8.149085208076218e-16,
														"dt": 0.33332670854541535
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
				},
				{
					"type": "emitter",
					"name": "coolshockwave_a save",
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
							0.9098039215686274,
							0.615686274509804,
							1,
							0.8509803921568627
						],
						"emitRate": 10,
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							360
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
						"emitType": "Burst",
						"burstDelay": 0.3,
						"useRandomColor": true,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"warmUpTime": 1.1,
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instScale": 60,
						"lifeTime": 3,
						"speedFactor": 0.5
					},
					"z": 0.2,
					"scaleX": 0.01,
					"scaleY": 0.01,
					"scaleZ": 0.01,
					"children": [
						{
							"type": "model",
							"name": "disk",
							"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 0.01,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Distortion",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"culling": "None",
											"depthWrite": "On",
											"drawOrder": "100",
											"emissive": 2.2
										}
									},
									"diffuseMap": "Fx/noise/causticTexture_03-2.png"
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/perlin1_normal.png",
										"intensity": 0.06
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.8043636363636364,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5969588995728569,
														"dt": -0.2623791435549754
													},
													"nextHandle": {
														"dv": -0.5969588995728569,
														"dt": 0.2623791435549754
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.08425454545454536,
														"dt": -0.2350000000000001
													},
													"nextHandle": {
														"dv": -0.08425454545454536,
														"dt": 0.2350000000000001
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 0.1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.01
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
										"progress": 0.7,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.5
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
											"name": "width",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5350976805491343,
													"value": 0.9422222222222223,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.03695353771889259
													},
													"nextHandle": {
														"dv": -6.922428196740585e-16,
														"dt": 0.24478506621704163
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5,
														"dt": -0.18500000000000005
													},
													"nextHandle": {
														"dv": -0.8474237452673484,
														"dt": 0.3135467857489186
													}
												},
												{
													"time": 2.0100000000000002,
													"value": 0,
													"mode": 0
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
							"keyMode": 1,
							"keys": [
								{
									"time": 0.0049999999999999975,
									"value": 0,
									"mode": 1,
									"prevHandle": {
										"dv": -0.5609260576910832,
										"dt": -0.42893757473558736
									},
									"nextHandle": {
										"dv": 0.10885961743662093,
										"dt": 0.055
									}
								},
								{
									"time": 1,
									"value": 0.6,
									"mode": 0,
									"prevHandle": {
										"dv": -0.025293869065672436,
										"dt": -0.4
									},
									"nextHandle": {
										"dv": 0.025293869065672436,
										"dt": 0.4
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"onDecal": false,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 2,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/Cyl05u_A.jpg"
							}
						},
						{
							"type": "curve",
							"name": "instScale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.2,
									"mode": 0,
									"prevHandle": {
										"dv": -1.2849689113717753,
										"dt": -0.1579914406956294
									},
									"nextHandle": {
										"dv": 0.8168178569859157,
										"dt": 0.10234836610612127
									}
								},
								{
									"time": 1,
									"value": 1.5,
									"mode": 0,
									"prevHandle": {
										"dv": -0.22305240909264112,
										"dt": -0.7024756799240661
									},
									"nextHandle": {
										"dv": 0.22305240909264112,
										"dt": 0.7024756799240661
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "emitter",
					"props": {
						"lifeTime": 0.2,
						"lifeTimeRand": 0.01,
						"alignMode": "Screen",
						"alignLockAxis": "Z",
						"emitType": "Burst",
						"burstDelay": 0.05,
						"instScale": 15,
						"instStretch": [
							6,
							1,
							2
						],
						"instRotation_rand": [
							0,
							0,
							0
						],
						"instStretch_rand": [
							0,
							0,
							0
						],
						"instScale_rand": 3,
						"warmUpTime": 0.1,
						"useRandomColor": true,
						"randomColor1": [
							0.48627450980392156,
							0.48627450980392156,
							0.48627450980392156,
							1
						]
					},
					"z": 1,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
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
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 20
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
										"alpha": 0.4,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare06_512.png"
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
											0.4588235294117647,
											0.12156862745098039
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instStretch.x",
							"keyMode": 0,
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
					"type": "curve",
					"name": "shake",
					"keys": [
						{
							"time": 0,
							"value": 0,
							"mode": 2
						},
						{
							"time": 0.012258724290497451,
							"value": 0.1,
							"mode": 2
						},
						{
							"time": 0.45535714285714285,
							"value": 0,
							"mode": 2
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
					}
				}
			]
		}
	]
}