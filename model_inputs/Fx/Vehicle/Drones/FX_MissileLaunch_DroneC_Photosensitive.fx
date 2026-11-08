{
	"type": "fx",
	"duration": 3,
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
			"z": 0.2,
			"children": [
				{
					"type": "model",
					"name": "DroneC",
					"source": "Vehicle/Imperial/DroneI/ImperiumDroneCanon.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "model",
							"name": "ImperiumDroneBase",
							"source": "Vehicle/Imperial/DroneI/ImperiumDroneBase.fbx"
						},
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/DroneC/Anim_DroneC_AttackRange.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "MissileLaunch",
					"children": [
						{
							"type": "object",
							"name": "Front",
							"x": 3.51728,
							"y": 0.01416,
							"z": 2.66906,
							"scaleX": 0.75,
							"scaleY": 0.75,
							"scaleZ": 0.75,
							"rotationX": -7.3,
							"rotationZ": 90,
							"children": [
								{
									"type": "object",
									"name": "------------------------Anticipation",
									"z": 6.045,
									"children": [
										{
											"type": "emitter",
											"name": "Flare",
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
													180
												],
												"lifeTime": 0.1,
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
												]
											},
											"x": -0.18054,
											"y": -1.28458,
											"z": -1.905,
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
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_circle3.png",
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
																"dv": -1.5722337330659413,
																"dt": -0.2981620006687968
															},
															"nextHandle": {
																"dv": 0.8675873545698849,
																"dt": 0.16515625
															}
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.004235797388637108,
																"dt": -0.626015625
															},
															"nextHandle": {
																"dv": -0.004235797388637108,
																"dt": 0.626015625
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
									"name": "-----------------------------Fireball",
									"enabled": false,
									"y": 2.47468,
									"z": 2.1415,
									"rotationX": 58.5,
									"children": [
										{
											"type": "emitter",
											"name": "FireBall_Screen_HalphSpere",
											"props": {
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
												"instScale": 10,
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
												"warmUpTime": 0.1,
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
												"lifeTime": 1.2,
												"speedFactor": 1.5
											},
											"scaleX": 3,
											"scaleY": 3,
											"scaleZ": 3,
											"rotationY": -90,
											"children": [
												{
													"type": "model",
													"name": "Hemisphere",
													"source": "Fx/Meshes_Common/SemiSphere.fbx",
													"scaleX": 0.025,
													"scaleY": 0.025,
													"scaleZ": 0.025,
													"rotationY": 90,
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
																"dv": 4.056219218588688e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.46
															}
														},
														{
															"time": 1,
															"value": 1.5,
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
										}
									]
								},
								{
									"type": "object",
									"name": "-----------------------------Distort",
									"enabled": false,
									"y": -3.64752,
									"z": 5.61759,
									"rotationX": 67.6,
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
												"instScale": 35,
												"emitShape": "Cylinder",
												"emitSurface": true
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
																	"culling": "None",
																	"emissive": 2
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
																"intensity": 0.018
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
																"shiftSpeedY": -0.01,
																"USE_SOURCE_UV": false
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Back",
							"x": -3.93362,
							"y": -0.01415,
							"z": 3.02638,
							"scaleX": 1.2000000000000002,
							"scaleY": 1.2000000000000002,
							"scaleZ": 1.2000000000000002,
							"rotationZ": 90,
							"children": [
								{
									"type": "emitter",
									"name": "ShockWave",
									"props": {
										"emitType": "Burst",
										"instScale": 25,
										"lifeTime": 0.8
									},
									"y": -1.19345,
									"z": -2,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationZ": 180,
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
															"depthTest": "LessEqual"
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
														"alpha": 3,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_HalfChocWave_Blurred_02.png",
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
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.5708015990978788
																	},
																	"nextHandle": {
																		"dv": 0.009785546759570019,
																		"dt": 0.33328019978181483
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
														"power": 0.5
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.65,
														"sandColorSet": false,
														"envBlend": 0.75,
														"envColorSet": false
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.1092025295592634,
														"dt": -0.3764566160928409
													},
													"nextHandle": {
														"dv": 1.0250000000000004,
														"dt": 0.35000000000000003
													}
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
									"name": "SandFloor2",
									"props": {
										"instScale_rand": 2,
										"simulationSpace": "World",
										"animationSpeed": 0,
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
											30
										],
										"lifeTimeRand": 0.2,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 4,
										"lifeTime": 1.4,
										"emitRad1": 0.64,
										"emitRad2": 0.89,
										"randomColor2": [
											0.807843137254902,
											0.788235294117647,
											0.7803921568627451,
											1
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"emitRate": 30,
										"maxCount": 60,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
										"instWorldAcceleration_rand": [
											0,
											0,
											0
										],
										"instSpeed": [
											10,
											0,
											0
										],
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"alignMode": "Screen",
										"speedFactor": 0.7,
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instStretch": [
											1,
											0.8,
											1
										],
										"instAcceleration_rand": [
											1.5,
											0,
											0
										],
										"seedGroup": 1,
										"emitType": "Burst",
										"burstParticleCount": 5,
										"emitAngle": 60,
										"warmUpTime": -0.01
									},
									"y": -2.35976,
									"z": -2,
									"scaleX": 8.5,
									"scaleY": 8.5,
									"scaleZ": 0.02,
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
														"scale": 0.4
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
														"useScale": false,
														"wrap": true,
														"progress": 0.7,
														"saturation": 0,
														"width": 0.41,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/Wave_01.jpg",
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
																	"value": 0.9,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.250468545740539,
																		"dt": -0.330632361246651
																	},
																	"nextHandle": {
																		"dv": -0.9833333333333334,
																		"dt": 0.26
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
													"props": {
														"tag": "WIP"
													},
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.6,
													"topSpan": 0.3,
													"dirIntensity": 0.1,
													"dirSpan": 0,
													"sandBlend": 0.6,
													"envBlend": 0.7
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
														"dv": -1.1562467376557881,
														"dt": -0.4434037260494899
													},
													"nextHandle": {
														"dv": 0.9296473571905786,
														"dt": 0.35500000000000004
													}
												},
												{
													"time": 1,
													"value": 1.5,
													"mode": 2
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
														"dv": 1.3622317146376575,
														"dt": -0.2880785101446849
													},
													"nextHandle": {
														"dv": -1.0166666666666666,
														"dt": 0.21500000000000002
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5800000000000001
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
				},
				{
					"type": "emitter",
					"name": "flameleft",
					"enabled": false,
					"props": {
						"emitType": "Burst",
						"instScale": 2,
						"lifeTime": 0.4,
						"instRotation": [
							90,
							0,
							0
						],
						"instStretch": [
							1,
							1,
							2
						]
					},
					"x": 0.9066,
					"y": -0.66803,
					"z": 3.80783,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"rotationY": 55.5,
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
											"depthTest": "LessEqual"
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
										"alpha": 3,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_FlatFlash02.png",
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
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01666666666666672,
														"dt": -0.5708015990978788
													},
													"nextHandle": {
														"dv": 0.009785546759570019,
														"dt": 0.33328019978181483
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.25,
										"uvScaleY": 0.25,
										"texture": "Fx/noise/T_Noise_Wave_02.png",
										"uvShift": [
											0.2,
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
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -1.1092025295592634,
										"dt": -0.3764566160928409
									},
									"nextHandle": {
										"dv": 1.0250000000000004,
										"dt": 0.35000000000000003
									}
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
					"name": "flameright",
					"enabled": false,
					"props": {
						"emitType": "Burst",
						"instScale": 2,
						"lifeTime": 0.4,
						"instRotation": [
							90,
							0,
							0
						],
						"instStretch": [
							1,
							1,
							2
						]
					},
					"x": 0.69492,
					"y": 1.07593,
					"z": 3.49984,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"rotationY": -55.5,
					"rotationZ": 180,
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
											"depthTest": "LessEqual"
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
										"alpha": 3,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_FlatFlash02.png",
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
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01666666666666672,
														"dt": -0.5708015990978788
													},
													"nextHandle": {
														"dv": 0.009785546759570019,
														"dt": 0.33328019978181483
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.4,
										"uvScaleY": 0.4,
										"texture": "Fx/noise/T_Noise_Wave_02.png",
										"uvShift": [
											0.2,
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
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -1.1092025295592634,
										"dt": -0.3764566160928409
									},
									"nextHandle": {
										"dv": 1.0250000000000004,
										"dt": 0.35000000000000003
									}
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