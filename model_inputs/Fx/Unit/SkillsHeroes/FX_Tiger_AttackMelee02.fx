{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 50,
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
			"scaleX": 2.2,
			"scaleY": 2.2,
			"scaleZ": 2.2,
			"children": [
				{
					"type": "object",
					"name": "WensiciaTiger",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Tiger_ImperialLazaTiger",
							"source": "Character/Imperial/LazaTiger/Tiger_ImperialLazaTiger.fbx",
							"rotationZ": 95,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Tiger/Anim_Tiger_AttackMelee02.fbx"
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Step1",
					"children": [
						{
							"type": "emitter",
							"name": "Sand_Floor2",
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
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
								"instScale": 7,
								"emitType": "Burst",
								"instStretch_rand": [
									0,
									0,
									0
								],
								"burstParticleCount": 3,
								"emitShape": "Cylinder",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.3,
								"alignMode": "Screen",
								"warmUpTime": -0.7,
								"emitOrientation": "Normal",
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"seedGroup": 2,
								"lifeTime": 1.5,
								"burstDelay": 0.5,
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instOffset": [
									0,
									0,
									2
								],
								"instSpeed": [
									4,
									0,
									0
								]
							},
							"x": 1.12338,
							"y": 0.40544,
							"z": -0.11583,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 15.1,
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
												"alpha": 0.8
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
													0.9098039215686274,
													0.9098039215686274,
													0.9098039215686274
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
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
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
												"range": 28.79,
												"power": 38.64
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"enabled": false,
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topIntensity": 0.4,
											"topSpan": 0.5,
											"dirIntensity": 0.5,
											"dirSpan": 0.9,
											"sandBlend": 0.7,
											"envBlend": 0.5
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.4,
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
											"value": 0.2,
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
												"dv": -0.040734981627899014,
												"dt": -0.6732812499999992
											},
											"nextHandle": {
												"dv": 0.016048606913192237,
												"dt": 0.2659338296837626
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
												"dv": 1.0368041795619947,
												"dt": -0.22469329683007053
											},
											"nextHandle": {
												"dv": -1.0041624617719014,
												"dt": 0.2179870466083442
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.024279651221022422,
												"dt": -0.3496719776184397
											},
											"nextHandle": {
												"dv": 0.024279651221022422,
												"dt": 0.3496719776184397
											}
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "Round_Sand_Stylised",
							"x": 1.33033,
							"y": 0.39675,
							"z": 0.06,
							"scaleX": 3.25,
							"scaleY": 3.25,
							"scaleZ": 0.04,
							"rotationZ": 89.99999999999997,
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
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"parallax": 0,
											"textureWrap": true,
											"emissive": 0.3,
											"drawOrder": "110"
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
										"texture": "Fx/Alphas/T_FlatImpact.png"
									}
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
										"saturation": 0,
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
											"name": "progress",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6486190147033646,
													"value": 0.8948601617813111,
													"mode": 1
												},
												{
													"time": 0.6486190147033646,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": -1.0614035807794995,
														"dt": 0.24955175517728168
													}
												},
												{
													"time": 1.4748211605056465,
													"value": 0.0002485722671614621,
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
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.7001564520152905,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.010893013836548135
											}
										},
										{
											"time": 0.7344305355056463,
											"value": 0.4,
											"mode": 0,
											"prevHandle": {
												"dv": -0.018726500684397046,
												"dt": -0.003303737957172996
											},
											"nextHandle": {
												"dv": 0.5269202398255781,
												"dt": 0.09254882812499987
											}
										},
										{
											"time": 1.6034051448806501,
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
					"type": "object",
					"name": "Step2",
					"children": [
						{
							"type": "emitter",
							"name": "Sand_Floor2",
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
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
								"instScale": 7,
								"emitType": "Burst",
								"instStretch_rand": [
									0,
									0,
									0
								],
								"burstParticleCount": 3,
								"emitShape": "Cylinder",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.3,
								"alignMode": "Screen",
								"warmUpTime": -0.75,
								"emitOrientation": "Normal",
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"seedGroup": 2,
								"lifeTime": 1.5,
								"burstDelay": 0.5,
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instOffset": [
									0,
									0,
									2
								],
								"instSpeed": [
									5,
									0,
									0
								]
							},
							"x": 1.7177,
							"y": -0.12865,
							"z": -0.11583,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 4.1,
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
												"alpha": 0.8
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
													0.9098039215686274,
													0.9098039215686274,
													0.9098039215686274
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
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
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
												"range": 28.79,
												"power": 38.64
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"enabled": false,
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topIntensity": 0.4,
											"topSpan": 0.5,
											"dirIntensity": 0.5,
											"dirSpan": 0.9,
											"sandBlend": 0.7,
											"envBlend": 0.5
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.4,
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
											"value": 0.2,
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
												"dv": -0.040734981627899014,
												"dt": -0.6732812499999992
											},
											"nextHandle": {
												"dv": 0.016048606913192237,
												"dt": 0.2659338296837626
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
												"dv": 1.0368041795619947,
												"dt": -0.22469329683007053
											},
											"nextHandle": {
												"dv": -1.0041624617719014,
												"dt": 0.2179870466083442
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.024279651221022422,
												"dt": -0.3496719776184397
											},
											"nextHandle": {
												"dv": 0.024279651221022422,
												"dt": 0.3496719776184397
											}
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "Round_Sand_Stylised",
							"scaleX": 3.25,
							"scaleY": 3.25,
							"scaleZ": 0.04,
							"rotationZ": 89.99999999999997,
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
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"parallax": 0,
											"textureWrap": true,
											"emissive": 0.3,
											"drawOrder": "110"
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
										"texture": "Fx/Alphas/T_FlatImpact.png"
									}
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
										"saturation": 0,
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
											"name": "progress",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6886271719573676,
													"value": 0.8948601617813111,
													"mode": 1
												},
												{
													"time": 0.6886271719573676,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": -1.0614035807794995,
														"dt": 0.24955175517728168
													}
												},
												{
													"time": 1.5148293177596495,
													"value": 0.0002485722671614621,
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
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.7401646092692935,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.010893013836548135
											}
										},
										{
											"time": 0.7744386927596493,
											"value": 0.4,
											"mode": 0,
											"prevHandle": {
												"dv": -0.018726500684397046,
												"dt": -0.003303737957172996
											},
											"nextHandle": {
												"dv": 0.5269202398255781,
												"dt": 0.09254882812499987
											}
										},
										{
											"time": 1.643413302134653,
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
					"type": "object",
					"name": "SlashR",
					"x": 1.17637,
					"y": -0.44122,
					"z": 1.10457,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.5,
					"rotationX": 84.1,
					"rotationY": -14.4,
					"rotationZ": 2.9,
					"children": [
						{
							"type": "polygon",
							"name": "Slash",
							"x": -0.01808,
							"y": 0.00008,
							"z": -0.05781,
							"scaleX": 3.5,
							"scaleY": 3.5000000000000004,
							"scaleZ": 3.5000000000000004,
							"rotationX": 3.7,
							"rotationY": -13,
							"rotationZ": 64.6,
							"kind": 1,
							"args": [
								24,
								275,
								0.57,
								4
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
											"colorMask": 255
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
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
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square02.jpg",
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157
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
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": true
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.24042360718633,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.7002471478983994,
													"value": 1.96,
													"mode": 0,
													"prevHandle": {
														"dv": -2.220446049250313e-16,
														"dt": -0.8649999999999947
													},
													"nextHandle": {
														"dv": -1.2076907783619122e-15,
														"dt": 0.3316640059375199
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
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.2823173850174943,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.009470567645967806,
														"dt": -0.4997450715126867
													},
													"nextHandle": {
														"dv": 0.0070670616006630604,
														"dt": 0.4176048088699997
													}
												},
												{
													"time": 0.7161925111161953,
													"value": 1.0069444444444449,
													"mode": 1,
													"prevHandle": {
														"dv": -0.9762678616087629,
														"dt": -0.043285321294840085
													},
													"nextHandle": {
														"dv": -1.027650380640803,
														"dt": 0.05102125792538481
													}
												},
												{
													"time": 1.1677739604196862,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015351971896301608,
														"dt": -0.41489308933188285
													},
													"nextHandle": {
														"dv": -0.015351971896301608,
														"dt": 0.41489308933188285
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
											"name": "amount",
											"keys": [
												{
													"time": 0.6745163130720047,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6845163130720047,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7006196041914374,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7106196041914374,
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
										"useScale": false,
										"wrap": true,
										"progress": 0.8,
										"saturation": 1,
										"width": 0.9,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashImpact",
							"x": -0.01808,
							"y": 0.00008,
							"z": -0.05781,
							"scaleX": 3.5,
							"scaleY": 3.5000000000000004,
							"scaleZ": 3.5000000000000004,
							"rotationX": 3.7,
							"rotationY": -13,
							"rotationZ": 64.6,
							"kind": 1,
							"args": [
								24,
								275,
								0.57,
								4
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
											"emissive": 3
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
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
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": -0.10499999999999998,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7005899027675357,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7105899027675358,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7205899027675358,
													"value": 0.016666666666666663,
													"mode": 2
												},
												{
													"time": 1.7158721478984051,
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157
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
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": true
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.23009997860150638,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.6899235193135758,
													"value": 1.96,
													"mode": 0,
													"prevHandle": {
														"dv": -2.220446049250313e-16,
														"dt": -0.8649999999999947
													},
													"nextHandle": {
														"dv": -1.2076907783619122e-15,
														"dt": 0.3316640059375199
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
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.2823173850174943,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.009470567645967806,
														"dt": -0.4997450715126867
													},
													"nextHandle": {
														"dv": 0.0070670616006630604,
														"dt": 0.4176048088699997
													}
												},
												{
													"time": 0.7161925111161953,
													"value": 1.0069444444444449,
													"mode": 1,
													"prevHandle": {
														"dv": -0.9735635185018134,
														"dt": -0.024906889141887878
													},
													"nextHandle": {
														"dv": -1.027650380640803,
														"dt": 0.05102125792538481
													}
												},
												{
													"time": 1.1809566400585532,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015351971896301608,
														"dt": -0.41489308933188285
													},
													"nextHandle": {
														"dv": -0.015351971896301608,
														"dt": 0.41489308933188285
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
										"progress": 0.8,
										"saturation": 1,
										"width": 0.9,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A.png",
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9725490196078431,
											0.8352941176470589,
											0.6235294117647059
										]
									}
								}
							]
						},
						{
							"type": "model",
							"name": "Knees",
							"source": "Fx/Meshes_Common/PlanePivBot_MoreVrtx.fbx",
							"x": 1.78641,
							"y": 1.5219,
							"z": 0.4164,
							"scaleX": 59.999999999999986,
							"scaleY": 80,
							"scaleZ": 219.99999999999991,
							"rotationX": 74.5790019320122,
							"rotationY": 179.55447933646454,
							"rotationZ": -15.322076592258497,
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
											"emissive": 0.5
										}
									}
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
										"alpha": 2.27,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.18,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Claws.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6541602362556753,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.707979628339663,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.8428041410245011,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "uOffset",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6461570505776119,
													"value": 2.5,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 0.8103022759279225,
													"value": -3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
													}
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.08,
										"vOffset": 0,
										"texture": "Fx/Gradients/uGrad.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6541602362556753,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.707979628339663,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.8428041410245011,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.041899793662877126
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.14,
										"uvScaleY": 0.73,
										"texture": "Fx/noise/Wave_01.jpg",
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.557550970862538,
													"value": 0.05111111111111105,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 0.7362737921608254,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
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
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.98,
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
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScaleX": 1,
										"texScaleY": 1,
										"tex": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 0.21875,
														"color": -3026479
													},
													{
														"position": 0.47265625,
														"color": -1
													},
													{
														"position": 0.734375,
														"color": 13750737
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
										"intensity": 1.75,
										"scrollSpeed": [
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
					"name": "SlashL",
					"x": 0.94605,
					"y": 0.63655,
					"z": 1.05089,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.5,
					"rotationX": 83,
					"rotationY": -13.9,
					"rotationZ": 7.4,
					"children": [
						{
							"type": "polygon",
							"name": "Slash",
							"x": -0.04635,
							"y": -0.05192,
							"z": 0.51599,
							"scaleX": 3.5,
							"scaleY": 3.5000000000000004,
							"scaleZ": 3.5000000000000004,
							"rotationX": 3.6,
							"rotationY": 1.5,
							"rotationZ": 65.5,
							"kind": 1,
							"args": [
								24,
								275,
								0.57,
								4
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
											"colorMask": 255
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
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
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square02.jpg",
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157
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
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": true
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.18572523347132736,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.6455487741833967,
													"value": 1.96,
													"mode": 0,
													"prevHandle": {
														"dv": -2.220446049250313e-16,
														"dt": -0.8649999999999947
													},
													"nextHandle": {
														"dv": -1.2076907783619122e-15,
														"dt": 0.3316640059375199
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
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.22761901130249168,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.009470567645967806,
														"dt": -0.4997450715126867
													},
													"nextHandle": {
														"dv": 0.0070670616006630604,
														"dt": 0.4176048088699997
													}
												},
												{
													"time": 0.6614941374011927,
													"value": 1.0069444444444449,
													"mode": 1,
													"prevHandle": {
														"dv": -0.9762678616087629,
														"dt": -0.043285321294840085
													},
													"nextHandle": {
														"dv": -1.027650380640803,
														"dt": 0.05102125792538481
													}
												},
												{
													"time": 1.1130755867046835,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015351971896301608,
														"dt": -0.41489308933188285
													},
													"nextHandle": {
														"dv": -0.015351971896301608,
														"dt": 0.41489308933188285
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
											"name": "amount",
											"keys": [
												{
													"time": 0.619817939357002,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.629817939357002,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.6459212304764348,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.6559212304764348,
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
										"useScale": false,
										"wrap": true,
										"progress": 0.8,
										"saturation": 1,
										"width": 0.9,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashImpact",
							"x": -0.04635,
							"y": -0.05192,
							"z": 0.51599,
							"scaleX": 3.5,
							"scaleY": 3.5000000000000004,
							"scaleZ": 3.5000000000000004,
							"rotationX": 3.6,
							"rotationY": 1.5,
							"rotationZ": 65.5,
							"kind": 1,
							"args": [
								24,
								275,
								0.57,
								4
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
											"emissive": 3
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
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
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": -0.10499999999999998,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6458915290525331,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6558915290525331,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.6658915290525331,
													"value": 0.016666666666666663,
													"mode": 2
												},
												{
													"time": 1.6611737741834025,
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157
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
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": true
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.17540160488650375,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.6352251455985731,
													"value": 1.96,
													"mode": 0,
													"prevHandle": {
														"dv": -2.220446049250313e-16,
														"dt": -0.8649999999999947
													},
													"nextHandle": {
														"dv": -1.2076907783619122e-15,
														"dt": 0.3316640059375199
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
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.22761901130249168,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.009470567645967806,
														"dt": -0.4997450715126867
													},
													"nextHandle": {
														"dv": 0.0070670616006630604,
														"dt": 0.4176048088699997
													}
												},
												{
													"time": 0.6614941374011927,
													"value": 1.0069444444444449,
													"mode": 1,
													"prevHandle": {
														"dv": -0.9735635185018134,
														"dt": -0.024906889141887878
													},
													"nextHandle": {
														"dv": -1.027650380640803,
														"dt": 0.05102125792538481
													}
												},
												{
													"time": 1.1262582663435505,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015351971896301608,
														"dt": -0.41489308933188285
													},
													"nextHandle": {
														"dv": -0.015351971896301608,
														"dt": 0.41489308933188285
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
										"progress": 0.8,
										"saturation": 1,
										"width": 0.9,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A.png",
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9725490196078431,
											0.8352941176470589,
											0.6235294117647059
										]
									}
								}
							]
						},
						{
							"type": "model",
							"name": "Knees",
							"source": "Fx/Meshes_Common/PlanePivBot_MoreVrtx.fbx",
							"x": 1.94934,
							"y": 1.47729,
							"z": 0.41767,
							"scaleX": 59.999999999999986,
							"scaleY": 80,
							"scaleZ": 219.99999999999991,
							"rotationX": -90.6,
							"rotationY": 0.4,
							"rotationZ": 164.7,
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
											"emissive": 0.5
										}
									}
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
										"alpha": 2.27,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.18,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Claws.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5994618625406727,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6532812546246604,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.7881057673094984,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "uOffset",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5914586768626092,
													"value": 2.5,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 0.7556039022129198,
													"value": -3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
													}
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.08,
										"vOffset": 0,
										"texture": "Fx/Gradients/uGrad.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5994618625406727,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6532812546246604,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.7881057673094984,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.041899793662877126
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.14,
										"uvScaleY": 0.73,
										"texture": "Fx/noise/Wave_01.jpg",
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5028525971475354,
													"value": 0.05111111111111105,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 0.6815754184458228,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
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
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.98,
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
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScaleX": 1,
										"texScaleY": 1,
										"tex": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 0.21875,
														"color": -3026479
													},
													{
														"position": 0.47265625,
														"color": -1
													},
													{
														"position": 0.734375,
														"color": 13750737
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
										"intensity": 1.75,
										"scrollSpeed": [
											0,
											0
										]
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