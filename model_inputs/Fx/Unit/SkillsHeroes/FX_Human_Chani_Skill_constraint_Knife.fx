{
	"type": "fx",
	"duration": 50,
	"cullingRadius": 25,
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
			"name": "FXRoot_",
			"enabled": false,
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
									"animation": "Anim/Female01/Chani/Anim_Female01_Chani_Skill.fbx"
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
					"x": -0.77683,
					"children": [
						{
							"type": "polygon",
							"name": "Back_Sand_Stylised1",
							"enabled": false,
							"x": 3.94,
							"y": -0.69341,
							"z": 0.3,
							"scaleX": 5,
							"scaleY": 5.56,
							"scaleZ": 0.06,
							"rotationX": -12,
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
													"time": 0.15587495340213842,
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
													"time": 1.1558749534021384,
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
											"time": 0.15587495340213842,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4863303356991457,
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
											"time": 0.15587495340213842,
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
											"time": 1.296598467073535,
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
								"warmUpTime": -0.15
							},
							"x": 1.05882,
							"y": -0.72235,
							"z": 0.26608,
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.01,
							"rotationZ": 2.0999999999999996,
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
								"warmUpTime": -1.3,
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
									4,
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
								"warmUpTime": -1.4,
								"emitType": "Burst",
								"instScale": 15,
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
						},
						{
							"type": "polygon",
							"name": "Round_Sand_Stylised",
							"x": 0.05907,
							"y": -0.02716,
							"z": 0.07087,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 0.2,
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
													"time": 1.4024266162654615,
													"value": 0.8948601617813111,
													"mode": 1
												},
												{
													"time": 1.4024266162654615,
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
													"time": 2.2286287620677436,
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
											"time": 1.4539640535773874,
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
											"time": 1.4882381370677433,
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
											"time": 2.3572127464427473,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "HeatWave_Distort",
							"props": {
								"emitRate": 2,
								"useRandomColor": true,
								"randomColor1": [
									1,
									1,
									1,
									0.8313725490196078
								],
								"randomColor2": [
									0.9019607843137255,
									0.9019607843137255,
									0.9019607843137255,
									0.7294117647058823
								],
								"instScale": 20,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 0,
								"warmUpTime": -1.4,
								"emitType": "Burst",
								"lifeTime": 0.75,
								"burstDelay": 0.55
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
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual"
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
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0058489084243771305,
																"dt": -0.06672153635116596
															},
															"nextHandle": {
																"dv": 0.0058489084243771305,
																"dt": 0.06672153635116596
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
												"sandColorSet": false,
												"envBlend": 0.2,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 0.016
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"enabled": false,
									"keyMode": 1,
									"keys": [
										{
											"time": -0.008955438443594144,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.199261029354163,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 3.140094610862653,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 5.952119635515775,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
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
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9944446984687934,
												"dt": -0.48890120703870477
											},
											"nextHandle": {
												"dv": 0.7,
												"dt": 0.3425225781956737
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
						}
					]
				},
				{
					"type": "polygon",
					"name": "Slash",
					"enabled": false,
					"x": 0.10794,
					"y": 0.19883,
					"z": 4.27191,
					"scaleX": 4,
					"scaleY": 4,
					"scaleZ": 4,
					"rotationX": 41.9,
					"rotationY": 12.7,
					"rotationZ": 56.6,
					"kind": 1,
					"args": [
						24,
						200,
						0.7,
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
									"emissive": 0.5
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
											"time": 1.093919936460973,
											"value": -2.425986213684083,
											"mode": 2
										},
										{
											"time": 2.002122285299717,
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
											"time": 1.0010613224018245,
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
											"time": 1.4024894273227373,
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
											"time": 2.1347710995526197,
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
					"type": "advancedDecal",
					"name": "advancedDecal_White",
					"x": 0.13392,
					"y": 0.26468,
					"z": 4.72838,
					"scaleX": 9,
					"scaleY": 9,
					"scaleZ": 6.67,
					"rotationX": -98.3,
					"rotationY": 90,
					"albedoMap": "Fx/Gradients/circGrad05.jpg",
					"fadePower": 3,
					"emissive": 2,
					"renderMode": "BeforeTonemapping",
					"blendMode": 2,
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 2
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"enabled": false,
									"keys": [
										{
											"time": 0.5520793409435041,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5870702850878107,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7114825309342341,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.7853523019055481,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9369797265308766,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9991858494540883,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4074135311376652,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0.5520793409435041,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5870702850878107,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.7114825309342341,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.7853523019055481,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9369797265308766,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9991858494540883,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4074135311376652,
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
								"envBlend": 0.6,
								"envColorSet": false
							}
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.9450980392156862,
									0.3058823529411765,
									0.16078431372549018
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 1.1300033629211388,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.00978182452443758
											},
											"nextHandle": {
												"dv": -0.03417340777450917,
												"dt": 0.09904221378551759
											}
										},
										{
											"time": 1.2350481351179,
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
								"amount": 0.7,
								"color": [
									0.9882352941176471,
									0.5176470588235293,
									0.2
								]
							}
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal_Black",
					"x": 0.13392,
					"y": 0.26468,
					"z": 4.72838,
					"scaleX": 9,
					"scaleY": 9,
					"scaleZ": 6.67,
					"rotationX": -98.3,
					"rotationY": 90,
					"albedoMap": "Fx/Gradients/circGrad05.jpg",
					"fadePower": 3,
					"emissive": 2,
					"renderMode": "BeforeTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 2
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"enabled": false,
									"keys": [
										{
											"time": 0.5830157575889151,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6935125705754571,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7035125705754571,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0.5177277168813407,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6252838270785206,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.6935125705754571,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7035125705754571,
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
								"envBlend": 0.6,
								"envColorSet": false
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
						}
					]
				},
				{
					"type": "emitter",
					"name": "emitter_Flare",
					"props": {
						"lifeTime": 0.2,
						"alignMode": "Screen",
						"alignLockAxis": "Z",
						"burstDelay": 0.5,
						"instStretch": [
							18,
							4,
							1
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
						"instScale_rand": 0,
						"useRandomColor": true,
						"randomColor1": [
							0.48627450980392156,
							0.48627450980392156,
							0.48627450980392156,
							1
						],
						"warmUpTime": -0.55,
						"emitType": "Burst",
						"instScale": 2.3,
						"simulationSpace": "World"
					},
					"x": -0.33803,
					"y": 0.39259,
					"z": 5.14319,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"rotationX": 45,
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
											"emissive": 6,
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare06_512.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.006831217655519195,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06196351517869349,
														"dt": -0.49990757001492336
													},
													"nextHandle": {
														"dv": -0.01666666666666672,
														"dt": 0.13446288206139395
													}
												},
												{
													"time": 0.18783894350739566,
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
							"name": "instScale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.006831217655519195,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 1.2334981930436706,
										"dt": -0.4276798037244547
									},
									"nextHandle": {
										"dv": -0.7166666666666667,
										"dt": 0.24848342791614272
									}
								},
								{
									"time": 1.0068312176555192,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5240317437099238
									},
									"nextHandle": {
										"dv": -3.8880269028916045e-16,
										"dt": 0.3333333333333333
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
									"time": 0.006831217655519195,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 1.2334981930436706,
										"dt": -0.4276798037244547
									},
									"nextHandle": {
										"dv": -0.7166666666666667,
										"dt": 0.24848342791614272
									}
								},
								{
									"time": 1.0068312176555192,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5240317437099238
									},
									"nextHandle": {
										"dv": -3.8880269028916045e-16,
										"dt": 0.3333333333333333
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "emitter_Flare2",
					"props": {
						"alignMode": "Screen",
						"alignLockAxis": "Z",
						"burstDelay": 0.5,
						"instStretch": [
							18,
							4,
							1
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
						"instScale_rand": 0,
						"useRandomColor": true,
						"randomColor1": [
							0.48627450980392156,
							0.48627450980392156,
							0.48627450980392156,
							1
						],
						"warmUpTime": -0.7,
						"emitType": "Burst",
						"instScale": 2.65,
						"simulationSpace": "World",
						"lifeTime": 0.8
					},
					"x": -0.33803,
					"y": 0.39259,
					"z": 5.14319,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"rotationX": 45,
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
											"emissive": 6,
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare06_512.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.006831217655519195,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06196351517869349,
														"dt": -0.49990757001492336
													},
													"nextHandle": {
														"dv": -0.01666666666666672,
														"dt": 0.13446288206139395
													}
												},
												{
													"time": 0.18783894350739566,
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
											0.9019607843137255,
											0.6745098039215687
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
									"time": 0.006831217655519195,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 1.2334981930436706,
										"dt": -0.4276798037244547
									},
									"nextHandle": {
										"dv": -0.7166666666666667,
										"dt": 0.24848342791614272
									}
								},
								{
									"time": 1.0068312176555192,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5240317437099238
									},
									"nextHandle": {
										"dv": -3.8880269028916045e-16,
										"dt": 0.3333333333333333
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
									"time": 0.006831217655519195,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 1.2334981930436706,
										"dt": -0.4276798037244547
									},
									"nextHandle": {
										"dv": -0.7166666666666667,
										"dt": 0.24848342791614272
									}
								},
								{
									"time": 1.0068312176555192,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5240317437099238
									},
									"nextHandle": {
										"dv": -3.8880269028916045e-16,
										"dt": 0.3333333333333333
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "LegSlashes",
					"z": 4.05034,
					"children": [
						{
							"type": "polygon",
							"name": "Slash",
							"x": 0.01446,
							"y": 0.27708,
							"z": -0.06071,
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 4,
							"rotationX": -97.7,
							"rotationY": -23.9,
							"rotationZ": 1,
							"kind": 1,
							"args": [
								24,
								360,
								0.7,
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
											"emissive": 0.1
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
													"time": 0.057782268758774125,
													"value": -2.425986213684083,
													"mode": 2
												},
												{
													"time": 0.9659846175975182,
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
													"time": -0.0350763453003744,
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
													"time": 0.36635175962053834,
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
													"time": 1.0986334318504207,
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
											0.5372549019607843,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.12549019607843137,
											0.10588235294117647,
											0.10196078431372549
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "Slash",
							"x": -0.04385,
							"y": -0.2933,
							"z": -0.09378,
							"scaleX": 3.5,
							"scaleY": 3.5,
							"scaleZ": 3.5,
							"rotationX": -93.6,
							"rotationY": -156.5,
							"rotationZ": -4.4,
							"kind": 1,
							"args": [
								24,
								360,
								0.7,
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
											"emissive": 0.1
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
													"time": 0.13893280311586076,
													"value": -2.425986213684083,
													"mode": 2
												},
												{
													"time": 1.1353358644307199,
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
													"time": 0.046074189056712234,
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
													"time": 0.447502293977625,
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
													"time": 1.2679846786836224,
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
						}
					]
				},
				{
					"type": "object",
					"name": "Test1",
					"enabled": false,
					"z": 2,
					"children": [
						{
							"type": "model",
							"name": "Elec02",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"scaleX": 25,
							"scaleY": 25,
							"scaleZ": 25,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.22,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -0.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -0.25,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/causticTexture_02.png",
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
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.8,
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
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.9017386631089813
											},
											"nextHandle": {
												"dv": -5.262223968825359e-16,
												"dt": 0.33333337795849743
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Elec01",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 40,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6961594238522388,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.338779040139722,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
							"type": "model",
							"name": "Elec01",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 40,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6961594238522388,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.338779040139722,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
							"type": "model",
							"name": "Elec01",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 40,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.3,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 4,
										"uvScaleY": 0.52,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 2,
										"uvScaleY": 0.52,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6961594238522388,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.338779040139722,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
							"type": "model",
							"name": "Elec01",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 40,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 1.5,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_ElecNoise01.png",
										"uvShift": [
											0.2,
											0.5
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6858265812211217,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6858265812211217,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3233441566922783,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6807245404047952,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.3233441566922783,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
							"type": "model",
							"name": "Elec01",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 50,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 1.5,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.39,
										"saturation": 1,
										"width": 0.87,
										"uvScaleX": 4,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_ElecNoise01.png",
										"uvShift": [
											0.2,
											0.5
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6858265812211217,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6858265812211217,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3233441566922783,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6807245404047952,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.3233441566922783,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
							"type": "model",
							"name": "Elec01_diskflat",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 50,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6858265812211217,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6858265812211217,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3233441566922783,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6807245404047952,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.3233441566922783,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
							"type": "model",
							"name": "Distort",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 4.440892098500626e-16,
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 50,
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
											"drawOrder": "100"
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
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl05u_A.jpg"
									},
									"children": [
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
														"dv": 0.621153878782194,
														"dt": -0.2638029215363347
													},
													"nextHandle": {
														"dv": -0.6006642925019023,
														"dt": 0.2551010315434577
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.1780383365763439,
														"dt": -0.2244928641078885
													},
													"nextHandle": {
														"dv": -0.1780383365763439,
														"dt": 0.2244928641078885
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/perlin1_normal.png",
										"intensity": 0.008
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 5.103123290706821e-16,
														"dt": -0.26511369565981946
													},
													"nextHandle": {
														"dv": -5.103123290706821e-16,
														"dt": 0.26511369565981946
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.7884382817024209,
														"dt": -0.1945077643364994
													},
													"nextHandle": {
														"dv": -0.8968346079007454,
														"dt": 0.22001651997211888
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
										"scaleX": 1.5,
										"scaleY": 0.1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.41666666666666663,
														"dt": -0.3299319727891157
													},
													"nextHandle": {
														"dv": 0.4076409317911878,
														"dt": 0.3227850643571037
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9766249433119758,
												"dt": -0.44452532726087984
											},
											"nextHandle": {
												"dv": 0.5272562299874135,
												"dt": 0.23972617192642579
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.019410109490492156,
												"dt": -0.4824094015224898
											},
											"nextHandle": {
												"dv": -0.012930935386583117,
												"dt": 0.3333280582004723
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emittermult_smallFlare",
							"enabled": false,
							"props": {
								"lifeTime": 0.2,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.1,
								"instScale": 3,
								"instStretch": [
									35,
									4,
									1
								],
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									7,
									1,
									0
								],
								"instScale_rand": 1,
								"useRandomColor": true,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -0.7,
								"emitDuration": 1.3,
								"emitType": "Burst",
								"emitRateMin": 1,
								"burstCount": 2
							},
							"y": 0.70214,
							"z": 2.96381,
							"scaleX": 0.04000000000000001,
							"scaleY": 0.04000000000000001,
							"scaleZ": 0.04000000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"rotationX": 45,
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
													"emissive": 2,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											},
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
																"dv": 0.06196351517869349,
																"dt": -0.49990757001492336
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.13446288206139395
															}
														},
														{
															"time": 0.18100772585187647,
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
													0.7058823529411764,
													0.8,
													1
												]
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
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.1,
												"useRGB": false
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.14303557524986288,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06580133413269795,
												"dt": -0.09828118103147843
											},
											"nextHandle": {
												"dv": 0.06580133413269795,
												"dt": 0.09828118103147843
											}
										},
										{
											"time": 0.1530355752498629,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.1853801159797381,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2611018447946896,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6460551022810885,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.159840378481288,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
							"name": "polygon-flareish",
							"z": 2.9475300000000004,
							"scaleX": 35.349953618413004,
							"scaleY": 35.349953618413004,
							"scaleZ": 35.349953618413004,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_04.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/circGrad3.jpg",
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
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2956274792407012,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6805807367271002,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.9310971472661906,
												"dt": -0.17120587028031628
											},
											"nextHandle": {
												"dv": 0.794995631561622,
												"dt": 0.07238914098793658
											}
										},
										{
											"time": 1.1943660129272997,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
							"name": "polygon",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.1853801159797381,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2611018447946896,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6460551022810885,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.159840378481288,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
							"name": "polygon",
							"z": 2.94753,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.1853801159797381,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2611018447946896,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6460551022810885,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.159840378481288,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
											0.7803921568627451,
											0.5176470588235293
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6987730175371683,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3413926338246513,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6987730175371683,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3413926338246513,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6987730175371683,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.2225193441106792,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.6987730175371683,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2982410729256306,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7038750583534947,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3413926338246513,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7038750583534947,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3413926338246513,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6831943304120296,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.1969796066122291,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
											0.7803921568627451,
											0.5176470588235293
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 25,
							"scaleY": 25,
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
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.526408387826014,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.169028004113497,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.526408387826014,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.169028004113497,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.526408387826014,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.050154714399525,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.526408387826014,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.1258764432144763,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5315104286423404,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.169028004113497,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5315104286423404,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.169028004113497,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.5108297007008753,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.0246149769010748,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
							"name": "emittermult_smallFlare",
							"props": {
								"lifeTime": 0.2,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.1,
								"instScale": 5,
								"instStretch": [
									35,
									4,
									1
								],
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									7,
									1,
									0
								],
								"instScale_rand": 1,
								"useRandomColor": true,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -0.7,
								"emitDuration": 1.3,
								"emitType": "Burst",
								"emitRateMin": 1
							},
							"y": 0.70214,
							"z": 2.96381,
							"scaleX": 0.04000000000000001,
							"scaleY": 0.04000000000000001,
							"scaleZ": 0.04000000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"rotationX": 45,
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
													"emissive": 2,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											},
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
																"dv": 0.06196351517869349,
																"dt": -0.49990757001492336
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.13446288206139395
															}
														},
														{
															"time": 0.18100772585187647,
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
													0.7058823529411764,
													0.8,
													1
												]
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
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.1,
												"useRGB": false
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.14303557524986288,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06580133413269795,
												"dt": -0.09828118103147843
											},
											"nextHandle": {
												"dv": 0.06580133413269795,
												"dt": 0.09828118103147843
											}
										},
										{
											"time": 0.1530355752498629,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlareColored_side",
							"props": {
								"alignMode": "Axis",
								"alignLockAxis": "Z",
								"burstDelay": 0.05,
								"instScale": 10,
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
								"instScale_rand": 0,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"emitType": "Burst",
								"instRotation": [
									-45,
									0,
									0
								],
								"lifeTime": 0.7,
								"warmUpTime": -0.6
							},
							"z": 1.77099,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
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
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/T_circleGradient_color04.png"
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
												"texture": "Fx/Alphas/T_Boquet_straight_circle02.png"
											},
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
																"dv": 0.13831140421273472,
																"dt": -0.4997534846094124
															},
															"nextHandle": {
																"dv": -0.016666666666666663,
																"dt": 0.061224489795918366
															}
														},
														{
															"time": 0.07312925170068027,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9994830486111846,
															"value": 0,
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
												"range": 3,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.7,
												"color": [
													1,
													0.6980392156862745,
													0.34901960784313724
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.95,
											"mode": 0,
											"prevHandle": {
												"dv": -0.24752260216006414,
												"dt": -0.4084304599834715
											},
											"nextHandle": {
												"dv": 0.07502654127000485,
												"dt": 0.12414965986394558
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.7589285714285714
											},
											"nextHandle": {
												"dv": -1.0668034339239163e-16,
												"dt": 0.3333333333333333
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
					"name": "Test1",
					"enabled": false,
					"z": 2,
					"children": [
						{
							"type": "model",
							"name": "Elec01",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 40,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6961594238522388,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.338779040139722,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
							"name": "polygon-flareish",
							"z": 2.9475300000000004,
							"scaleX": 35.349953618413004,
							"scaleY": 35.349953618413004,
							"scaleZ": 35.349953618413004,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_04.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/circGrad3.jpg",
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
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2956274792407012,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6805807367271002,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.9310971472661906,
												"dt": -0.17120587028031628
											},
											"nextHandle": {
												"dv": 0.794995631561622,
												"dt": 0.07238914098793658
											}
										},
										{
											"time": 1.1943660129272997,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
							"name": "polygon",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.1853801159797381,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2611018447946896,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6460551022810885,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.159840378481288,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
							"name": "polygon",
							"z": 2.94753,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.1853801159797381,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2611018447946896,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6460551022810885,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.159840378481288,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
											0.7803921568627451,
											0.5176470588235293
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6987730175371683,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3413926338246513,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6987730175371683,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3413926338246513,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6987730175371683,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.2225193441106792,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.6987730175371683,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2982410729256306,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7038750583534947,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3413926338246513,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7038750583534947,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3413926338246513,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6831943304120296,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.1969796066122291,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
											0.7803921568627451,
											0.5176470588235293
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 25,
							"scaleY": 25,
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
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.526408387826014,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.169028004113497,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.526408387826014,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.169028004113497,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.526408387826014,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.050154714399525,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.526408387826014,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.1258764432144763,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5315104286423404,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.169028004113497,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5315104286423404,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.169028004113497,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.5108297007008753,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.0246149769010748,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
							"name": "emittermult_smallFlare",
							"props": {
								"lifeTime": 0.2,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.1,
								"instScale": 5,
								"instStretch": [
									35,
									4,
									1
								],
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									7,
									1,
									0
								],
								"instScale_rand": 1,
								"useRandomColor": true,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -0.7,
								"emitDuration": 1.3,
								"emitType": "Burst",
								"emitRateMin": 1
							},
							"y": 0.70214,
							"z": 2.96381,
							"scaleX": 0.04000000000000001,
							"scaleY": 0.04000000000000001,
							"scaleZ": 0.04000000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"rotationX": 45,
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
													"emissive": 2,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											},
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
																"dv": 0.06196351517869349,
																"dt": -0.49990757001492336
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.13446288206139395
															}
														},
														{
															"time": 0.18100772585187647,
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
													0.7058823529411764,
													0.8,
													1
												]
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
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.1,
												"useRGB": false
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.14303557524986288,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06580133413269795,
												"dt": -0.09828118103147843
											},
											"nextHandle": {
												"dv": 0.06580133413269795,
												"dt": 0.09828118103147843
											}
										},
										{
											"time": 0.1530355752498629,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlareColored_side",
							"props": {
								"alignMode": "Axis",
								"alignLockAxis": "Z",
								"burstDelay": 0.05,
								"instScale": 10,
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
								"instScale_rand": 0,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"emitType": "Burst",
								"instRotation": [
									-45,
									0,
									0
								],
								"lifeTime": 0.7,
								"warmUpTime": -0.6
							},
							"z": 1.77099,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
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
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/T_circleGradient_color04.png"
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
												"texture": "Fx/Alphas/T_Boquet_straight_circle02.png"
											},
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
																"dv": 0.13831140421273472,
																"dt": -0.4997534846094124
															},
															"nextHandle": {
																"dv": -0.016666666666666663,
																"dt": 0.061224489795918366
															}
														},
														{
															"time": 0.07312925170068027,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9994830486111846,
															"value": 0,
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
												"range": 3,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.7,
												"color": [
													1,
													0.6980392156862745,
													0.34901960784313724
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.95,
											"mode": 0,
											"prevHandle": {
												"dv": -0.24752260216006414,
												"dt": -0.4084304599834715
											},
											"nextHandle": {
												"dv": 0.07502654127000485,
												"dt": 0.12414965986394558
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.7589285714285714
											},
											"nextHandle": {
												"dv": -1.0668034339239163e-16,
												"dt": 0.3333333333333333
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
					"name": "Test1_in",
					"z": 2,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"x": -1.50134,
							"y": -0.0125,
							"z": 2.76405,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon-flareish",
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 12,
									"rotationY": -90,
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
													"emissive": 0.5
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SandDecal_04.png"
											}
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
												"progress": 0.2,
												"saturation": 0,
												"width": 0.87,
												"uvScaleX": 3,
												"uvScaleY": 2,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.1,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "uvShift.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.7265578049970838,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3691774212845669,
															"value": -1.5,
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
												},
												{
													"type": "curve",
													"name": "uvShift.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.7265578049970838,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3691774212845669,
															"value": -0.2,
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
											"type": "shader",
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16497480
															},
															{
																"position": 1,
																"color": -11796593
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
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/circGrad3.jpg",
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
													"keys": [
														{
															"time": 0.7265578049970838,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1.3260258603855462,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.022038754522800685,
																"dt": -0.5572482360285976
															},
															"nextHandle": {
																"dv": -0.022038754522800685,
																"dt": 0.5572482360285976
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
											"enabled": false,
											"props": {
												"UVScale": [
													1,
													1
												],
												"alpha": 1,
												"MULTIPLY": false,
												"color": [
													0.9882352941176471,
													0.7215686274509804,
													0.7215686274509804,
													1
												],
												"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
												"UVOffset": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "UVOffset.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.7316598458134103,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.012729939792370531,
																"dt": -0.4997277490954342
															},
															"nextHandle": {
																"dv": 0.012729939792370531,
																"dt": 0.4997277490954342
															}
														},
														{
															"time": 1.3691774212845669,
															"value": -0.2,
															"mode": 0,
															"prevHandle": {
																"dv": 0.2114895579596871,
																"dt": -0.24046024932459553
															},
															"nextHandle": {
																"dv": -0.2114895579596871,
																"dt": 0.24046024932459553
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "UVOffset.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.7316598458134103,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.012729939792370531,
																"dt": -0.4997277490954342
															},
															"nextHandle": {
																"dv": 0.012729939792370531,
																"dt": 0.4997277490954342
															}
														},
														{
															"time": 1.3691774212845669,
															"value": -0.1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.11272993979237053,
																"dt": -0.2373701018182972
															},
															"nextHandle": {
																"dv": -0.11615584673418546,
																"dt": 0.24369115451363124
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"enabled": false,
											"props": {
												"threshold": 0.02,
												"useRGB": false
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7109791178719451,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.9310971472661906,
														"dt": -0.17120587028031628
													},
													"nextHandle": {
														"dv": 0.794995631561622,
														"dt": 0.07238914098793658
													}
												},
												{
													"time": 1.2247643940721447,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0683347894794597,
														"dt": -0.4378116347358676
													},
													"nextHandle": {
														"dv": -0.05190948879585082,
														"dt": 0.3333275426476711
													}
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
										},
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
						},
						{
							"type": "polygon",
							"name": "polygon-flareish",
							"enabled": false,
							"z": 2.9475300000000004,
							"scaleX": 35.349953618413004,
							"scaleY": 35.349953618413004,
							"scaleZ": 35.349953618413004,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_04.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/circGrad3.jpg",
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
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2956274792407012,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6805807367271002,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.9310971472661906,
												"dt": -0.17120587028031628
											},
											"nextHandle": {
												"dv": 0.794995631561622,
												"dt": 0.07238914098793658
											}
										},
										{
											"time": 1.1943660129272997,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
							"name": "polygon",
							"z": 2.94753,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.6359627329192546,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7158385093167702,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.1853801159797381,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "MaskColorAlpha",
									"source": "hrt.shader.MaskColorAlpha",
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6460551022810885,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.0873228572081564,
												"dt": -0.16353225177780503
											},
											"nextHandle": {
												"dv": -0.721697023362597,
												"dt": 0.05699589854366105
											}
										},
										{
											"time": 1.159840378481288,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
											0.7803921568627451,
											0.5176470588235293
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "emittermult_smallFlare",
							"props": {
								"lifeTime": 0.2,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.1,
								"instScale": 5,
								"instStretch": [
									35,
									4,
									1
								],
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									7,
									1,
									0
								],
								"instScale_rand": 1,
								"useRandomColor": true,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -0.7,
								"emitDuration": 1.3,
								"emitType": "Burst",
								"emitRateMin": 1
							},
							"y": 0.70214,
							"z": 2.96381,
							"scaleX": 0.04000000000000001,
							"scaleY": 0.04000000000000001,
							"scaleZ": 0.04000000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"rotationX": 45,
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
													"emissive": 2,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											},
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
																"dv": 0.06196351517869349,
																"dt": -0.49990757001492336
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.13446288206139395
															}
														},
														{
															"time": 0.18100772585187647,
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
													0.7058823529411764,
													0.8,
													1
												]
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
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.1,
												"useRGB": false
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.14303557524986288,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06580133413269795,
												"dt": -0.09828118103147843
											},
											"nextHandle": {
												"dv": 0.06580133413269795,
												"dt": 0.09828118103147843
											}
										},
										{
											"time": 0.1530355752498629,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlareColored_side",
							"enabled": false,
							"props": {
								"alignMode": "Axis",
								"alignLockAxis": "Z",
								"burstDelay": 0.05,
								"instScale": 15,
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
								"instScale_rand": 0,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"emitType": "Burst",
								"instRotation": [
									-45,
									0,
									0
								],
								"lifeTime": 0.1,
								"warmUpTime": -0.7
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
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
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/T_circleGradient_color04.png"
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
												"texture": "Fx/Alphas/T_Boquet_straight_circle02.png"
											},
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
																"dv": 0.13831140421273472,
																"dt": -0.4997534846094124
															},
															"nextHandle": {
																"dv": -0.016666666666666663,
																"dt": 0.061224489795918366
															}
														},
														{
															"time": 0.07312925170068027,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9994830486111846,
															"value": 0,
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
												"range": 3,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.7,
												"color": [
													1,
													0.6980392156862745,
													0.34901960784313724
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.95,
											"mode": 0,
											"prevHandle": {
												"dv": -0.24752260216006414,
												"dt": -0.4084304599834715
											},
											"nextHandle": {
												"dv": 0.07502654127000485,
												"dt": 0.12414965986394558
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.7589285714285714
											},
											"nextHandle": {
												"dv": -1.0668034339239163e-16,
												"dt": 0.3333333333333333
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlareColored_side",
							"props": {
								"alignMode": "Axis",
								"alignLockAxis": "Z",
								"burstDelay": 0.05,
								"instScale": 10,
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
								"instScale_rand": 0,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"emitType": "Burst",
								"instRotation": [
									-45,
									0,
									0
								],
								"lifeTime": 0.7,
								"warmUpTime": -0.6
							},
							"z": 1.77099,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
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
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/T_circleGradient_color04.png"
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
												"texture": "Fx/Alphas/T_Boquet_straight_circle02.png"
											},
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
																"dv": 0.13831140421273472,
																"dt": -0.4997534846094124
															},
															"nextHandle": {
																"dv": -0.016666666666666663,
																"dt": 0.061224489795918366
															}
														},
														{
															"time": 0.07312925170068027,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9994830486111846,
															"value": 0,
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
												"range": 3,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.7,
												"color": [
													1,
													0.6980392156862745,
													0.34901960784313724
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.95,
											"mode": 0,
											"prevHandle": {
												"dv": -0.24752260216006414,
												"dt": -0.4084304599834715
											},
											"nextHandle": {
												"dv": 0.07502654127000485,
												"dt": 0.12414965986394558
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.7589285714285714
											},
											"nextHandle": {
												"dv": -1.0668034339239163e-16,
												"dt": 0.3333333333333333
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Elec01",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 40,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6961594238522388,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.338779040139722,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
						}
					]
				},
				{
					"type": "object",
					"name": "Test3",
					"enabled": false,
					"z": 2,
					"children": [
						{
							"type": "model",
							"name": "Elec02",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"scaleX": 25,
							"scaleY": 25,
							"scaleZ": 25,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.22,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -0.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -0.25,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/causticTexture_02.png",
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
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.8,
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
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.9017386631089813
											},
											"nextHandle": {
												"dv": -5.262223968825359e-16,
												"dt": 0.33333337795849743
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Elec01",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 40,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6961594238522388,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.338779040139722,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
							"type": "model",
							"name": "Elec01",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 40,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6961594238522388,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.338779040139722,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
							"type": "model",
							"name": "Elec01",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 40,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.3,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 4,
										"uvScaleY": 0.52,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 2,
										"uvScaleY": 0.52,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6961594238522388,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.338779040139722,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
							"type": "model",
							"name": "Elec01",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 40,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 1.5,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_ElecNoise01.png",
										"uvShift": [
											0.2,
											0.5
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6858265812211217,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6858265812211217,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3233441566922783,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6807245404047952,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.3233441566922783,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
							"type": "model",
							"name": "Elec01",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 50,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 1.5,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.39,
										"saturation": 1,
										"width": 0.87,
										"uvScaleX": 4,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_ElecNoise01.png",
										"uvShift": [
											0.2,
											0.5
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6858265812211217,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6858265812211217,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3233441566922783,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6807245404047952,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.3233441566922783,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
							"type": "model",
							"name": "Elec01_diskflat",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 50,
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0.6807245404047952,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.3233441566922783,
													"value": 0.8,
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
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6858265812211217,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3233441566922783,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6858265812211217,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3233441566922783,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6807245404047952,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1.3233441566922783,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.6000743325121835
											},
											"nextHandle": {
												"dv": -6.556621164084262e-16,
												"dt": 0.33333337795849743
											}
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
							"type": "model",
							"name": "Distort",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"enabled": false,
							"z": 4.440892098500626e-16,
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 50,
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
											"drawOrder": "100"
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
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl05u_A.jpg"
									},
									"children": [
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
														"dv": 0.621153878782194,
														"dt": -0.2638029215363347
													},
													"nextHandle": {
														"dv": -0.6006642925019023,
														"dt": 0.2551010315434577
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.1780383365763439,
														"dt": -0.2244928641078885
													},
													"nextHandle": {
														"dv": -0.1780383365763439,
														"dt": 0.2244928641078885
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/perlin1_normal.png",
										"intensity": 0.008
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 5.103123290706821e-16,
														"dt": -0.26511369565981946
													},
													"nextHandle": {
														"dv": -5.103123290706821e-16,
														"dt": 0.26511369565981946
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.7884382817024209,
														"dt": -0.1945077643364994
													},
													"nextHandle": {
														"dv": -0.8968346079007454,
														"dt": 0.22001651997211888
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
										"scaleX": 1.5,
										"scaleY": 0.1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.41666666666666663,
														"dt": -0.3299319727891157
													},
													"nextHandle": {
														"dv": 0.4076409317911878,
														"dt": 0.3227850643571037
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9766249433119758,
												"dt": -0.44452532726087984
											},
											"nextHandle": {
												"dv": 0.5272562299874135,
												"dt": 0.23972617192642579
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.019410109490492156,
												"dt": -0.4824094015224898
											},
											"nextHandle": {
												"dv": -0.012930935386583117,
												"dt": 0.3333280582004723
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emittermult_smallFlare",
							"enabled": false,
							"props": {
								"lifeTime": 0.2,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.1,
								"instScale": 5,
								"instStretch": [
									35,
									4,
									1
								],
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									7,
									1,
									0
								],
								"instScale_rand": 1,
								"useRandomColor": true,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -0.7,
								"emitDuration": 1.3,
								"emitType": "Burst",
								"emitRateMin": 1,
								"burstCount": 2
							},
							"y": 0.70214,
							"z": 2.96381,
							"scaleX": 0.04000000000000001,
							"scaleY": 0.04000000000000001,
							"scaleZ": 0.04000000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"rotationX": 45,
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
													"emissive": 2,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											},
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
																"dv": 0.06196351517869349,
																"dt": -0.49990757001492336
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.13446288206139395
															}
														},
														{
															"time": 0.18100772585187647,
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
													0.7058823529411764,
													0.8,
													1
												]
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
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.1,
												"useRGB": false
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.14303557524986288,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06580133413269795,
												"dt": -0.09828118103147843
											},
											"nextHandle": {
												"dv": 0.06580133413269795,
												"dt": 0.09828118103147843
											}
										},
										{
											"time": 0.1530355752498629,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emittermult_smallFlare",
							"props": {
								"lifeTime": 0.2,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.1,
								"instScale": 5,
								"instStretch": [
									35,
									4,
									1
								],
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									7,
									1,
									0
								],
								"instScale_rand": 1,
								"useRandomColor": true,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -0.7,
								"emitDuration": 1.3,
								"emitType": "Burst",
								"emitRateMin": 1
							},
							"y": 0.70214,
							"z": 2.96381,
							"scaleX": 0.04000000000000001,
							"scaleY": 0.04000000000000001,
							"scaleZ": 0.04000000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"rotationX": 45,
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
													"emissive": 2,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											},
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
																"dv": 0.06196351517869349,
																"dt": -0.49990757001492336
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.13446288206139395
															}
														},
														{
															"time": 0.18100772585187647,
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
													0.7058823529411764,
													0.8,
													1
												]
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
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.1,
												"useRGB": false
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.14303557524986288,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06580133413269795,
												"dt": -0.09828118103147843
											},
											"nextHandle": {
												"dv": 0.06580133413269795,
												"dt": 0.09828118103147843
											}
										},
										{
											"time": 0.1530355752498629,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.1853801159797381,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2611018447946896,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6460551022810885,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.159840378481288,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
							"name": "polygon-flareish",
							"z": 2.9475300000000004,
							"scaleX": 35.349953618413004,
							"scaleY": 35.349953618413004,
							"scaleZ": 35.349953618413004,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_04.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/circGrad3.jpg",
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
											"keys": [
												{
													"time": 0.6961594238522388,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2956274792407012,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7012614646685653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.338779040139722,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6805807367271002,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.9310971472661906,
												"dt": -0.17120587028031628
											},
											"nextHandle": {
												"dv": 0.794995631561622,
												"dt": 0.07238914098793658
											}
										},
										{
											"time": 1.1943660129272997,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
							"name": "polygon",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.1853801159797381,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2611018447946896,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6460551022810885,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.159840378481288,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
							"name": "polygon",
							"z": 2.94753,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
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
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.1853801159797381,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2611018447946896,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6460551022810885,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.159840378481288,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
							"name": "polygon",
							"z": 2.94753,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_04_512.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.1853801159797381,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.6616337894062272,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2611018447946896,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6667358302225537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3042534056937103,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6460551022810885,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.159840378481288,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
											0.7803921568627451,
											0.5176470588235293
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
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
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6987730175371683,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3413926338246513,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6987730175371683,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3413926338246513,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6987730175371683,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.2225193441106792,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.6987730175371683,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.2982410729256306,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7038750583534947,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3413926338246513,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7038750583534947,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.3413926338246513,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6831943304120296,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.1969796066122291,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
											0.7803921568627451,
											0.5176470588235293
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"enabled": false,
							"z": 2.94753,
							"scaleX": 25,
							"scaleY": 25,
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
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"emissive": 0.5
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_06.png"
									}
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.526408387826014,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.169028004113497,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.526408387826014,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.169028004113497,
													"value": -0.2,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.526408387826014,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.29111814826726923,
														"dt": 0.06915880636768901
													}
												},
												{
													"time": 1.050154714399525,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003619090616702847,
														"dt": -0.5207616528940111
													},
													"nextHandle": {
														"dv": 0.003619090616702847,
														"dt": 0.5207616528940111
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05v_A01.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0.526408387826014,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.1258764432144763,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.022038754522800685,
														"dt": -0.5572482360285976
													},
													"nextHandle": {
														"dv": -0.022038754522800685,
														"dt": 0.5572482360285976
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
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5315104286423404,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.169028004113497,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5315104286423404,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1.169028004113497,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.5108297007008753,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.8818242747308243,
												"dt": -0.1456019872233701
											},
											"nextHandle": {
												"dv": 1.0000000000000004,
												"dt": 0.05308899525065025
											}
										},
										{
											"time": 1.0246149769010748,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0683347894794597,
												"dt": -0.4378116347358676
											},
											"nextHandle": {
												"dv": -0.05190948879585082,
												"dt": 0.3333275426476711
											}
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
						}
					]
				},
				{
					"type": "object",
					"name": "Test2",
					"enabled": false,
					"y": 0.54373,
					"z": 5.02675,
					"children": [
						{
							"type": "emitter",
							"name": "emittermult_smallFlare",
							"props": {
								"lifeTime": 0.2,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.1,
								"instScale": 3,
								"instStretch": [
									35,
									4,
									1
								],
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									7,
									1,
									0
								],
								"instScale_rand": 1,
								"useRandomColor": true,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -1,
								"emitDuration": 1.3
							},
							"scaleX": 0.04000000000000001,
							"scaleY": 0.04000000000000001,
							"scaleZ": 0.04000000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"rotationX": 45,
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
													"emissive": 2,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											},
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
																"dv": 0.06196351517869349,
																"dt": -0.49990757001492336
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.13446288206139395
															}
														},
														{
															"time": 0.18100772585187647,
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
													0.7058823529411764,
													0.8,
													1
												]
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
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.1,
												"useRGB": false
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
											}
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
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.25385597998110065,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06666666666666665,
												"dt": -0.24666348213745395
											},
											"nextHandle": {
												"dv": 0.0008951715868641131,
												"dt": 0.0033319339490007435
											}
										},
										{
											"time": 0.26385597998110066,
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
					"type": "object",
					"name": "Knife",
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_White",
							"x": -0.00315,
							"y": -0.04143,
							"z": -0.00191,
							"scaleX": 1.2,
							"scaleY": 0.6,
							"scaleZ": 0.5,
							"rotationX": -86.3,
							"rotationY": -3,
							"rotationZ": 89.3,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"fadePower": 3,
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.7853523019055481,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9369797265308766,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9991858494540883,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4074135311376652,
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
													"time": 0.5520793409435041,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5870702850878107,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7114825309342341,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7853523019055481,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9369797265308766,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9991858494540883,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4074135311376652,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.0015415602037927,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.015428669013597086,
														"dt": -0.19797760565332187
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 0.21386334478889824
													}
												},
												{
													"time": 2.187986527455653,
													"value": 0.5,
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
										"envBlend": 0.6,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.9450980392156862,
											0.3058823529411765,
											0.16078431372549018
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 1.1300033629211388,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.00978182452443758
													},
													"nextHandle": {
														"dv": -0.03417340777450917,
														"dt": 0.09904221378551759
													}
												},
												{
													"time": 1.2350481351179,
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
											0.9882352941176471,
											0.5176470588235293,
											0.2
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_White",
							"x": -0.01475,
							"y": -0.22071,
							"z": -0.00191,
							"scaleX": 0.6,
							"scaleY": 0.8,
							"scaleZ": 0.5,
							"rotationX": -86.3,
							"rotationY": 90,
							"rotationZ": -90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"emissive": 50,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 1.5936269565109678,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.6036269565109678,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.2289800381222125,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.2389800381222122,
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
										"envBlend": 0.6,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.7,
										"color": [
											0.9882352941176471,
											0.5176470588235293,
											0.2
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap-Slide",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl16u_A.png",
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
											"name": "uvShift.y",
											"keys": [
												{
													"time": 1.594288972057961,
													"value": 0.22450165968855162,
													"mode": 1,
													"prevHandle": {
														"dv": -0.013817089154406714,
														"dt": -0.47960471243924907
													},
													"nextHandle": {
														"dv": 0.035396605497208966,
														"dt": 0.6251417404762134
													}
												},
												{
													"time": 2.2487547009162316,
													"value": 1.188780934119911,
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
							"name": "emitter_Flare2",
							"props": {
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.5,
								"instStretch": [
									2,
									4,
									1
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
								"instScale_rand": 0,
								"useRandomColor": true,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -2.22,
								"emitType": "Burst",
								"lifeTime": 0.5
							},
							"x": -4.440892098500626e-16,
							"y": -0.46275500000000014,
							"z": -0.04768499999999998,
							"scaleX": 0.049999999999999996,
							"scaleY": 0.05,
							"scaleZ": 0.049999999999999996,
							"rotationX": 2.671168970760376e-15,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"rotationX": 45,
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
													"emissive": 4,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.17783894350739565,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06196351517869349,
																"dt": -0.49990757001492336
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.13446288206139395
															}
														},
														{
															"time": 0.18783894350739566,
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.9019607843137255,
													0.6745098039215687
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
													1,
													1,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.7,
												"color": [
													1,
													0.6980392156862745,
													0.34901960784313724
												]
											}
										},
										{
											"type": "curve",
											"name": "instrotation.x",
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
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.006831217655519195,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1.0068312176555192,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
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
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.04162001711145505,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.10821204448978312,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.2892591189246126,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.4037141659811139,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.4890352010595968,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.520250213893188,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.5785182378492252,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.6596772712165625,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.7179452951725995,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.8199143370956644,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.8948303678962835,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.9759894012636208,
											"value": 1,
											"mode": 0
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9953416149068323,
											"value": 200,
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
					"name": "Fire",
					"children": [
						{
							"type": "object",
							"name": "fire",
							"x": -0.04598,
							"y": 0.17389,
							"z": -0.006010000000000001,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleX": 0.7999999999999999,
									"scaleY": 0.8,
									"scaleZ": 0.8000000000000002,
									"rotationX": -102.47070009265295,
									"rotationY": -52.61345868765818,
									"rotationZ": 19.604258066608946,
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "WhiteFlames",
											"y": -0.01,
											"z": 0.27735,
											"scaleX": 1.5,
											"scaleY": 1.5,
											"scaleZ": 1.5,
											"rotationX": -90,
											"rotationZ": -90,
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
															"emissive": 2,
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/FireMask03.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.25,
														"saturation": 0.75,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/FireMask05.png",
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
															"enabled": false,
															"keys": [
																{
																	"time": 0.5919898485973163,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.762122570980946,
																	"value": 0.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.26643086747757283,
																		"dt": -0.07011519803730601
																	},
																	"nextHandle": {
																		"dv": -0.26643086747757283,
																		"dt": 0.07011519803730601
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
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
															0.6980392156862745,
															0.34901960784313724
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "BlackFlames",
											"y": -0.09669,
											"z": 0.33833,
											"scaleX": 1.25,
											"scaleY": 1.25,
											"scaleZ": 1.25,
											"rotationX": -90,
											"rotationZ": -90,
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
															"drawOrder": "110"
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
														"alpha": 5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/FireMask04.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A_Tapered.png",
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.45,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/Water_03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															1
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keys": [
																{
																	"time": 0.5919898485973163,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.762122570980946,
																	"value": 0.45,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.26643086747757283,
																		"dt": -0.07011519803730601
																	},
																	"nextHandle": {
																		"dv": -0.26643086747757283,
																		"dt": 0.07011519803730601
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
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
															0,
															0,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "BlackFlamesSmall",
											"x": -0.0083,
											"z": 0.14349,
											"scaleX": 0.8,
											"scaleY": 0.96,
											"scaleZ": 0.75,
											"rotationX": -90,
											"rotationZ": -90,
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 5,
														"uScale": 2,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/FireMask04.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.36,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A_Tapered.png",
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 0.49,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
														"texture": "Fx/noise/Water_03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
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
															0,
															0,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "Glow",
											"x": -1.1102230246251565e-16,
											"z": 2.220446049250313e-16,
											"scaleX": 1.9999999999999996,
											"scaleY": 2,
											"scaleZ": 2,
											"rotationX": -89.99999999999999,
											"rotationY": -9.467383808129004e-16,
											"rotationZ": -89.99999999999999,
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
															"emissive": 1,
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.25,
														"saturation": 0.75,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/FireMask05.png",
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
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1701327223836298,
																	"value": 0.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.26643086747757283,
																		"dt": -0.07011519803730601
																	},
																	"nextHandle": {
																		"dv": -0.26643086747757283,
																		"dt": 0.07011519803730601
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"enabled": false,
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.75,
														"color": [
															0.9882352941176471,
															0.5176470588235293,
															0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.2,
														"maxAlpha": 1,
														"frequency": 2
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.8683242346823141,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.056710907461209936
													}
												},
												{
													"time": 1.132244135375164,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.40844782039338057,
														"dt": -0.1405444228386507
													},
													"nextHandle": {
														"dv": -0.40844782039338057,
														"dt": 0.1405444228386507
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 2.175029233854316,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.056710907461209936
													}
												},
												{
													"time": 2.438949134547166,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.40844782039338057,
														"dt": -0.1405444228386507
													},
													"nextHandle": {
														"dv": -0.40844782039338057,
														"dt": 0.1405444228386507
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.4885262209122487,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.056710907461209936
													}
												},
												{
													"time": 1.7524461216050988,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.40844782039338057,
														"dt": -0.1405444228386507
													},
													"nextHandle": {
														"dv": -0.40844782039338057,
														"dt": 0.1405444228386507
													}
												}
											]
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"enabled": false,
									"x": 0.02469000000000003,
									"y": -0.07132000000000005,
									"z": -0.023740000000000205,
									"scaleX": 0.999999999999999,
									"scaleY": 0.9999999999999993,
									"scaleZ": 0.9999999999999998,
									"rotationX": -87.14040450589908,
									"rotationY": -56.31881088012967,
									"rotationZ": 0.22407403659752642,
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "WhiteFlames",
											"scaleX": 2,
											"scaleY": 2,
											"scaleZ": 2,
											"rotationX": -90,
											"rotationZ": -90,
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
															"emissive": 1,
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.25,
														"saturation": 0.75,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/FireMask05.png",
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
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1701327223836298,
																	"value": 0.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.26643086747757283,
																		"dt": -0.07011519803730601
																	},
																	"nextHandle": {
																		"dv": -0.26643086747757283,
																		"dt": 0.07011519803730601
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"enabled": false,
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.75,
														"color": [
															0.9882352941176471,
															0.5176470588235293,
															0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.2,
														"maxAlpha": 1,
														"frequency": 2
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "WhiteFlames",
											"enabled": false,
											"scaleX": 1.5,
											"scaleY": 1.5,
											"scaleZ": 1.5,
											"rotationX": -90,
											"rotationZ": -90,
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
															"emissive": 1,
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.25,
														"saturation": 0.75,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/FireMask05.png",
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
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1701327223836298,
																	"value": 0.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.26643086747757283,
																		"dt": -0.07011519803730601
																	},
																	"nextHandle": {
																		"dv": -0.26643086747757283,
																		"dt": 0.07011519803730601
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"enabled": false,
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.75,
														"color": [
															0.9882352941176471,
															0.5176470588235293,
															0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.2,
														"maxAlpha": 1,
														"frequency": 3
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "elec",
											"enabled": false,
											"scaleX": 2,
											"scaleY": 2,
											"scaleZ": 2,
											"rotationX": -90,
											"rotationZ": -90,
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
															"drawOrder": "100",
															"emissive": 1
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
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
														"texture": "Fx/Alphas/T_circle2.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.25,
														"saturation": 0.75,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/FireMask05.png",
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
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1701327223836298,
																	"value": 0.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.26643086747757283,
																		"dt": -0.07011519803730601
																	},
																	"nextHandle": {
																		"dv": -0.26643086747757283,
																		"dt": 0.07011519803730601
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"enabled": false,
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricStar_4x4.png",
														"speed": 20,
														"frameDivision": [
															4,
															4
														],
														"totalFrames": 16,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 0.54,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/FlareNoise.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1,
															1
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
															0.9882352941176471,
															0.5176470588235293,
															0.2
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
															1,
															0.9803921568627451,
															0.9686274509803922
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0,
														"maxAlpha": 1,
														"frequency": 3
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.9361019461765823,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.056710907461209936
													}
												},
												{
													"time": 2.200021846869432,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.40844782039338057,
														"dt": -0.1405444228386507
													},
													"nextHandle": {
														"dv": -0.40844782039338057,
														"dt": 0.1405444228386507
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.8918696422213772,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.056710907461209936
													}
												},
												{
													"time": 1.1557895429142269,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.40844782039338057,
														"dt": -0.1405444228386507
													},
													"nextHandle": {
														"dv": -0.40844782039338057,
														"dt": 0.1405444228386507
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
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Knife",
					"target": "FXAnimation.FXRoot.Chani.Crysknife"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Fire",
					"target": "FXAnimation.FXRoot.Chani.Female01_FremenChani.root.B_ROOTJ.B_Spine01J"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Knife",
					"target": "FXAnimation.FXRoot.Chani2.Crysknife2"
				},
				{
					"type": "object",
					"name": "Knife",
					"rotationX": 88.7,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_White",
							"x": -0.00315,
							"y": -0.04143,
							"z": -0.00191,
							"scaleX": 1.2,
							"scaleY": 0.6,
							"scaleZ": 0.5,
							"rotationX": -86.3,
							"rotationY": -3,
							"rotationZ": 89.3,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"fadePower": 3,
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.7853523019055481,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9369797265308766,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9991858494540883,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4074135311376652,
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
													"time": 0.5520793409435041,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5870702850878107,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7114825309342341,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7853523019055481,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9369797265308766,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9991858494540883,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4074135311376652,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.0015415602037927,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.015428669013597086,
														"dt": -0.19797760565332187
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 0.21386334478889824
													}
												},
												{
													"time": 2.187986527455653,
													"value": 0.5,
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
										"envBlend": 0.6,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.9450980392156862,
											0.3058823529411765,
											0.16078431372549018
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 1.1300033629211388,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.00978182452443758
													},
													"nextHandle": {
														"dv": -0.03417340777450917,
														"dt": 0.09904221378551759
													}
												},
												{
													"time": 1.2350481351179,
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
											0.9882352941176471,
											0.5176470588235293,
											0.2
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_White",
							"x": -0.01475,
							"y": -0.22071,
							"z": -0.00191,
							"scaleX": 0.6,
							"scaleY": 0.8,
							"scaleZ": 0.5,
							"rotationX": -86.3,
							"rotationY": 90,
							"rotationZ": -90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"emissive": 50,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 1.5936269565109678,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.6036269565109678,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.2289800381222125,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.2389800381222122,
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
										"envBlend": 0.6,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.7,
										"color": [
											0.9882352941176471,
											0.5176470588235293,
											0.2
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap-Slide",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl16u_A.png",
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
											"name": "uvShift.y",
											"keys": [
												{
													"time": 1.594288972057961,
													"value": 0.22450165968855162,
													"mode": 1,
													"prevHandle": {
														"dv": -0.013817089154406714,
														"dt": -0.47960471243924907
													},
													"nextHandle": {
														"dv": 0.035396605497208966,
														"dt": 0.6251417404762134
													}
												},
												{
													"time": 2.2487547009162316,
													"value": 1.188780934119911,
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
							"name": "emitter_Flare2",
							"props": {
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.5,
								"instStretch": [
									2,
									4,
									1
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
								"instScale_rand": 0,
								"useRandomColor": true,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -2.22,
								"emitType": "Burst",
								"lifeTime": 0.5
							},
							"x": -4.440892098500626e-16,
							"y": -0.46275500000000014,
							"z": -0.04768499999999998,
							"scaleX": 0.049999999999999996,
							"scaleY": 0.05,
							"scaleZ": 0.049999999999999996,
							"rotationX": 2.671168970760376e-15,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"rotationX": 45,
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
													"emissive": 4,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.17783894350739565,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06196351517869349,
																"dt": -0.49990757001492336
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.13446288206139395
															}
														},
														{
															"time": 0.18783894350739566,
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.9019607843137255,
													0.6745098039215687
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
													1,
													1,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.7,
												"color": [
													1,
													0.6980392156862745,
													0.34901960784313724
												]
											}
										},
										{
											"type": "curve",
											"name": "instrotation.x",
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
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.006831217655519195,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1.0068312176555192,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
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
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.04162001711145505,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.10821204448978312,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.2892591189246126,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.4037141659811139,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.4890352010595968,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.520250213893188,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.5785182378492252,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.6596772712165625,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.7179452951725995,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.8199143370956644,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.8948303678962835,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.9759894012636208,
											"value": 1,
											"mode": 0
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9953416149068323,
											"value": 200,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Crysknife",
							"source": "Character/Fremen/Weapon/Crysknife/Crysknife.fbx",
							"scaleX": 1.01,
							"scaleY": 1.01,
							"scaleZ": 1.01,
							"rotationX": -90,
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
											"emissive": 50
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "UVSweep",
									"source": "shaders/UVSweep.hx",
									"props": {
										"saturation": 0,
										"width": 0.15,
										"useU": false,
										"progress": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 1.594288972057961,
													"value": 1.0096823333426101,
													"mode": 1,
													"prevHandle": {
														"dv": -0.013817089154406714,
														"dt": -0.47960471243924907
													},
													"nextHandle": {
														"dv": -0.00021906588008913097,
														"dt": 0.6355931486314752
													}
												},
												{
													"time": 2.2487547009162316,
													"value": -0.11556766665739049,
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
										"amount": 0.7,
										"color": [
											0.9882352941176471,
											0.5176470588235293,
											0.2
										]
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
			"name": "Chani2",
			"enabled": false,
			"children": [
				{
					"type": "model",
					"name": "Female01_FremenChani",
					"source": "Character/Fremen/Unit/Chani/Female01_FremenChani.fbx",
					"scaleX": 1.99,
					"scaleY": 1.99,
					"scaleZ": 1.99,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Female01/Chani/Anim_Female01_Chani_Skill.fbx"
						}
					]
				},
				{
					"type": "model",
					"name": "Crysknife2",
					"source": "Character/Fremen/Weapon/Crysknife/Crysknife.fbx",
					"x": -0.00275,
					"y": -0.11773,
					"z": 0.01896,
					"rotationX": -90
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Chani2.Crysknife2",
					"target": "FXAnimation.FXRoot.Chani2.Female01_FremenChani.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"y": -0.05,
			"scaleX": 0.4,
			"scaleY": 0.4,
			"scaleZ": 0.4,
			"rotationX": -90,
			"children": [
				{
					"type": "object",
					"name": "Knife",
					"rotationX": 88.7,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_White",
							"x": -0.00315,
							"y": -0.04143,
							"z": -0.00191,
							"scaleX": 1.2,
							"scaleY": 0.6,
							"scaleZ": 0.5,
							"rotationX": -86.3,
							"rotationY": -3,
							"rotationZ": 89.3,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"fadePower": 3,
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.7853523019055481,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9369797265308766,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9991858494540883,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4074135311376652,
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
													"time": 0.5520793409435041,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5870702850878107,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7114825309342341,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7853523019055481,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9369797265308766,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9991858494540883,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4074135311376652,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.0015415602037927,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.015428669013597086,
														"dt": -0.19797760565332187
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 0.21386334478889824
													}
												},
												{
													"time": 2.187986527455653,
													"value": 0.5,
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
										"envBlend": 0.6,
										"envColorSet": false
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
											0.5176470588235293,
											0.2
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter_Flare2",
							"props": {
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.5,
								"instStretch": [
									2,
									4,
									1
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
								"instScale_rand": 0,
								"useRandomColor": true,
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -2.22,
								"emitType": "Burst",
								"lifeTime": 0.5
							},
							"x": -4.440892098500626e-16,
							"y": -0.46275500000000014,
							"z": -0.04768499999999998,
							"scaleX": 0.049999999999999996,
							"scaleY": 0.05,
							"scaleZ": 0.049999999999999996,
							"rotationX": 2.671168970760376e-15,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"rotationX": 45,
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
													"emissive": 4,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.17783894350739565,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06196351517869349,
																"dt": -0.49990757001492336
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.13446288206139395
															}
														},
														{
															"time": 0.18783894350739566,
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
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.7,
												"color": [
													1,
													0.6980392156862745,
													0.34901960784313724
												]
											}
										},
										{
											"type": "curve",
											"name": "instrotation.x",
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
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.006831217655519195,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.2334981930436706,
												"dt": -0.4276798037244547
											},
											"nextHandle": {
												"dv": -0.7166666666666667,
												"dt": 0.24848342791614272
											}
										},
										{
											"time": 1.0068312176555192,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5240317437099238
											},
											"nextHandle": {
												"dv": -3.8880269028916045e-16,
												"dt": 0.3333333333333333
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
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.04162001711145505,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.10821204448978312,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.2892591189246126,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.4037141659811139,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.4890352010595968,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.520250213893188,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.5785182378492252,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.6596772712165625,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.7179452951725995,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.8199143370956644,
											"value": 1,
											"mode": 0
										},
										{
											"time": 0.8948303678962835,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.9759894012636208,
											"value": 1,
											"mode": 0
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9953416149068323,
											"value": 200,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Crysknife",
							"source": "Character/Fremen/Weapon/Crysknife/Crysknife.fbx",
							"scaleX": 1.01,
							"scaleY": 1.01,
							"scaleZ": 1.01,
							"rotationX": -90,
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
											"emissive": 50
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "UVSweep",
									"source": "shaders/UVSweep.hx",
									"props": {
										"saturation": 0,
										"width": 0.15,
										"useU": false,
										"progress": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 1.594288972057961,
													"value": 1.0096823333426101,
													"mode": 1,
													"prevHandle": {
														"dv": -0.013817089154406714,
														"dt": -0.47960471243924907
													},
													"nextHandle": {
														"dv": -0.00021906588008913097,
														"dt": 0.6355931486314752
													}
												},
												{
													"time": 2.2487547009162316,
													"value": -0.11556766665739049,
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
										"amount": 0.7,
										"color": [
											0.9882352941176471,
											0.5176470588235293,
											0.2
										]
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
			"object": "FXAnimation.FXRoot",
			"target": "FXAnimation.Chani2.Female01_FremenChani.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
		}
	]
}