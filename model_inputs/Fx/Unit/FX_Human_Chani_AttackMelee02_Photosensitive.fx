{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 13,
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
					"name": "Chani",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Female01_FremenChani",
							"source": "Character/Fremen/Unit/Chani/Female01_FremenChani.fbx",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Chani/Anim_Female01_Chani_AttackMelee02.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Crysknife",
							"source": "Character/Fremen/Weapon/Crysknife/Crysknife.fbx",
							"x": -0.00275,
							"y": -0.11773,
							"z": 0.01896,
							"rotationX": -90
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "Crysknife",
							"target": "Female01_FremenChani.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						}
					]
				},
				{
					"type": "object",
					"name": "Step1",
					"x": 1.10256,
					"y": 0.23793,
					"rotationZ": 9.3,
					"children": [
						{
							"type": "polygon",
							"name": "Back_Sand_Stylised1",
							"x": 4.67157,
							"y": 0.24009,
							"z": 0.15522,
							"scaleX": 5,
							"scaleY": 5.56,
							"scaleZ": 0.06,
							"rotationX": -10.9,
							"rotationY": -1.3,
							"rotationZ": 111.8,
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
											"emissive": 0.5,
											"drawOrder": "100"
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
										"alpha": 0.7,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_FlatSmoke.png"
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
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											1
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
													"time": 0.19469297519976614,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": -0.5337762368520101,
														"dt": 0.42926778498909995
													}
												},
												{
													"time": 1.062762975199766,
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
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.4,
										"envColorSet": false
									}
								},
								{
									"type": "curve",
									"name": "position.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.19469297519976614,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.5251483574967735,
											"value": 3,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.4665023907761046
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.4665023907761046
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.19469297519976614,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.216730645116172,
												"dt": -0.5298503198629724
											},
											"nextHandle": {
												"dv": 0.9,
												"dt": 0.14824532747268693
											}
										},
										{
											"time": 1.3354164888711628,
											"value": 1,
											"mode": 2
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
							"type": "emitter",
							"name": "Sand_Floor1",
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
								"instScale": 10,
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
								"emitOrientation": "Normal",
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"seedGroup": 2,
								"lifeTime": 1.5,
								"burstDelay": 0.45,
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
									10,
									0,
									0
								],
								"warmUpTime": -0.2
							},
							"x": 2.76362,
							"y": -0.67523,
							"z": 0.26608,
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.01,
							"rotationZ": 37.3,
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
								},
								{
									"type": "curve",
									"name": "position.x",
									"enabled": false,
									"keys": [
										{
											"time": 0.1424731182795699,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5456989247311828,
											"value": 3.543997192382814,
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
								"instScale": 15,
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
								"warmUpTime": -1.2,
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
									10,
									0,
									0
								]
							},
							"x": 0.95059,
							"y": -0.86167,
							"z": 0.26608,
							"scaleX": 0.9999999999999997,
							"scaleY": 0.9999999999999997,
							"scaleZ": 0.01,
							"rotationZ": -142.5,
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
							"name": "Back_Sand_Stylised2",
							"x": -0.26595,
							"y": -2.17882,
							"z": 0.3,
							"scaleX": 6.3,
							"scaleY": 7,
							"scaleZ": 0.08,
							"rotationX": -11.9,
							"rotationY": -1.2,
							"rotationZ": -43.7,
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
											"emissive": 0.5,
											"drawOrder": "100"
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
										"alpha": 0.7,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_FlatSmoke.png"
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
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											1
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
													"time": 0.977498578634677,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": -0.5337762368520101,
														"dt": 0.42926778498909995
													}
												},
												{
													"time": 1.8634251372645263,
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
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.4,
										"envColorSet": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 1.1379165683051453,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.216730645116172,
												"dt": -0.5298503198629724
											},
											"nextHandle": {
												"dv": 0.9,
												"dt": 0.14824532747268693
											}
										},
										{
											"time": 2.323429687810174,
											"value": 1,
											"mode": 2
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
				},
				{
					"type": "model",
					"name": "BodySlash",
					"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
					"enabled": false,
					"x": 2.18986,
					"y": -2.82183,
					"z": 3.16055,
					"scaleX": 0.8,
					"scaleZ": 3,
					"rotationX": -50.9,
					"rotationY": 92.4,
					"rotationZ": -25.6,
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
									"emissive": 0.1
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
								"texture": "Fx/Gradients/T_Square03.jpg"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": -0.2328444970094432,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.35297436803501125,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.4040697789595046,
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
											"time": 0.535826961441564,
											"value": 0,
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
											"time": -0.2328444970094432,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.35297436803501125,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.4040697789595046,
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
											"time": 0.535826961441564,
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
									1,
									0.5372549019607843,
									0
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.04584296972615198,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.8191049037779907,
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
											"time": 0.1493518945878961,
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
											"time": 0.43236394278066703,
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
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.79,
								"saturation": 1,
								"width": 0.12,
								"uvScaleX": 0.14,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/T_Square03.jpg",
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
									"name": "width",
									"keys": [
										{
											"time": 0.4238333563318136,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7268748760405487,
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
							"enabled": false,
							"props": {
								"REVERSE": false,
								"range": 16.67,
								"power": 20
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
						}
					]
				},
				{
					"type": "object",
					"name": "Hit",
					"x": 6.43998,
					"y": -0.8495,
					"z": 3.04166,
					"rotationZ": 20.5,
					"children": [
						{
							"type": "emitter",
							"name": "Hit_Round",
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale_rand": 0.25,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"warmUpTime": 0.3
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 7,
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
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
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
												"texture": "Fx/Alphas/T_FlatImpact01.png"
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
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/clouds.png",
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.61,
															"value": 0.01416666666666666,
															"mode": 1,
															"prevHandle": {
																"dv": 0.3775126578654911,
																"dt": -0.49657530216143814
															},
															"nextHandle": {
																"dv": 0.023114784558614043,
																"dt": 0.08500000000000008
															}
														},
														{
															"time": 0.7050000000000001,
															"value": 0.9419580650329591,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": -0.8723667347431184,
																"dt": 0.07999999999999996
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 200,
												"power": 23.48
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
													0.6980392156862745,
													0.34901960784313724
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.45,
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
												"dv": -0.03236093441864362,
												"dt": -0.49997643676805403
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.5149999999999999
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
								"warmUpTime": -0.38,
								"instRotation": [
									0,
									0,
									-30
								],
								"lifeTime": 0.2
							},
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
												"alpha": 0.15,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_05.png",
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
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6980392156862745,
													0.34901960784313724
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.45,
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
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01283176810449338,
												"dt": -0.9272305319143821
											},
											"nextHandle": {
												"dv": 0.003205378105737736,
												"dt": 0.33333240186907614
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
					"name": "Sand",
					"x": 0.15466,
					"y": 0.35399,
					"children": [
						{
							"type": "emitter",
							"name": "Sand_Floor",
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
								"instScale": 16,
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
								"warmUpTime": -1.55,
								"emitOrientation": "Normal",
								"instSpeed_rand": [
									-1,
									1,
									0
								],
								"seedGroup": 2,
								"lifeTime": 1.5,
								"burstDelay": 0.1,
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
								"burstCount": 3,
								"emitAngle": 360,
								"instSpeed": [
									0,
									2,
									-0.5
								]
							},
							"z": -0.25,
							"scaleX": 0.01,
							"scaleY": 0.01,
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
												"alpha": 0.5
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
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.6195399014805467,
												"dt": 2.975046534659357e-17
											},
											"nextHandle": {
												"dv": -1.1333333333333333,
												"dt": 0
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666663,
												"dt": -0.98
											},
											"nextHandle": {
												"dv": -0.005668855987316409,
												"dt": 0.3333287320541929
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Shockwave",
							"props": {
								"warmUpTime": -1.65,
								"emitType": "Burst",
								"instScale": 11,
								"instRotation_rand": [
									0,
									0,
									360
								]
							},
							"z": 0.1,
							"scaleX": 0.01,
							"scaleY": 0.01,
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
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "100"
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
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
																"dv": 1.41712157155829,
																"dt": -0.45256463091700333
															},
															"nextHandle": {
																"dv": -1.0333333333333334,
																"dt": 0.33171875000000084
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
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
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
												"saturation": 1,
												"width": 0.23,
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.41712157155829,
																"dt": -0.45256463091700333
															},
															"nextHandle": {
																"dv": -1.0333333333333334,
																"dt": 0.33171875000000084
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
											"value": 0.21666666666666667,
											"mode": 0,
											"prevHandle": {
												"dv": -2.090031350705387,
												"dt": -0.3895058426314596
											},
											"nextHandle": {
												"dv": 1.1,
												"dt": 0.20671875000000048
											}
										},
										{
											"time": 0.8467187500000021,
											"value": 1,
											"mode": 2
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
											0.9725490196078431,
											0.9725490196078431,
											0.9725490196078431
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Hit",
					"enabled": false,
					"x": 6.34976,
					"y": 0.64963,
					"z": 2.41858,
					"scaleX": 3.59,
					"scaleY": 2.1,
					"scaleZ": 0.52,
					"rotationX": 9.4,
					"rotationY": 12.2,
					"rotationZ": 98.6,
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
									"depthTest": "LessEqual",
									"colorMask": 15,
									"enableStencil": false,
									"alphaKill": false,
									"parallax": 0,
									"textureWrap": true,
									"emissive": 5
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
								"texture": "Fx/Alphas/T_FlatFlash.png"
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
											"time": 0.696448889097971,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.696448889097971,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.696448889097971,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.696448889097971,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.696448889097971,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.696448889097971,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.696448889097971,
											"value": 0.01416666666666666,
											"mode": 1,
											"prevHandle": {
												"dv": 0.3775126578654911,
												"dt": -0.49657530216143814
											},
											"nextHandle": {
												"dv": 0.023114784558614043,
												"dt": 0.08500000000000008
											}
										},
										{
											"time": 0.7565190825553475,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.7565190825553475,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.7565190825553475,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.7565190825553475,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.7565190825553475,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.7565190825553475,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.7565190825553475,
											"value": 0.9419580650329591,
											"mode": 1,
											"prevHandle": {
												"dv": -0.22616915345191968,
												"dt": -0.039999999999999925
											},
											"nextHandle": {
												"dv": -0.6883794651925124,
												"dt": 0.022481199434944754
											}
										},
										{
											"time": 0.8255268478458876,
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
								"sandColorSet": false,
								"envBlend": 0.3,
								"envColorSet": false
							}
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 200,
								"power": 23.48
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
									0.6980392156862745,
									0.34901960784313724
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.9142577432284057,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.9793352797813522,
											"value": 0.2,
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
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									1,
									0.13333333333333333,
									0
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.7405599958481339,
											"value": 0.9,
											"mode": 0,
											"prevHandle": {
												"dv": -0.8165024079564438,
												"dt": -0.49978387723217654
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.02040344573643249
											}
										},
										{
											"time": 0.7708261616990757,
											"value": 0.5333333333333333,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.6585098195459438,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6585098195459438,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6585098195459438,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6585098195459438,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6585098195459438,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6585098195459438,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6585098195459438,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": -5.1929172557584735,
										"dt": -0.27727380087695946
									},
									"nextHandle": {
										"dv": 4.550322954356672,
										"dt": 0.24499999999999988
									}
								},
								{
									"time": 1.1359097780756169,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.1359097780756169,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.1359097780756169,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.1359097780756169,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.1359097780756169,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.1359097780756169,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.1359097780756169,
									"value": 5,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Slash",
					"x": 2.87042,
					"y": -0.56938,
					"z": 3.07851,
					"scaleX": 4,
					"scaleY": 3.31,
					"scaleZ": 4,
					"rotationX": 176.6,
					"rotationY": 13.4,
					"rotationZ": 50.1,
					"kind": 1,
					"args": [
						24,
						230,
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
								"scale": 0.75
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
											"time": 0.44116382405180654,
											"value": -2.425986213684083,
											"mode": 2
										},
										{
											"time": 1.3493661728905508,
											"value": 1.067704238891602,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.5599999999999999
											},
											"nextHandle": {
												"dv": -9.460471999616726e-16,
												"dt": 0.3316719842180907
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
											"time": 0.348305209992658,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.04818175693045633,
												"dt": -0.49954845585497076
											},
											"nextHandle": {
												"dv": -0.03472222222222221,
												"dt": 0.36
											}
										},
										{
											"time": 0.7497333149135708,
											"value": 1.0416666666666667,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9895833333333335,
												"dt": -0.04999999999999993
											},
											"nextHandle": {
												"dv": -1.0069444444444446,
												"dt": 0.05500000000000005
											}
										},
										{
											"time": 1.4820149871434531,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.04715950531536345,
												"dt": -0.6125145314162203
											},
											"nextHandle": {
												"dv": -0.04715950531536345,
												"dt": 0.6125145314162203
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
									0.6980392156862745,
									0.34901960784313724
								]
							}
						}
					]
				},
				{
					"type": "emitter",
					"name": "Sand_Floor",
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
						"instScale": 25,
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
						"lifeTimeRand": 0.3,
						"alignMode": "Screen",
						"warmUpTime": -0.7,
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"seedGroup": 2,
						"lifeTime": 1.5,
						"burstDelay": 0.5,
						"instSpeed": [
							50,
							0,
							0
						]
					},
					"x": 3.97293,
					"y": 1.01459,
					"scaleX": 0.9999999999999999,
					"scaleY": 0.9999999999999999,
					"scaleZ": 0.01,
					"rotationZ": 27.9,
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
										"range": 5,
										"power": 0.8
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
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.5,
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
										"dv": 1.6195399014805467,
										"dt": 2.975046534659357e-17
									},
									"nextHandle": {
										"dv": -1.1333333333333333,
										"dt": 0
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.016666666666666663,
										"dt": -0.98
									},
									"nextHandle": {
										"dv": -0.005668855987316409,
										"dt": 0.3333287320541929
									}
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Slash2",
					"x": 0.75426,
					"y": -0.49827,
					"z": 3.50793,
					"scaleX": 4,
					"scaleY": 4,
					"scaleZ": 4,
					"rotationZ": -126.8,
					"kind": 1,
					"args": [
						24,
						332.73,
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
								"alpha": 0.2,
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
											"time": 0.9708275200324616,
											"value": -2.425986213684083,
											"mode": 2
										},
										{
											"time": 1.879029868871206,
											"value": 1.067704238891602,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.5599999999999999
											},
											"nextHandle": {
												"dv": -9.460471999616726e-16,
												"dt": 0.3316719842180907
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
											"time": 0.8779689059733131,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.04818175693045633,
												"dt": -0.49954845585497076
											},
											"nextHandle": {
												"dv": -0.03472222222222221,
												"dt": 0.36
											}
										},
										{
											"time": 1.2793970108942259,
											"value": 1.0416666666666667,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9895833333333335,
												"dt": -0.04999999999999993
											},
											"nextHandle": {
												"dv": -1.0069444444444446,
												"dt": 0.05500000000000005
											}
										},
										{
											"time": 2.0116786831241082,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.04715950531536345,
												"dt": -0.6125145314162203
											},
											"nextHandle": {
												"dv": -0.04715950531536345,
												"dt": 0.6125145314162203
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
									0.6980392156862745,
									0.34901960784313724
								]
							}
						}
					]
				},
				{
					"type": "polygon",
					"name": "SlashFoot",
					"x": 1.24892,
					"y": -1.07259,
					"z": 0.19498,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"rotationZ": 34.6,
					"kind": 1,
					"args": [
						24,
						316.36,
						0.24,
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
							"diffuseMap": "Fx/Alphas/T_Dust_02.png"
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
								"alpha": 5,
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
									1,
									1,
									1
								]
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
											"time": 0.9907087039543934,
											"value": -0.3297719421386718,
											"mode": 0,
											"prevHandle": {
												"dv": 0.13258465162870775,
												"dt": -0.49999565977873545
											},
											"nextHandle": {
												"dv": -0.058228174209594696,
												"dt": 0.21958676229862867
											}
										},
										{
											"time": 1.3907087039543935,
											"value": 1.067704238891602,
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
											"time": 0.9907087039543934,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0.12898350993794783,
												"dt": -0.4998174849364267
											},
											"nextHandle": {
												"dv": 0.02907755692715791,
												"dt": 0.12119947235397059
											}
										},
										{
											"time": 1.2047087039543933,
											"value": 1.0416666666666667,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9895833333333335,
												"dt": -0.04999999999999993
											},
											"nextHandle": {
												"dv": -0.18081948388205515,
												"dt": 0.09525853852892269
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
								"envBlend": 0.4,
								"envColorSet": false
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
								"progress": 1,
								"saturation": 0.5,
								"width": 0.64,
								"uvScaleX": 1,
								"uvScaleY": 0.25,
								"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
											"time": 0.7907087039543934,
											"value": 0.8948601617813111,
											"mode": 1,
											"prevHandle": {
												"dv": -0.22616915345191968,
												"dt": -0.039999999999999925
											},
											"nextHandle": {
												"dv": -0.5337762368520101,
												"dt": 0.42926778498909995
											}
										},
										{
											"time": 1.6714087039543934,
											"value": 0,
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