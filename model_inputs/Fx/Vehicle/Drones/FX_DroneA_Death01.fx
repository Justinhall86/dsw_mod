{
	"type": "fx",
	"duration": 15,
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
					"name": "DroneA",
					"source": "Vehicle/Atreide/DroneA/DroneA.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/DroneA/Anim_DroneA_Death01.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "1-Directional Explosion_low",
					"x": 0.18,
					"y": 0.76,
					"z": 1.32,
					"scaleY": 0.9999999999999999,
					"rotationX": 64.4,
					"rotationY": -140.5,
					"rotationZ": -61.2,
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
									0
								],
								"frameCount": 32,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"instScale": 3,
								"emitType": "Burst",
								"burstDelay": 0.15,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"burstParticleCount": 4,
								"emitShape": "Cone",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.2,
								"alignMode": "Screen",
								"emitAngle": 38.18,
								"instSpeed": [
									5,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instSpeed_rand": [
									2,
									0,
									0
								],
								"instAcceleration": [
									-5,
									0,
									0
								],
								"instAcceleration_rand": [
									1,
									0,
									0
								],
								"warmUpTime": -0.4,
								"lifeTime": 0.8
							},
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3.0000000000000004,
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
																"dv": 0.002592191728735997,
																"dt": -0.03499458833793611
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.8999999999999999
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
													0.5098039215686274,
													0.36470588235294116
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
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
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
											"time": 0.09499999999999999,
											"value": 0.3300049349567332,
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
									0
								],
								"frameCount": 32,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"instScale": 5,
								"emitType": "Burst",
								"burstDelay": 0.05,
								"instStretch_rand": [
									0,
									0.2,
									0
								],
								"emitShape": "Cone",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.2,
								"alignMode": "Screen",
								"emitAngle": 38.18,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -0.45,
								"instSpeed": [
									6,
									0,
									0
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"instAcceleration": [
									-6,
									0,
									0
								],
								"lifeTime": 1.35
							},
							"x": -8.881784197001252e-16,
							"z": 4.440892098500626e-16,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3.0000000000000004,
							"rotationY": -2.1203697876423446e-15,
							"rotationZ": 4.240739575284689e-15,
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
												"alpha": 0.7
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
													0.2392156862745098,
													0.2392156862745098,
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
													0.05,
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
															"value": 0.3,
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10219946215442799,
												"dt": -0.79
											},
											"nextHandle": {
												"dv": 0.0338972586912773,
												"dt": 0.267255905650836
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Flare",
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
									180
								],
								"lifeTime": 0.04,
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
								"warmUpTime": -0.4
							},
							"scaleX": 0.9999999999999996,
							"scaleY": 0.9999999999999996,
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
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												0.5176470588235293,
												0.396078431372549,
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07.png",
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
													0.47058823529411764,
													0.2901960784313725,
													0.18823529411764706
												]
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
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Smoke",
					"props": {
						"instScale_rand": 1,
						"maxCount": 65,
						"simulationSpace": "World",
						"animationSpeed": 0.3,
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
						"emitRate": 8,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
						"instScale": 8.5,
						"burstDelay": 0.05,
						"instStretch_rand": [
							0,
							0,
							0
						],
						"emitShape": "Cone",
						"emitRad1": 0.83,
						"emitSurface": true,
						"lifeTimeRand": 0.5,
						"alignMode": "Screen",
						"emitAngle": 38.18,
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instWorldAcceleration_rand": [
							0,
							0.1,
							0
						],
						"lifeTime": 3,
						"warmUpTime": -0.1,
						"instSpeed": [
							5,
							0,
							0
						],
						"instSpeed_rand": [
							2,
							0,
							0
						],
						"instAcceleration_rand": [
							0,
							0,
							0
						],
						"speedFactor": 0.5,
						"instWorldAcceleration": [
							0,
							0.5,
							0
						],
						"enableSort": false,
						"instAcceleration": [
							1,
							5,
							0
						]
					},
					"x": 0.18,
					"y": 0.76,
					"z": 1.32,
					"scaleX": 2.9999999999999996,
					"scaleY": 3,
					"scaleZ": 2.9999999999999996,
					"rotationX": 44,
					"rotationY": -131.2,
					"rotationZ": -52,
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
										"alpha": 0.7
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
														"dv": 0.03847676217770362,
														"dt": -0.03334652722067646
													},
													"nextHandle": {
														"dv": -0.5333333333333333,
														"dt": 0.4617283950617284
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01666666666666672,
														"dt": -0.41135802469135807
													},
													"nextHandle": {
														"dv": 0.012980169199833783,
														"dt": 0.3199852081262777
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
											0.13725490196078433,
											0.13725490196078433,
											0.13725490196078433
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
										"range": 0.5,
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
										"progress": 0.58,
										"saturation": 0,
										"width": 0.73,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.02,
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
													"mode": 0,
													"prevHandle": {
														"dv": 0.4440584429210647,
														"dt": -0.6148501517368579
													},
													"nextHandle": {
														"dv": -0.21666666666666667,
														"dt": 0.3
													}
												},
												{
													"time": 1,
													"value": 0.1,
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
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.75,
									"topSpan": 0.8,
									"dirBrighten": true,
									"dirIntensity": 0.8,
									"dirSpan": 0.9,
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
									"value": 0.5,
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
									"value": 0.9,
									"mode": 0,
									"prevHandle": {
										"dv": -0.10219946215442799,
										"dt": -0.79
									},
									"nextHandle": {
										"dv": 0.0338972586912773,
										"dt": 0.267255905650836
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"keys": [
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.027196267749859084,
										"dt": -0.49997172247141153
									},
									"nextHandle": {
										"dv": -0.055425485691523946,
										"dt": 1.0069135802469136
									}
								},
								{
									"time": 2.1,
									"value": -1,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"keys": [
								{
									"time": 2.3,
									"value": 0,
									"mode": 2
								},
								{
									"time": 3,
									"value": -1.4404946617182222,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "emitRate",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.5792247227260048,
									"mode": 2
								},
								{
									"time": 0.8744381426587517,
									"value": 3.2,
									"mode": 2
								},
								{
									"time": 1.0590555953979497,
									"value": 3.2,
									"mode": 2
								},
								{
									"time": 1.6882653031525792,
									"value": 0.85,
									"mode": 0,
									"prevHandle": {
										"dv": 0.012377711704799288,
										"dt": -0.23999999999999977
									},
									"nextHandle": {
										"dv": -0.012377711704799288,
										"dt": 0.23999999999999977
									}
								},
								{
									"time": 7.75,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.9788900864496244,
										"dt": -2.3078014180910316
									},
									"nextHandle": {
										"dv": -0.7915036272791919,
										"dt": 1.8750514373525036
									}
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
										"dv": 1.9871071861164984e-16,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.8809876543209877
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.01282051282051282,
										"dt": -0.21777777777777785
									},
									"nextHandle": {
										"dv": 0.019664722888838422,
										"dt": 0.3332806368123195
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instAcceleration.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -2.9644666370982153,
										"dt": -0.3062152491313287
									},
									"nextHandle": {
										"dv": 0.7744791666666667,
										"dt": 0.07888888888888891
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.025520833333333326,
										"dt": -0.9566666666666667
									},
									"nextHandle": {
										"dv": 0.00890255983233487,
										"dt": 0.3333312198447246
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "2-Directional Explosion_Medium",
					"x": 0.92,
					"y": -1,
					"z": 1.36,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.5,
					"rotationX": 116.6,
					"rotationY": 41.9,
					"rotationZ": -85,
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
									0
								],
								"frameCount": 32,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"instScale": 11,
								"emitType": "Burst",
								"burstDelay": 0.05,
								"instStretch_rand": [
									0,
									0.2,
									0
								],
								"emitShape": "Cone",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.2,
								"alignMode": "Screen",
								"emitAngle": 38.18,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -1,
								"instSpeed": [
									7,
									0,
									0
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"instAcceleration": [
									-6,
									0,
									0
								],
								"lifeTime": 1.2
							},
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3.0000000000000004,
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
													0.2392156862745098,
													0.2392156862745098,
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
													0.05,
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10219946215442799,
												"dt": -0.79
											},
											"nextHandle": {
												"dv": 0.0338972586912773,
												"dt": 0.267255905650836
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
									0
								],
								"frameCount": 32,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"instScale": 5,
								"emitType": "Burst",
								"burstDelay": 0.15,
								"instStretch_rand": [
									0,
									0.2,
									0
								],
								"burstParticleCount": 4,
								"emitShape": "Cone",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.3,
								"alignMode": "Screen",
								"emitAngle": 38.18,
								"instSpeed": [
									7,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"instAcceleration": [
									-6,
									0,
									0
								],
								"instAcceleration_rand": [
									1,
									0,
									0
								],
								"warmUpTime": -0.85
							},
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3.0000000000000004,
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
													"emissive": 18
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
															"value": 0.85,
															"mode": 0,
															"prevHandle": {
																"dv": 0.002592191728735997,
																"dt": -0.03499458833793611
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.8999999999999999
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
													0.5098039215686274,
													0.36470588235294116
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
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
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
											"time": 0.09499999999999999,
											"value": 0.3300049349567332,
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
							"name": "Flare",
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
									180
								],
								"lifeTime": 0.04,
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
								"warmUpTime": -0.95
							},
							"scaleX": 0.9999999999999996,
							"scaleY": 0.9999999999999996,
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
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												0.5176470588235293,
												0.396078431372549,
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07.png",
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
													0.47058823529411764,
													0.2901960784313725,
													0.18823529411764706
												]
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
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "3-Explosion_medium",
					"x": 2.18,
					"y": -0.81,
					"scaleX": 0.75,
					"scaleY": 0.75,
					"scaleZ": 0.75,
					"children": [
						{
							"type": "object",
							"name": "------------------------Anticipation",
							"x": -4.440892098500626e-16,
							"z": 6.044999999999999,
							"children": [
								{
									"type": "emitter",
									"name": "Flare",
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
											180
										],
										"lifeTime": 0.04,
										"instScale": 15,
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
										"warmUpTime": -2.28
									},
									"z": -5,
									"scaleX": 0.9999999999999996,
									"scaleY": 0.9999999999999996,
									"rotationZ": 82,
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
													"diffuseMap": "Fx/Structure/Smoke/white.png",
													"color": [
														1,
														0.5176470588235293,
														0.396078431372549,
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare07.png",
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
															0.47058823529411764,
															0.2901960784313725,
															0.18823529411764706
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
								}
							]
						},
						{
							"type": "object",
							"name": "-----------------------------Fireball",
							"z": 2.04,
							"children": [
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
										"lifeTimeRand": 0.2,
										"lifeTime": 0.8,
										"warmUpTime": -2.3
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
															"blend": "Add",
															"shadows": false,
															"culling": "Back",
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": true,
															"parallax": 0,
															"textureWrap": true,
															"emissive": 18
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
																	"value": 0.9,
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
															0.5098039215686274,
															0.36470588235294116
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
														"amount": 0.65,
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
										"lifeTime": 1.2,
										"warmUpTime": -2.2,
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
									"name": "Smoke",
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
										"instScale": 18,
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
										"lifeTime": 1.2,
										"warmUpTime": -2.25
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
										"lifeTime": 0.8,
										"warmUpTime": -2.3
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
															0.5098039215686274,
															0.36470588235294116
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "-----------------------------Distort",
							"z": 1,
							"children": [
								{
									"type": "emitter",
									"name": "Distort",
									"props": {
										"instScale_rand": 0,
										"maxCount": 50,
										"simulationSpace": "World",
										"animationSpeed": 0.2,
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
										"lifeTime": 0.9,
										"emitType": "Burst",
										"burstDelay": 0.1,
										"instScale": 70,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"warmUpTime": -2.4
									},
									"z": 0.06000000000000005,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Ring",
											"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "Distortion",
															"blend": "Alpha",
															"shadows": false,
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"culling": "None"
														}
													},
													"diffuseMap": "Fx/noise/causticTexture_03-2.png"
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/perlin2Normal.jpg",
														"intensity": 0.03
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
																		"dv": 1.1438836500205134,
																		"dt": -0.4763721338556696
																	},
																	"nextHandle": {
																		"dv": -0.2551111111111112,
																		"dt": 0.10551280456700678
																	}
																},
																{
																	"time": 1,
																	"value": 0.004242424242424214,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03333333333333333,
																		"dt": -0.51
																	},
																	"nextHandle": {
																		"dv": -0.02178544542538359,
																		"dt": 0.33331731500836026
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
														"scaleX": 0.5,
														"scaleY": 0.5,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0,
														"shiftSpeedY": -0.01
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
													"time": 0.009999999999999995,
													"value": -0.02419093677588713,
													"mode": 0,
													"prevHandle": {
														"dv": -0.6101554739171128,
														"dt": -0.33018814592265844
													},
													"nextHandle": {
														"dv": 0.9136438538946278,
														"dt": 0.49018439845683004
													}
												},
												{
													"time": 1,
													"value": 1.29108698853561,
													"mode": 0,
													"prevHandle": {
														"dv": -0.11323294039229448,
														"dt": -0.39715416696622907
													},
													"nextHandle": {
														"dv": 0.09487993739524597,
														"dt": 0.33286343471616847
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Distort_Chockwave",
									"props": {
										"instScale_rand": 0,
										"maxCount": 50,
										"simulationSpace": "World",
										"animationSpeed": 0.2,
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
										"lifeTime": 1.2,
										"emitType": "Burst",
										"burstDelay": 0.3,
										"useRandomColor": true,
										"emitShape": "Box",
										"emitSurface": true,
										"warmUpTime": -2.45,
										"instWorldAcceleration_rand": [
											0,
											0,
											0
										],
										"instScale": 80
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Ring",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "Distortion",
															"blend": "Alpha",
															"shadows": false,
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"culling": "None"
														}
													},
													"diffuseMap": "Fx/noise/causticTexture_03-2.png"
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/psfixnormal.jpg",
														"intensity": 0.005
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
																		"dv": 0.43153708306162436,
																		"dt": -0.6202405810554702
																	},
																	"nextHandle": {
																		"dv": -0.2400363636363636,
																		"dt": 0.34500000000000003
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
														"scaleX": 0.5,
														"scaleY": 0.5,
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
														"progress": 0.5,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/bluenoise_raw.png",
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
													"time": 0.0049999999999999975,
													"value": 0.0402048299726524,
													"mode": 0,
													"prevHandle": {
														"dv": -0.9239350146379692,
														"dt": -0.3456633226416698
													},
													"nextHandle": {
														"dv": 0.12028199966650588,
														"dt": 0.045000000000000005
													}
												},
												{
													"time": 1,
													"value": 1.0158254939343108,
													"mode": 0,
													"prevHandle": {
														"dv": -0.026729333259223442,
														"dt": -0.865
													},
													"nextHandle": {
														"dv": 0.0103433736750329,
														"dt": 0.33472657705803693
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
						"lifeTime": 2.1,
						"emitType": "Burst",
						"burstParticleCount": 8,
						"emitOrientation": "Normal",
						"emitShape": "Cylinder",
						"emitRad1": 0.73,
						"emitRad2": 0.73,
						"emitSurface": true,
						"instScale": 15,
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
							1,
							0,
							0
						],
						"instAcceleration": [
							5,
							0,
							0
						],
						"warmUpTime": -2.3
					},
					"z": 0.66,
					"scaleX": 15,
					"scaleY": 15,
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
										"scale": 0.1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 2
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
													"time": 0.08,
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
											0.807843137254902,
											0.7843137254901961,
											0.7725490196078432
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
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": true,
										"envBlend": 0.4,
										"envColorSet": true
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
									"time": 0.009999999999999995,
									"value": 1.0899757186013024,
									"mode": 0,
									"prevHandle": {
										"dv": -0.10685270825476992,
										"dt": -0.08805109354652937
									},
									"nextHandle": {
										"dv": 0.38204884426652885,
										"dt": 0.31357142857142856
									}
								},
								{
									"time": 1,
									"value": 1.3869709475957928,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "SandJet",
					"props": {
						"instScale_rand": 0.9,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9803921568627451,
							0.9254901960784314,
							0.8980392156862745,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							30
						],
						"lifeTimeRand": 0.9,
						"useRandomColor": true,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 5,
						"emitAngle": 90,
						"alignMode": "Screen",
						"lifeTime": 4.5,
						"emitRad1": 0.64,
						"emitRad2": 0.89,
						"randomColor2": [
							0.7490196078431373,
							0.6705882352941176,
							0.6313725490196078,
							1
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"instAcceleration_rand": [
							0,
							0,
							0
						],
						"emitRate": 1,
						"speedFactor": 2.5,
						"maxCount": 5,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
						"warmUpTime": -5.4,
						"emitType": "Burst",
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instSpeed": [
							20,
							0,
							0
						],
						"burstParticleCount": 2
					},
					"x": 0.5,
					"z": 0.66,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 2.25,
							"scaleY": 2.25,
							"scaleZ": 2.25,
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
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.6472728746925278,
														"dt": -0.012445056058803479
													},
													"nextHandle": {
														"dv": 0.9454545454545454,
														"dt": 0.007142857142857143
													}
												},
												{
													"time": 0.45,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 8.922912650454184e-17,
														"dt": -0.21499999999999997
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.36
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01694444444444443,
														"dt": -0.27
													},
													"nextHandle": {
														"dv": 0.013434004892663146,
														"dt": 0.21406315992899264
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
											0.8745098039215686,
											0.8745098039215686,
											0.8745098039215686
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
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.07,
											-0.05
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
													"value": 0.85,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1116321015082125,
														"dt": -0.3076091494743911
													},
													"nextHandle": {
														"dv": -1,
														"dt": 0.2774350174349862
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
										"range": 1.7,
										"power": 1
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.57,
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
									"value": 0.6,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0967980860793232,
										"dt": -0.009802037467223067
									},
									"nextHandle": {
										"dv": 0.5569361461292616,
										"dt": 0.0049999999999999975
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": 0.010970089074337164,
										"dt": -0.575
									},
									"nextHandle": {
										"dv": -0.006359231507065358,
										"dt": 0.3333207316535249
									}
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
					"type": "object",
					"name": "LensFlare",
					"x": 1.71,
					"y": -0.67,
					"z": 2.17,
					"scaleX": 1.4,
					"scaleY": 1.4,
					"scaleZ": 1.4,
					"children": [
						{
							"type": "object",
							"name": "LensFlare",
							"children": [
								{
									"type": "object",
									"name": "LensFlare_Colored",
									"y": 0.14500000000000002,
									"z": -0.030000000000000027,
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
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
												"warmUpTime": -2.43,
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
												"warmUpTime": -2.43,
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
												"warmUpTime": -2.28,
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
												"warmUpTime": -2.28,
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
										"warmUpTime": -2.28,
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
						},
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
										"instScale": 12,
										"emitType": "Burst",
										"burstDelay": 0.12,
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"warmUpTime": -2.28,
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
															"emissive": 12
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
								},
								{
									"type": "emitter",
									"name": "LensFlare_blue",
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
										"warmUpTime": -2.28,
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
															0.34901960784313724,
															0.18823529411764706,
															0.47058823529411764
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
							"type": "emitter",
							"name": "Bokeh",
							"enabled": false,
							"editorOnly": true,
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
									-5
								],
								"emitType": "Burst",
								"burstDelay": 0.12,
								"warmUpTime": -2.275,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTime": 1.5,
								"instScale": 2.25,
								"instStretch": [
									1.6,
									1,
									1
								],
								"instRotation": [
									0,
									0,
									-45
								],
								"frameCount": 2,
								"frameDivisionY": 2,
								"spriteSheet": "Fx/Alphas/T_Boquet_straight_circle_2x1.png",
								"instStretch_rand": [
									0.2,
									0,
									0
								]
							},
							"y": -0.57,
							"z": 0.35,
							"scaleX": 0.01,
							"scaleY": 0.01,
							"scaleZ": 0.01,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
									"rotationY": 90,
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
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"color": [
												0.7058823529411764,
												0.9254901960784314,
												0.9411764705882353,
												1
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.09
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
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
								},
								{
									"type": "curve",
									"name": "instStretch.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.85,
											"mode": 0,
											"prevHandle": {
												"dv": -0.19044784291591613,
												"dt": -0.5609157100618063
											},
											"nextHandle": {
												"dv": 0.14507904052734366,
												"dt": 0.43
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.00564231872558596,
												"dt": -0.45000000000000007
											},
											"nextHandle": {
												"dv": 0.00433869348958209,
												"dt": 0.33432171256113974
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
					"name": "Electricity",
					"x": 0.165,
					"y": 1.555,
					"z": 1.56,
					"children": [
						{
							"type": "object",
							"name": "Elec01",
							"x": 0.05499999999999999,
							"y": -0.09499999999999997,
							"z": 0.10999999999999988,
							"rotationX": -80,
							"rotationY": -3.180554681463517e-15,
							"rotationZ": -116.1,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
										"instScale_rand": 0,
										"warmUpTime": -1,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.6,
											1.2,
											1
										],
										"lifeTime": 0.15,
										"instScale": 1.2
									},
									"x": 0.12,
									"y": -0.14,
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
															"blend": "Alpha",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "Less",
															"emissive": 10
														}
													},
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
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
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
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Elec02",
							"x": -0.05500000000000001,
							"y": 0.09499999999999997,
							"z": -0.1100000000000001,
							"rotationX": -66.39999999999999,
							"rotationY": -34.599999999999994,
							"rotationZ": -59.19999999999998,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_01.png",
										"instScale_rand": 0,
										"warmUpTime": -1.5,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.5,
											0.95,
											1
										],
										"lifeTime": 0.1,
										"instScale": 1.2
									},
									"x": -0.02,
									"y": 0.07,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": -5.7,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
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
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
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
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Elec03",
							"x": 0.68,
							"y": -0.2,
							"z": -1.02,
							"rotationX": -66.4,
							"rotationY": -34.6,
							"rotationZ": -59.2,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_02.png",
										"instScale_rand": 0,
										"warmUpTime": -3.5,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.45,
											0.95,
											1
										],
										"lifeTime": 0.1,
										"instScale": 1.3
									},
									"x": -0.02,
									"y": -0.75,
									"z": 0.04,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationY": 64.3,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
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
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
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
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Elec04",
							"x": 0.28,
							"y": -4.25,
							"z": -0.5,
							"rotationX": -67,
							"rotationY": 4,
							"rotationZ": -33.5,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_02.png",
										"instScale_rand": 0,
										"warmUpTime": -3.6,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.5,
											0.8,
											1
										],
										"lifeTime": 0.1,
										"instScale": 1.8
									},
									"y": -0.71,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationY": 69.7,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
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
							"name": "Elec05",
							"x": 1.12,
							"y": 0.3,
							"z": -0.92,
							"rotationX": -30,
							"rotationY": -14.6,
							"rotationZ": -73.3,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
										"instScale_rand": 0,
										"warmUpTime": -3.7,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.5,
											0.85,
											1
										],
										"lifeTime": 0.1,
										"instScale": 1.3
									},
									"x": -0.07,
									"y": -0.68,
									"z": 0.12,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": -61.2,
									"rotationY": 25.9,
									"rotationZ": -76.5,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
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
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
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
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Elec06",
							"x": 0.62,
							"y": -1.41,
							"z": -1.25,
							"rotationX": -4.9,
							"rotationY": -167.5,
							"rotationZ": -4,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_02.png",
										"instScale_rand": 0,
										"warmUpTime": -3.8,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.6,
											0.95,
											1
										],
										"lifeTime": 0.1,
										"instScale": 1.2
									},
									"x": -0.09,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationY": 1.8,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
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
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
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
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Elec07",
							"x": 1.24,
							"y": -3.1,
							"z": 0.07,
							"rotationX": -62.6,
							"rotationY": 3.5,
							"rotationZ": -80.1,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
										"instScale_rand": 0.3,
										"warmUpTime": -4.75,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.1,
											0.8,
											1
										],
										"lifeTime": 0.1,
										"burstCount": 2,
										"instScale": 2.1,
										"instStretch_rand": [
											0,
											0,
											0
										]
									},
									"x": 0.1,
									"y": -0.24,
									"z": -0.21,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": -7.3,
									"rotationY": 12.3,
									"rotationZ": 4.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
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
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
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
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Elec08",
							"x": -1.24,
							"y": -3.27,
							"z": 0.42,
							"rotationX": -56.3,
							"rotationY": -18.8,
							"rotationZ": -92.2,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
										"instScale_rand": 0,
										"warmUpTime": -5.25,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1,
											1.2,
											1
										],
										"lifeTime": 0.1,
										"instScale": 2
									},
									"x": -0.54,
									"y": -0.75,
									"z": 0.32,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": -23,
									"rotationY": 8.6,
									"rotationZ": -15.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
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
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
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
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Elec09",
							"x": -0.12,
							"y": -4.24,
							"z": 0.18,
							"rotationX": -45,
							"rotationY": 67.4,
							"rotationZ": -44,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_02.png",
										"instScale_rand": 0,
										"warmUpTime": -5.4,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.1,
											0.9,
											1
										],
										"lifeTime": 0.1,
										"instScale": 1.7
									},
									"x": -0.06,
									"y": -0.28,
									"z": 0.03,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": -11.9,
									"rotationY": -25.2,
									"rotationZ": -9.2,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
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
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
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
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sparkles01",
							"props": {
								"emitType": "Burst",
								"burstParticleCount": 15,
								"emitOrientation": "Speed",
								"emitShape": "Cone",
								"emitAngle": 57.27,
								"instSpeed": [
									7,
									0,
									0
								],
								"lifeTime": 0.45,
								"warmUpTime": -11,
								"emitSurface": true,
								"instStretch": [
									2.2,
									1,
									1
								],
								"instScale": 0.55,
								"instScale_rand": 0.3,
								"instSpeed_rand": [
									4,
									0,
									0
								],
								"speedFactor": 2,
								"instStretch_rand": [
									0.25,
									0,
									0
								],
								"useRandomColor": true,
								"randomColor1": [
									0.10196078431372549,
									0.3411764705882353,
									1,
									1
								],
								"randomColor2": [
									0.7137254901960784,
									0.17254901960784313,
									0.17254901960784313,
									1
								],
								"lifeTimeRand": 0.2,
								"burstDelay": 1.5
							},
							"x": 0.39,
							"y": -2.6,
							"z": -0.47,
							"scaleY": 1.0000000000000002,
							"rotationX": 101.6,
							"rotationY": -45.2,
							"rotationZ": 57.8,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true,
													"emissive": 50
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/Spark.png",
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
															"time": 0,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": 1.3450505427640504,
																"dt": -0.2952549971921085
															},
															"nextHandle": {
																"dv": -0.6833333333333333,
																"dt": 0.15000000000000002
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.26
															},
															"nextHandle": {
																"dv": -2.7214566023630135e-16,
																"dt": 0.33333569371893157
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02352170282676526,
																"dt": -0.6051452312104698
															},
															"nextHandle": {
																"dv": 0.03222222222222226,
																"dt": 0.8296093750000002
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.26
															},
															"nextHandle": {
																"dv": -2.7214566023630135e-16,
																"dt": 0.33333569371893157
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
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.x",
									"keys": [
										{
											"time": 0.06,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.325,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0214444444444446,
												"dt": -0.44000000000000006
											},
											"nextHandle": {
												"dv": 0.0214444444444446,
												"dt": 0.44000000000000006
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
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.52
											},
											"nextHandle": {
												"dv": -5.442874662877125e-16,
												"dt": 0.33333333333333326
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.524747126051018,
												"dt": -0.08435811334917986
											},
											"nextHandle": {
												"dv": 1.1363636363636365,
												"dt": 0.038593750000000024
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.015151515151515138,
												"dt": -0.6513281249999998
											},
											"nextHandle": {
												"dv": -0.007748222232672166,
												"dt": 0.333317624512036
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sparkles02",
							"props": {
								"emitType": "Burst",
								"burstParticleCount": 15,
								"emitOrientation": "Speed",
								"emitShape": "Cone",
								"emitAngle": 57.27,
								"instSpeed": [
									7,
									0,
									0
								],
								"lifeTime": 0.6,
								"warmUpTime": -6.5,
								"emitSurface": true,
								"instStretch": [
									2.2,
									1,
									1
								],
								"instScale": 0.5,
								"instScale_rand": 0.3,
								"instSpeed_rand": [
									4,
									0,
									0
								],
								"speedFactor": 2,
								"instStretch_rand": [
									0.25,
									0,
									0
								],
								"useRandomColor": true,
								"randomColor1": [
									0.10196078431372549,
									0.3411764705882353,
									1,
									1
								],
								"randomColor2": [
									0.7137254901960784,
									0.17254901960784313,
									0.17254901960784313,
									1
								],
								"lifeTimeRand": 0.2,
								"burstCount": 2,
								"burstDelay": 0.75
							},
							"x": 0.57,
							"y": -3.64,
							"z": -0.83,
							"rotationX": 49.2,
							"rotationY": -41,
							"rotationZ": -34.2,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true,
													"emissive": 50
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/Spark.png",
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
															"time": 0,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02352170282676526,
																"dt": -0.6051452312104698
															},
															"nextHandle": {
																"dv": 0.03222222222222226,
																"dt": 0.8296093750000002
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.26
															},
															"nextHandle": {
																"dv": -2.7214566023630135e-16,
																"dt": 0.33333569371893157
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
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.524747126051018,
														"dt": -0.08435811334917986
													},
													"nextHandle": {
														"dv": 1.1363636363636365,
														"dt": 0.038593750000000024
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015151515151515138,
														"dt": -0.6513281249999998
													},
													"nextHandle": {
														"dv": -0.007748222232672166,
														"dt": 0.333317624512036
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.x",
									"keys": [
										{
											"time": 0.06,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.325,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0214444444444446,
												"dt": -0.44000000000000006
											},
											"nextHandle": {
												"dv": 0.0214444444444446,
												"dt": 0.44000000000000006
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
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.52
											},
											"nextHandle": {
												"dv": -5.442874662877125e-16,
												"dt": 0.33333333333333326
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sparkles03",
							"props": {
								"emitType": "Burst",
								"burstParticleCount": 15,
								"emitOrientation": "Speed",
								"emitShape": "Cone",
								"emitAngle": 57.27,
								"instSpeed": [
									7,
									0,
									0
								],
								"lifeTime": 0.6,
								"warmUpTime": -7,
								"emitSurface": true,
								"instStretch": [
									2.2,
									1,
									1
								],
								"instScale": 0.5,
								"instScale_rand": 0.3,
								"instSpeed_rand": [
									4,
									0,
									0
								],
								"speedFactor": 2,
								"instStretch_rand": [
									0.25,
									0,
									0
								],
								"useRandomColor": true,
								"randomColor1": [
									0.10196078431372549,
									0.3411764705882353,
									1,
									1
								],
								"randomColor2": [
									0.7137254901960784,
									0.17254901960784313,
									0.17254901960784313,
									1
								],
								"lifeTimeRand": 0.2,
								"burstDelay": 1.5
							},
							"x": -0.82,
							"y": -2.58,
							"z": -0.7,
							"rotationX": -72.8,
							"rotationY": -5.5,
							"rotationZ": 140.9,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true,
													"emissive": 50
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/Spark.png",
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
															"time": 0,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": 1.3450505427640504,
																"dt": -0.2952549971921085
															},
															"nextHandle": {
																"dv": -0.6833333333333333,
																"dt": 0.15000000000000002
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.26
															},
															"nextHandle": {
																"dv": -2.7214566023630135e-16,
																"dt": 0.33333569371893157
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02352170282676526,
																"dt": -0.6051452312104698
															},
															"nextHandle": {
																"dv": 0.03222222222222226,
																"dt": 0.8296093750000002
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.26
															},
															"nextHandle": {
																"dv": -2.7214566023630135e-16,
																"dt": 0.33333569371893157
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
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.524747126051018,
														"dt": -0.08435811334917986
													},
													"nextHandle": {
														"dv": 1.1363636363636365,
														"dt": 0.038593750000000024
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015151515151515138,
														"dt": -0.6513281249999998
													},
													"nextHandle": {
														"dv": -0.007748222232672166,
														"dt": 0.333317624512036
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.x",
									"keys": [
										{
											"time": 0.06,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.325,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0214444444444446,
												"dt": -0.44000000000000006
											},
											"nextHandle": {
												"dv": 0.0214444444444446,
												"dt": 0.44000000000000006
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
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.52
											},
											"nextHandle": {
												"dv": -5.442874662877125e-16,
												"dt": 0.33333333333333326
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