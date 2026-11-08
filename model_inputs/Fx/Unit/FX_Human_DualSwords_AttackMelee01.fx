{
	"type": "fx",
	"duration": 2,
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
					"name": "Female01_Infiltrator",
					"source": "Character/Fremen/Unit/Infiltrator/Female01_Infiltrator.fbx",
					"editorOnly": true,
					"scaleX": 2.3,
					"scaleY": 2.3,
					"scaleZ": 2.3,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": -0.1,
							"animation": "Anim/Female01/DualSwords/Anim_Female01_DualSwords_AttackMelee01.fbx"
						}
					]
				},
				{
					"type": "polygon",
					"name": "Slash01",
					"x": 3.1326616597460606,
					"y": -0.5244877491082605,
					"z": 2.0699999999999994,
					"scaleX": 4.199999999999999,
					"scaleY": 4.2,
					"scaleZ": 4.2,
					"rotationX": -8.700000000000003,
					"rotationZ": -23.299999999999997,
					"kind": 1,
					"args": [
						24,
						300,
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
											"time": 0.2562499999999997,
											"value": -2.500320053100587,
											"mode": 2
										},
										{
											"time": 1.5012499999999946,
											"value": 1.9597103118896493,
											"mode": 0,
											"prevHandle": {
												"dv": 0.06757621765136723,
												"dt": -0.5199999999999998
											},
											"nextHandle": {
												"dv": -0.04309950544713704,
												"dt": 0.3316513355058816
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
											"time": 0.25124999999999975,
											"value": -0.03472222222222225,
											"mode": 0,
											"prevHandle": {
												"dv": -0.021541150644896954,
												"dt": -0.499702636528235
											},
											"nextHandle": {
												"dv": 0.018518518518518517,
												"dt": 0.4288562596073172
											}
										},
										{
											"time": 0.7162499999999996,
											"value": 1.0069444444444449,
											"mode": 1,
											"prevHandle": {
												"dv": -1.0046296296296298,
												"dt": -0.06620842174634933
											},
											"nextHandle": {
												"dv": -0.9305555555555556,
												"dt": 0.0650646813536665
											}
										},
										{
											"time": 1.1312499999999996,
											"value": -0.03472222222222225,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.41025012804053784
											},
											"nextHandle": {
												"dv": -5.653469652661062e-16,
												"dt": 0.1919166956729
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
											"time": 0.6697094264160093,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6797094264160093,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.695812717535442,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7058127175354421,
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
					"type": "polygon",
					"name": "Slash02",
					"x": 2.7152084018680265,
					"y": -0.9072066500757339,
					"z": 2.121456040856807,
					"scaleX": 4.2,
					"scaleY": 4.200000000000002,
					"scaleZ": 4.200000000000001,
					"rotationX": 174.3156614473565,
					"rotationY": -1.1452763555020542,
					"rotationZ": -34.60737769044766,
					"kind": 1,
					"args": [
						24,
						300,
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
											"time": 0.2562499999999997,
											"value": -2.500320053100587,
											"mode": 2
										},
										{
											"time": 1.5012499999999946,
											"value": 1.9597103118896493,
											"mode": 0,
											"prevHandle": {
												"dv": 0.06757621765136723,
												"dt": -0.5199999999999998
											},
											"nextHandle": {
												"dv": -0.04309950544713704,
												"dt": 0.3316513355058816
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
											"time": 0.25124999999999975,
											"value": -0.03472222222222225,
											"mode": 0,
											"prevHandle": {
												"dv": -0.021541150644896954,
												"dt": -0.499702636528235
											},
											"nextHandle": {
												"dv": 0.018518518518518517,
												"dt": 0.4288562596073172
											}
										},
										{
											"time": 0.7162499999999996,
											"value": 1.0069444444444449,
											"mode": 1,
											"prevHandle": {
												"dv": -1.0046296296296298,
												"dt": -0.06620842174634933
											},
											"nextHandle": {
												"dv": -0.9305555555555556,
												"dt": 0.0650646813536665
											}
										},
										{
											"time": 1.1312499999999996,
											"value": -0.03472222222222225,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.41025012804053784
											},
											"nextHandle": {
												"dv": -5.653469652661062e-16,
												"dt": 0.1919166956729
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
											"time": 0.6697094264160093,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6797094264160093,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.695812717535442,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7058127175354421,
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
					"type": "emitter",
					"name": "Sand",
					"props": {
						"instScale_rand": 0.9,
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
						"lifeTimeRand": 0.9,
						"useRandomColor": true,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 5,
						"emitAngle": 45,
						"alignMode": "Screen",
						"lifeTime": 4.5,
						"emitRad1": 0.64,
						"emitRad2": 0.89,
						"randomColor2": [
							0.807843137254902,
							0.788235294117647,
							0.7803921568627451,
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
						"maxCount": 2,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
						"warmUpTime": -1.75,
						"emitType": "Burst",
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instSpeed": [
							4,
							0,
							0
						]
					},
					"x": 1.1819739412307326,
					"y": 0.0914940281257742,
					"z": -1.6589731734089646,
					"scaleX": 0.6000000000000001,
					"scaleY": 0.6,
					"scaleZ": 0.12,
					"rotationX": -4.099509072807552,
					"rotationY": 4.3096398996593965,
					"rotationZ": 36.94785807548019,
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
										"texture": "Fx/noise/Wave_01.jpg",
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
					"name": "Backup",
					"enabled": false,
					"x": -3.97051,
					"y": -7.61813,
					"z": -0.695,
					"children": [
						{
							"type": "object",
							"name": "Attack02",
							"z": -0.18499999999999994,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationX": -5.600000000000001,
							"rotationY": -2.0000000000000004,
							"rotationZ": -29.000000000000014,
							"children": [
								{
									"type": "object",
									"name": "Slashes",
									"x": 1.94,
									"y": -0.17,
									"z": 2.43,
									"rotationX": -0.7,
									"rotationY": 1.3,
									"rotationZ": -13.8,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"x": 4.440892098500626e-16,
											"y": -2.220446049250313e-16,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -179.8,
											"rotationZ": 8.300000000000002,
											"kind": 1,
											"args": [
												24,
												300,
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
																	"time": 0.2562499999999997,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5012499999999946,
																	"value": 1.9597103118896493,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.06757621765136723,
																		"dt": -0.5199999999999998
																	},
																	"nextHandle": {
																		"dv": -0.04309950544713704,
																		"dt": 0.3316513355058816
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
																	"time": 0.25124999999999975,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.021541150644896954,
																		"dt": -0.499702636528235
																	},
																	"nextHandle": {
																		"dv": 0.018518518518518517,
																		"dt": 0.4288562596073172
																	}
																},
																{
																	"time": 0.7162499999999996,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -1.0046296296296298,
																		"dt": -0.06620842174634933
																	},
																	"nextHandle": {
																		"dv": -0.9305555555555556,
																		"dt": 0.0650646813536665
																	}
																},
																{
																	"time": 1.1312499999999996,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.41025012804053784
																	},
																	"nextHandle": {
																		"dv": -5.653469652661062e-16,
																		"dt": 0.1919166956729
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "SlashImpact",
											"x": 4.440892098500626e-16,
											"y": -2.220446049250313e-16,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -179.8,
											"rotationZ": 8.300000000000002,
											"kind": 1,
											"args": [
												24,
												300,
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
																	"time": 0.7007690384115581,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7107690384115581,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7207690384115581,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.7912499999999996,
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
																	"time": 0.2562499999999997,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5012499999999946,
																	"value": 1.9597103118896493,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.06757621765136723,
																		"dt": -0.5199999999999998
																	},
																	"nextHandle": {
																		"dv": -0.04309950544713704,
																		"dt": 0.3316513355058816
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
																	"time": 0.25124999999999975,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.021541150644896954,
																		"dt": -0.499702636528235
																	},
																	"nextHandle": {
																		"dv": 0.018518518518518517,
																		"dt": 0.4288562596073172
																	}
																},
																{
																	"time": 0.7162499999999996,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -1.0046296296296298,
																		"dt": -0.06620842174634933
																	},
																	"nextHandle": {
																		"dv": -0.9305555555555556,
																		"dt": 0.0650646813536665
																	}
																},
																{
																	"time": 1.1312499999999996,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.41025012804053784
																	},
																	"nextHandle": {
																		"dv": -5.653469652661062e-16,
																		"dt": 0.1919166956729
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "SlashContrast",
											"x": 4.440892098500626e-16,
											"y": -2.220446049250313e-16,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -179.8,
											"rotationZ": 8.300000000000002,
											"kind": 1,
											"args": [
												24,
												300,
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
																	"time": 0.6615746731259375,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6715746731259375,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6960260830360421,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7060260830360421,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.7912499999999996,
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
																	"time": 0.2562499999999997,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5012499999999946,
																	"value": 1.9597103118896493,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.06757621765136723,
																		"dt": -0.5199999999999998
																	},
																	"nextHandle": {
																		"dv": -0.04309950544713704,
																		"dt": 0.3316513355058816
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
																	"time": 0.25124999999999975,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.021541150644896954,
																		"dt": -0.499702636528235
																	},
																	"nextHandle": {
																		"dv": 0.018518518518518517,
																		"dt": 0.4288562596073172
																	}
																},
																{
																	"time": 0.7162499999999996,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -1.0046296296296298,
																		"dt": -0.06620842174634933
																	},
																	"nextHandle": {
																		"dv": -0.9305555555555556,
																		"dt": 0.0650646813536665
																	}
																},
																{
																	"time": 1.1312499999999996,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.41025012804053784
																	},
																	"nextHandle": {
																		"dv": -5.653469652661062e-16,
																		"dt": 0.1919166956729
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "SlashDistort",
											"x": 4.440892098500626e-16,
											"y": -2.220446049250313e-16,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -179.8,
											"rotationZ": 8.300000000000002,
											"kind": 1,
											"args": [
												24,
												300,
												0.57,
												4
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
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
														"intensity": 0.006
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
																	"time": 0.2562499999999997,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5012499999999946,
																	"value": 1.9597103118896493,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.06757621765136723,
																		"dt": -0.5199999999999998
																	},
																	"nextHandle": {
																		"dv": -0.04309950544713704,
																		"dt": 0.3316513355058816
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
																	"time": 0.25124999999999975,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.021541150644896954,
																		"dt": -0.499702636528235
																	},
																	"nextHandle": {
																		"dv": 0.018518518518518517,
																		"dt": 0.4288562596073172
																	}
																},
																{
																	"time": 0.7162499999999996,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -1.0046296296296298,
																		"dt": -0.06620842174634933
																	},
																	"nextHandle": {
																		"dv": -0.9305555555555556,
																		"dt": 0.0650646813536665
																	}
																},
																{
																	"time": 1.1312499999999996,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.41025012804053784
																	},
																	"nextHandle": {
																		"dv": -5.653469652661062e-16,
																		"dt": 0.1919166956729
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
									"name": "Sand",
									"props": {
										"instScale_rand": 0.9,
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
										"lifeTimeRand": 0.9,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 5,
										"emitAngle": 45,
										"alignMode": "Screen",
										"lifeTime": 4.5,
										"emitRad1": 0.64,
										"emitRad2": 0.89,
										"randomColor2": [
											0.807843137254902,
											0.788235294117647,
											0.7803921568627451,
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
										"maxCount": 2,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
										"warmUpTime": -1.75,
										"emitType": "Burst",
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instSpeed": [
											4,
											0,
											0
										]
									},
									"x": 0.31,
									"y": 0.24,
									"z": -0.64,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.1,
									"rotationZ": 66.2,
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
														"texture": "Fx/noise/Wave_01.jpg",
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
								}
							]
						},
						{
							"type": "object",
							"name": "Attack01",
							"z": 0.18500000000000005,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationZ": -9.3,
							"children": [
								{
									"type": "object",
									"name": "Slash",
									"x": 2.06,
									"y": -0.19,
									"z": 2.15,
									"rotationZ": -14,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
											"kind": 1,
											"args": [
												24,
												300,
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
																	"time": 0.2562499999999997,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5012499999999946,
																	"value": 1.9597103118896493,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.06757621765136723,
																		"dt": -0.5199999999999998
																	},
																	"nextHandle": {
																		"dv": -0.04309950544713704,
																		"dt": 0.3316513355058816
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
																	"time": 0.25124999999999975,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.021541150644896954,
																		"dt": -0.499702636528235
																	},
																	"nextHandle": {
																		"dv": 0.018518518518518517,
																		"dt": 0.4288562596073172
																	}
																},
																{
																	"time": 0.7162499999999996,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -1.0046296296296298,
																		"dt": -0.06620842174634933
																	},
																	"nextHandle": {
																		"dv": -0.9305555555555556,
																		"dt": 0.0650646813536665
																	}
																},
																{
																	"time": 1.1312499999999996,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.41025012804053784
																	},
																	"nextHandle": {
																		"dv": -5.653469652661062e-16,
																		"dt": 0.1919166956729
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "SlashImpact",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
											"kind": 1,
											"args": [
												24,
												300,
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
																	"time": 0.7007690384115581,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7107690384115581,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7207690384115581,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.7912499999999996,
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
																	"time": 0.2562499999999997,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5012499999999946,
																	"value": 1.9597103118896493,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.06757621765136723,
																		"dt": -0.5199999999999998
																	},
																	"nextHandle": {
																		"dv": -0.04309950544713704,
																		"dt": 0.3316513355058816
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
																	"time": 0.25124999999999975,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.021541150644896954,
																		"dt": -0.499702636528235
																	},
																	"nextHandle": {
																		"dv": 0.018518518518518517,
																		"dt": 0.4288562596073172
																	}
																},
																{
																	"time": 0.7162499999999996,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -1.0046296296296298,
																		"dt": -0.06620842174634933
																	},
																	"nextHandle": {
																		"dv": -0.9305555555555556,
																		"dt": 0.0650646813536665
																	}
																},
																{
																	"time": 1.1312499999999996,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.41025012804053784
																	},
																	"nextHandle": {
																		"dv": -5.653469652661062e-16,
																		"dt": 0.1919166956729
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "SlashContrast",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
											"kind": 1,
											"args": [
												24,
												300,
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
																	"time": 0.6615746731259375,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6715746731259375,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6960260830360421,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7060260830360421,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.7912499999999996,
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
																	"time": 0.2562499999999997,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5012499999999946,
																	"value": 1.9597103118896493,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.06757621765136723,
																		"dt": -0.5199999999999998
																	},
																	"nextHandle": {
																		"dv": -0.04309950544713704,
																		"dt": 0.3316513355058816
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
																	"time": 0.25124999999999975,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.021541150644896954,
																		"dt": -0.499702636528235
																	},
																	"nextHandle": {
																		"dv": 0.018518518518518517,
																		"dt": 0.4288562596073172
																	}
																},
																{
																	"time": 0.7162499999999996,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -1.0046296296296298,
																		"dt": -0.06620842174634933
																	},
																	"nextHandle": {
																		"dv": -0.9305555555555556,
																		"dt": 0.0650646813536665
																	}
																},
																{
																	"time": 1.1312499999999996,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.41025012804053784
																	},
																	"nextHandle": {
																		"dv": -5.653469652661062e-16,
																		"dt": 0.1919166956729
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "SlashDistort",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
											"kind": 1,
											"args": [
												24,
												300,
												0.57,
												4
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
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
														"intensity": 0.006
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
																	"time": 0.2562499999999997,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5012499999999946,
																	"value": 1.9597103118896493,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.06757621765136723,
																		"dt": -0.5199999999999998
																	},
																	"nextHandle": {
																		"dv": -0.04309950544713704,
																		"dt": 0.3316513355058816
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
																	"time": 0.25124999999999975,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.021541150644896954,
																		"dt": -0.499702636528235
																	},
																	"nextHandle": {
																		"dv": 0.018518518518518517,
																		"dt": 0.4288562596073172
																	}
																},
																{
																	"time": 0.7162499999999996,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -1.0046296296296298,
																		"dt": -0.06620842174634933
																	},
																	"nextHandle": {
																		"dv": -0.9305555555555556,
																		"dt": 0.0650646813536665
																	}
																},
																{
																	"time": 1.1312499999999996,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.41025012804053784
																	},
																	"nextHandle": {
																		"dv": -5.653469652661062e-16,
																		"dt": 0.1919166956729
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
									"name": "Sand",
									"enabled": false,
									"props": {
										"instScale_rand": 0.9,
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
										"lifeTimeRand": 0.9,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 5,
										"emitAngle": 45,
										"alignMode": "Screen",
										"lifeTime": 4.5,
										"emitRad1": 0.64,
										"emitRad2": 0.89,
										"randomColor2": [
											0.807843137254902,
											0.788235294117647,
											0.7803921568627451,
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
										"maxCount": 2,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
										"warmUpTime": -1.75,
										"emitType": "Burst",
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instSpeed": [
											4,
											0,
											0
										]
									},
									"x": 1.43,
									"y": -1.52,
									"z": -0.6599999999999999,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.1,
									"rotationZ": -10,
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
														"texture": "Fx/noise/Wave_01.jpg",
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
								}
							]
						}
					]
				}
			]
		},
		{
			"type": "model",
			"name": "KnifeR",
			"source": "Character/Harkonnen/Weapon/KindJal_Harkonnen.fbx",
			"editorOnly": true,
			"rotationX": -90
		},
		{
			"type": "model",
			"name": "KnifeL",
			"source": "Character/Harkonnen/Weapon/KindJal_Harkonnen.fbx",
			"editorOnly": true,
			"rotationX": -90
		},
		{
			"type": "constraint",
			"name": "constraint",
			"editorOnly": true,
			"object": "FXAnimation.KnifeR",
			"target": "FXAnimation.FXRoot.Female01_Infiltrator.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
		},
		{
			"type": "constraint",
			"name": "constraint",
			"editorOnly": true,
			"object": "FXAnimation.KnifeL",
			"target": "FXAnimation.FXRoot.Female01_Infiltrator.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_Weapon_L"
		}
	]
}