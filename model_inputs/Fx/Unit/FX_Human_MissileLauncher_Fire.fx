{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Male01_ImperialFlameThrower",
							"source": "Character/Imperial/FlameThrower/Male01_ImperialFlameThrower.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/MissileLauncher/Anim_Male01_MissileLauncher_Fire.fbx"
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Flame_2",
					"x": -0.3,
					"z": 0.8,
					"scaleX": 2.5,
					"scaleY": 2.5,
					"scaleZ": 2.5,
					"rotationX": -90,
					"rotationZ": 90,
					"children": [
						{
							"type": "emitter",
							"name": "Fireball_Screen",
							"props": {
								"instScale_rand": 0.1,
								"maxCount": 60,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									1,
									0.4392156862745098,
									0.3529411764705882,
									1
								],
								"emitRate": 25,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 32,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"instScale": 1.2,
								"burstDelay": 0.05,
								"instStretch_rand": [
									0.1,
									0.1,
									0.1
								],
								"burstParticleCount": 2,
								"emitShape": "Cone",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.2,
								"alignMode": "Screen",
								"emitAngle": 0,
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
									-3,
									0,
									0
								],
								"instAcceleration_rand": [
									1,
									0,
									0
								],
								"warmUpTime": -0.05,
								"speedFactor": 1.1,
								"useRandomColor": true,
								"emitType": "Burst",
								"burstCount": 44,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"y": 0.17202,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationZ": -90,
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
													"emissive": 4
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
													0.6078431372549019,
													0.19607843137254902
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
												"progress": 0.48,
												"saturation": 0,
												"width": 0.7,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.5,
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
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.3
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0,
													1,
													0.7764705882352941
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
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
															"prevHandle": {
																"dv": 0.006248340267689945,
																"dt": -0.8978534188827493
															},
															"nextHandle": {
																"dv": -0.0038154327255516,
																"dt": 0.7074997680399716
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6392156862745098,
													0.4980392156862745
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
															"time": 0.18,
															"value": 0.9,
															"prevHandle": {
																"dv": 1.4609387884121252,
																"dt": -0.41602514716892197
															},
															"nextHandle": {
																"dv": -1.1333333333333333,
																"dt": 0.3227343750000003
															}
														},
														{
															"time": 0.6499999999999999,
															"value": 0.03333333333333333,
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
											"value": 0.1,
											"prevHandle": {
												"dv": -0.4183058178930624,
												"dt": -0.5089066171602237
											},
											"nextHandle": {
												"dv": 0.4183058178930624,
												"dt": 0.5089066171602237
											}
										},
										{
											"time": 1,
											"value": 0.7,
											"prevHandle": {
												"dv": -0.245,
												"dt": -0.51
											},
											"nextHandle": {
												"dv": 0.12661517991313334,
												"dt": 0.26356629288040034
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0,
										"sandColorSet": false,
										"envBlend": 0.2,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "emitter",
							"name": "Fireball_Screen",
							"props": {
								"instScale_rand": 0.1,
								"maxCount": 60,
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									1,
									0.7803921568627451,
									0.7490196078431373,
									1
								],
								"emitRate": 2,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 32,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"instScale": 2,
								"burstDelay": 0.15,
								"instStretch_rand": [
									0.1,
									0.1,
									0.1
								],
								"burstParticleCount": 4,
								"emitShape": "Cone",
								"emitRad1": 0.83,
								"emitSurface": true,
								"alignMode": "Screen",
								"emitAngle": 0,
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
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -0.05,
								"speedFactor": 1.1,
								"useRandomColor": true,
								"lifeTime": 0.8,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"y": 0.03146,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationZ": -90,
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
												"scale": 1
											},
											"isInstance": true
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
												"texture": "Fx/Alphas/T_circle4.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.039999999999999994,
															"value": 1,
															"prevHandle": {
																"dv": 0.037652272144758886,
																"dt": -0.012906173804746368
															},
															"nextHandle": {
																"dv": -0.8,
																"dt": 0.2775158336013556
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
													0.6431372549019607,
													0.26666666666666666
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.78,
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
												"range": 2,
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
											"value": 0.1,
											"prevHandle": {
												"dv": -0.4183058178930624,
												"dt": -0.5089066171602237
											},
											"nextHandle": {
												"dv": 0.4183058178930624,
												"dt": 0.5089066171602237
											}
										},
										{
											"time": 1,
											"value": 0.7,
											"prevHandle": {
												"dv": -0.245,
												"dt": -0.51
											},
											"nextHandle": {
												"dv": 0.12661517991313334,
												"dt": 0.26356629288040034
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0,
										"sandColorSet": false,
										"envBlend": 0.2,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "emitter",
							"name": "Distort",
							"props": {
								"instScale_rand": 0.5,
								"maxCount": 10,
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
								"burstDelay": 0.15,
								"instStretch_rand": [
									0.3,
									0.1,
									0
								],
								"burstParticleCount": 4,
								"emitShape": "Cone",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.2,
								"alignMode": "Screen",
								"emitAngle": 0,
								"instSpeed": [
									8,
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
									-4,
									0,
									0
								],
								"instAcceleration_rand": [
									1,
									0,
									0
								],
								"warmUpTime": -0.05,
								"speedFactor": 1.1,
								"instStretch": [
									1.5,
									1,
									1
								],
								"emitRate": 2,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"x": -0.11708,
							"y": -0.20829,
							"z": -0.08549,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationZ": -90,
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
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/TS_Dust_02.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/sand-normal.png",
												"intensity": 0.005
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": -0.015,
															"value": 0.004242424242424159
														},
														{
															"time": 0.25,
															"value": 0.9810407921993373,
															"prevHandle": {
																"dv": -0.05004195689377786,
																"dt": -0.13015089404560723
															},
															"nextHandle": {
																"dv": 0.04806148015802558,
																"dt": 0.125
															}
														},
														{
															"time": 1,
															"value": 0.004242424242424214,
															"prevHandle": {
																"dv": 0.7124602270877725,
																"dt": -0.6799999999999999
															},
															"nextHandle": {
																"dv": -0.7124602270877725,
																"dt": 0.6799999999999999
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
											"value": 0.65734981627899,
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
											"prevHandle": {
												"dv": -0.10160322425525758,
												"dt": -0.8228125
											},
											"nextHandle": {
												"dv": 0.03291356561287428,
												"dt": 0.2664930238157777
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
					"name": "group_2",
					"enabled": false,
					"children": [
						{
							"type": "model",
							"name": "Male01_HeavyWeaponSquad_2",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"editorOnly": true,
							"x": 0.016170000000000004,
							"y": 0.07113999999999998,
							"z": 0.0075399999999999825,
							"scaleX": 2,
							"scaleY": 1.9999999999999996,
							"scaleZ": 1.9999999999999996,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/MissileLauncher/Anim_Male01_MissileLauncher_Fire.fbx"
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.group_2.Flame_2",
							"target": "FXAnimation.FXRoot.group_2.Male01_HeavyWeaponSquad_2.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						},
						{
							"type": "shader",
							"name": "AlphaKill",
							"source": "shaders/AlphaKill.hx",
							"props": {
								"threshold": 0.01,
								"useRGB": false
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "group",
					"enabled": false,
					"x": -38.2304,
					"y": 22.16125,
					"z": 0.07114,
					"children": [
						{
							"type": "model",
							"name": "Male01_HeavyWeaponSquad",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"x": 0.016170000000000004,
							"y": 0.07113999999999998,
							"z": 0.0075399999999999825,
							"scaleX": 2,
							"scaleY": 1.9999999999999996,
							"scaleZ": 1.9999999999999996,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/MissileLauncher/Anim_Male01_MissileLauncher_Fire.fbx"
								}
							]
						},
						{
							"type": "object",
							"name": "Flame",
							"scaleX": 1.3999999999999997,
							"scaleY": 1.4000000000000004,
							"scaleZ": 1.4,
							"rotationX": -90,
							"children": [
								{
									"type": "emitter",
									"name": "Fireball_Screen",
									"props": {
										"instScale_rand": 0.5,
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
										"emitRate": 18,
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
										"burstDelay": 0.15,
										"instStretch_rand": [
											0.3,
											0.1,
											0
										],
										"burstParticleCount": 4,
										"emitShape": "Cone",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.2,
										"alignMode": "Screen",
										"emitAngle": 0,
										"instSpeed": [
											9,
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
										"warmUpTime": -0.05,
										"speedFactor": 1.1,
										"instStretch": [
											1.5,
											1,
											1
										],
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"rotationZ": -90,
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
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"props": {
														"amount": 1,
														"color": [
															0,
															0.2627450980392157,
															1
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
																	"time": 0.06960937500000004,
																	"value": 0.9,
																	"prevHandle": {
																		"dv": 1.4609387884121252,
																		"dt": -0.41602514716892197
																	},
																	"nextHandle": {
																		"dv": -1.1333333333333333,
																		"dt": 0.3227343750000003
																	}
																},
																{
																	"time": 0.6201562500000005,
																	"value": 0.03333333333333333,
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
														"uvScaleX": 0.3,
														"uvScaleY": 0.3,
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
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": -0.7392989135924961,
														"dt": -0.4648407502327254
													},
													"nextHandle": {
														"dv": 0.5320843173455061,
														"dt": 0.3353906250000002
													}
												},
												{
													"time": 1,
													"value": 1.01469963255798,
													"prevHandle": {
														"dv": -0.2540080606381441,
														"dt": -0.6456249999999997
													},
													"nextHandle": {
														"dv": 0.10442065749749455,
														"dt": 0.26534697796501594
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Distort",
									"enabled": false,
									"props": {
										"instScale_rand": 0.5,
										"maxCount": 10,
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
										"instRotation_rand": [
											0,
											0,
											0
										],
										"frameCount": 32,
										"frameDivisionX": 8,
										"frameDivisionY": 8,
										"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
										"instScale": 4,
										"burstDelay": 0.15,
										"instStretch_rand": [
											0.3,
											0.1,
											0
										],
										"burstParticleCount": 4,
										"emitShape": "Cone",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.2,
										"alignMode": "Screen",
										"emitAngle": 0,
										"instSpeed": [
											8,
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
											-4,
											0,
											0
										],
										"instAcceleration_rand": [
											1,
											0,
											0
										],
										"warmUpTime": -0.05,
										"speedFactor": 1.1,
										"instStretch": [
											2.5,
											1,
											1
										],
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"rotationZ": -90,
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
														"texture": "Fx/Alphas/TS_Dust_02.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/perlin2Normal.jpg",
														"intensity": 0.1
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
													"value": 0.3,
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
													"prevHandle": {
														"dv": -0.10160322425525758,
														"dt": -0.8228125
													},
													"nextHandle": {
														"dv": 0.03291356561287428,
														"dt": 0.2664930238157777
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.group.Flame",
							"target": "FXAnimation.FXRoot.group.Male01_HeavyWeaponSquad.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						}
					]
				},
				{
					"type": "object",
					"name": "group_3",
					"enabled": false,
					"x": -18.98721,
					"y": -0.00754,
					"z": 0.07114,
					"children": [
						{
							"type": "model",
							"name": "Male01_HeavyWeaponSquad_3",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"x": 0.016170000000000004,
							"y": 0.07113999999999998,
							"z": 0.0075399999999999825,
							"scaleX": 2,
							"scaleY": 1.9999999999999996,
							"scaleZ": 1.9999999999999996,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/MissileLauncher/Anim_Male01_MissileLauncher_Fire.fbx"
								}
							]
						},
						{
							"type": "object",
							"name": "Flame_3",
							"x": -0.04871,
							"y": 0.3376,
							"z": 0.00011,
							"scaleX": 1.3999999999999997,
							"scaleY": 1.4000000000000004,
							"scaleZ": 1.4,
							"rotationX": -92.7,
							"rotationY": -5.1,
							"rotationZ": 1.9,
							"children": [
								{
									"type": "emitter",
									"name": "Fireball_Screen",
									"props": {
										"instScale_rand": 0.2,
										"maxCount": 60,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											1,
											0,
											0,
											1
										],
										"emitRate": 25,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 32,
										"frameDivisionX": 8,
										"frameDivisionY": 8,
										"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
										"instScale": 4,
										"burstDelay": 0.15,
										"instStretch_rand": [
											0.1,
											0.1,
											0.1
										],
										"burstParticleCount": 4,
										"emitShape": "Cone",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.2,
										"alignMode": "Screen",
										"emitAngle": 0,
										"instSpeed": [
											8,
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
										"warmUpTime": -0.05,
										"speedFactor": 1.1,
										"useRandomColor": true,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"rotationZ": -90,
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
															"emissive": 30
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
															0.6392156862745098,
															0.5529411764705883
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"props": {
														"amount": 0.61,
														"color": [
															1,
															0.8392156862745098,
															0
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
																	"time": 0.06960937500000004,
																	"value": 0.9,
																	"prevHandle": {
																		"dv": 1.4609387884121252,
																		"dt": -0.41602514716892197
																	},
																	"nextHandle": {
																		"dv": -1.1333333333333333,
																		"dt": 0.3227343750000003
																	}
																},
																{
																	"time": 0.6201562500000005,
																	"value": 0.03333333333333333,
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
														"progress": 0.21,
														"saturation": 0,
														"width": 0.62,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/Water_03.png",
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
														"amount": 0.85,
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
														"range": 1,
														"power": 0.3
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
													"prevHandle": {
														"dv": -0.5322722190589699,
														"dt": -0.4889661246852252
													},
													"nextHandle": {
														"dv": 0.47352649519372403,
														"dt": 0.435
													}
												},
												{
													"time": 1,
													"value": 0.7,
													"prevHandle": {
														"dv": -0.2540080606381441,
														"dt": -0.6456249999999997
													},
													"nextHandle": {
														"dv": 0.10442065749749455,
														"dt": 0.26534697796501594
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0,
												"sandColorSet": false,
												"envBlend": 0.2,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "emitter",
									"name": "Distort",
									"props": {
										"instScale_rand": 0.5,
										"maxCount": 10,
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
										"burstDelay": 0.15,
										"instStretch_rand": [
											0.3,
											0.1,
											0
										],
										"burstParticleCount": 4,
										"emitShape": "Cone",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.2,
										"alignMode": "Screen",
										"emitAngle": 0,
										"instSpeed": [
											8,
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
											-4,
											0,
											0
										],
										"instAcceleration_rand": [
											1,
											0,
											0
										],
										"warmUpTime": -0.05,
										"speedFactor": 1.1,
										"instStretch": [
											1.5,
											1,
											1
										],
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"x": -0.11708,
									"y": -1.0143,
									"z": -0.08549,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"rotationZ": -90,
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
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
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
														"vOffset": 0,
														"texture": "Fx/Alphas/TS_Dust_02.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/water-normal.png",
														"intensity": 0.002
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "intensity",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": -0.015,
																	"value": 0.004242424242424159
																},
																{
																	"time": 0.25,
																	"value": 0.9810407921993373,
																	"prevHandle": {
																		"dv": -0.05004195689377786,
																		"dt": -0.13015089404560723
																	},
																	"nextHandle": {
																		"dv": 0.04806148015802558,
																		"dt": 0.125
																	}
																},
																{
																	"time": 1,
																	"value": 0.004242424242424214,
																	"prevHandle": {
																		"dv": 0.7124602270877725,
																		"dt": -0.6799999999999999
																	},
																	"nextHandle": {
																		"dv": -0.7124602270877725,
																		"dt": 0.6799999999999999
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
													"value": 0.3,
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
													"prevHandle": {
														"dv": -0.10160322425525758,
														"dt": -0.8228125
													},
													"nextHandle": {
														"dv": 0.03291356561287428,
														"dt": 0.2664930238157777
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.group_3.Flame_3",
							"target": "FXAnimation.FXRoot.group_3.Male01_HeavyWeaponSquad_3.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": ".FXRoot.Flame_2",
					"target": ".FXRoot.Chara.Male01_ImperialFlameThrower.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
				}
			]
		},
		{
			"type": "polygon",
			"name": "polygon",
			"editorOnly": true,
			"locked": true,
			"x": -0.036,
			"y": 0.694315,
			"z": 0.18712500000000043,
			"scaleX": 10000,
			"scaleY": 10000,
			"scaleZ": 5,
			"color": -14869219,
			"kind": 0,
			"args": [
				0
			]
		}
	]
}