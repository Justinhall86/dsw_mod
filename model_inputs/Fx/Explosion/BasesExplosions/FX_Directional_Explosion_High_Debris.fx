{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 10,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Directional Explosion",
					"rotationY": -90,
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
								"instScale": 13,
								"emitType": "Burst",
								"burstDelay": 0.05,
								"instStretch_rand": [
									0,
									0,
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
								"lifeTime": 1.6,
								"warmUpTime": -0.5,
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
									-3,
									0,
									0
								]
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
													0.18823529411764706,
													0.18823529411764706,
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
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
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
								"instScale": 6,
								"emitType": "Burst",
								"burstDelay": 0.15,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"burstParticleCount": 3,
								"emitShape": "Cone",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.3,
								"alignMode": "Screen",
								"emitAngle": 38.18,
								"instSpeed": [
									6,
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
								"warmUpTime": -0.4
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
													"emissive": 12
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
								"warmUpTime": -0.5
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
													"emissive": 18
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
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "DirectionalFire_Mesh",
							"props": {
								"enableSort": false,
								"emitSurface": true,
								"frameCount": 4,
								"animationSpeed": 0,
								"instStretch": [
									1.1,
									1.1,
									3
								],
								"lifeTimeRand": 0.1,
								"warmUpTime": -0.5,
								"emitType": "Burst",
								"instStretch_rand": [
									0.2,
									0.2,
									0.55
								],
								"instScale": 3,
								"instScale_rand": 0.2,
								"seedGroup": 3,
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
									0
								],
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2_02.png",
								"simulationSpace": "World",
								"instSpeed_rand": [
									0,
									0,
									5
								],
								"instSpeed": [
									0,
									0,
									20
								]
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationY": 90,
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
													"emissive": 18
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
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"enabled": false,
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
					"name": "Sparkles01",
					"props": {
						"emitType": "Burst",
						"burstParticleCount": 15,
						"emitOrientation": "Speed",
						"emitShape": "Cone",
						"emitAngle": 70,
						"instSpeed": [
							25,
							0,
							0
						],
						"lifeTime": 0.85,
						"warmUpTime": -1,
						"emitSurface": true,
						"instStretch": [
							2,
							1,
							1
						],
						"instScale_rand": 0.25,
						"instSpeed_rand": [
							10,
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
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.9098039215686274,
							0.9098039215686274,
							0.9098039215686274,
							1
						],
						"lifeTimeRand": 0.2,
						"burstDelay": 5,
						"emitDuration": 50,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0,
						"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
						"instScale": 1.1
					},
					"scaleX": 5,
					"scaleY": 5,
					"scaleZ": 5,
					"rotationY": -90,
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
											"emissive": 30
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
									"children": [
										{
											"type": "curve",
											"name": "scale",
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.2628260520650284,
													"mode": 0,
													"prevHandle": {
														"dv": -6.425078041087688e-7,
														"dt": -0.49997856790757494
													},
													"nextHandle": {
														"dv": 8.684021676197418e-7,
														"dt": 0.675762176513672
													}
												},
												{
													"time": 0.7727465629577638,
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
													"mode": 0,
													"prevHandle": {
														"dv": 0.02489292220135931,
														"dt": -0.49997816546211754
													},
													"nextHandle": {
														"dv": -0.033333333333333326,
														"dt": 0.6695051193237306
													}
												},
												{
													"time": 0.7727465629577638,
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
													"mode": 0,
													"prevHandle": {
														"dv": 0.011208486585454912,
														"dt": -0.4999783680885942
													},
													"nextHandle": {
														"dv": -0.01507906281714666,
														"dt": 0.6726336479187013
													}
												},
												{
													"time": 0.7727465629577638,
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
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"enabled": false,
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
				}
			]
		}
	]
}