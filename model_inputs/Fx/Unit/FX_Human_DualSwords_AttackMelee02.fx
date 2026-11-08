{
	"type": "fx",
	"duration": 1.5,
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
					"name": "Female01_FreeCompany",
					"source": "Character/Smuggler/Unit/FreeCompany/Female01_FreeCompany.fbx",
					"editorOnly": true,
					"scaleX": 2.35,
					"scaleY": 2.35,
					"scaleZ": 2.35,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": -0.1,
							"animation": "Anim/Female01/DualSwords/Anim_Female01_DualSwords_AttackMelee02.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Attack01",
					"x": -1.18,
					"y": 0.11,
					"z": -0.69,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"rotationX": 9,
					"children": [
						{
							"type": "polygon",
							"name": "Slash",
							"x": 2,
							"y": -0.06000000000000015,
							"z": 2.5300000000000002,
							"scaleX": 3.5000000000000004,
							"scaleY": 3.5,
							"scaleZ": 3.5,
							"rotationX": 3.000000000000004,
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
													"time": -0.12937500000000002,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.11125,
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
										"texture": "Fx/Gradients/dGrad02.png",
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
													"time": -0.12937500000000002,
													"value": 0,
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
													"time": 0.36242410551361487,
													"value": 1.0416666666666667,
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
													"time": 0.9112500000000001,
													"value": 0,
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
													"time": 0.31451283517428985,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.32451283517428986,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3406161262937226,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.35061612629372263,
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
								"emitAngle": 90,
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
								"warmUpTime": -0.4,
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
							"x": 4.23,
							"y": -0.94,
							"z": -1.43,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.1,
							"rotationZ": -20,
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
					"name": "Attack02",
					"x": 0.81,
					"y": -0.87,
					"z": -0.49,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"rotationX": -26,
					"children": [
						{
							"type": "polygon",
							"name": "Slash",
							"x": 1.9999999999999998,
							"y": -0.06000000000000011,
							"z": 2.530000000000001,
							"scaleX": 3.5,
							"scaleY": 3.5,
							"scaleZ": 3.5,
							"rotationX": 2.999999999999995,
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
													"time": 0.0812500000000001,
													"value": -2.425986213684083,
													"mode": 2
												},
												{
													"time": 1.39625,
													"value": 1.885376472473146,
													"mode": 0,
													"prevHandle": {
														"dv": -0.14866767883300747,
														"dt": -0.5099999999999992
													},
													"nextHandle": {
														"dv": 0.09666321968558474,
														"dt": 0.3316002672983347
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
										"texture": "Fx/Gradients/dGrad02.png",
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
													"time": 0.18125000000000013,
													"value": 0,
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
													"time": 0.56625,
													"value": 1.059027777777778,
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
													"time": 1.00125,
													"value": 0,
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
													"time": 0.5518238352128035,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5618238352128035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5692661409293707,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5792661409293707,
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
								"emitAngle": 90,
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
								"warmUpTime": -1,
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
							"x": 0.39,
							"y": -0.64,
							"z": -2.28,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.1,
							"rotationZ": -40,
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
					"name": "backup",
					"enabled": false,
					"x": -0.185,
					"y": -7.37666,
					"z": -0.59,
					"children": [
						{
							"type": "object",
							"name": "Attack02",
							"x": 0.995,
							"y": -0.49,
							"z": 0.09999999999999998,
							"scaleX": 1.2,
							"scaleY": 1.2000000000000002,
							"scaleZ": 1.2000000000000002,
							"rotationX": -25.999999999999996,
							"children": [
								{
									"type": "object",
									"name": "Slash",
									"x": 2,
									"y": -0.06,
									"z": 2.5300000000000002,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"y": -2.220446049250313e-16,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5,
											"scaleY": 3.5,
											"scaleZ": 3.5,
											"rotationX": 2.9999999999999987,
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
																	"time": 0.0812500000000001,
																	"value": -2.425986213684083,
																	"mode": 2
																},
																{
																	"time": 1.39625,
																	"value": 1.885376472473146,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.14866767883300747,
																		"dt": -0.5099999999999992
																	},
																	"nextHandle": {
																		"dv": 0.09666321968558474,
																		"dt": 0.3316002672983347
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
														"texture": "Fx/Gradients/dGrad02.png",
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
																	"time": 0.18125000000000013,
																	"value": 0,
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
																	"time": 0.56625,
																	"value": 1.059027777777778,
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
																	"time": 1.00125,
																	"value": 0,
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
											"y": -2.220446049250313e-16,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5,
											"scaleY": 3.5,
											"scaleZ": 3.5,
											"rotationX": 2.9999999999999987,
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
																	"time": 0.566231777351135,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.576231777351135,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.586231777351135,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.7124999999999997,
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
																	"time": 0.0812500000000001,
																	"value": -2.425986213684083,
																	"mode": 2
																},
																{
																	"time": 1.39625,
																	"value": 1.885376472473146,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.14866767883300747,
																		"dt": -0.5099999999999992
																	},
																	"nextHandle": {
																		"dv": 0.09666321968558474,
																		"dt": 0.3316002672983347
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
														"texture": "Fx/Gradients/dGrad02.png",
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
																	"time": 0.18125000000000013,
																	"value": 0,
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
																	"time": 0.56625,
																	"value": 1.059027777777778,
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
																	"time": 1.00125,
																	"value": 0,
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
											"y": -2.220446049250313e-16,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5,
											"scaleY": 3.5,
											"scaleZ": 3.5,
											"rotationX": 2.9999999999999987,
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
																	"time": 0.5487553286158693,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5587553286158693,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5741939005911172,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5841939005911172,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.7124999999999997,
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
																	"time": 0.0812500000000001,
																	"value": -2.425986213684083,
																	"mode": 2
																},
																{
																	"time": 1.39625,
																	"value": 1.885376472473146,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.14866767883300747,
																		"dt": -0.5099999999999992
																	},
																	"nextHandle": {
																		"dv": 0.09666321968558474,
																		"dt": 0.3316002672983347
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
														"texture": "Fx/Gradients/dGrad02.png",
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
																	"time": 0.18125000000000013,
																	"value": 0,
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
																	"time": 0.56625,
																	"value": 1.059027777777778,
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
																	"time": 1.00125,
																	"value": 0,
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
											"y": -2.220446049250313e-16,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5,
											"scaleY": 3.5,
											"scaleZ": 3.5,
											"rotationX": 2.9999999999999987,
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
																	"time": 0.0812500000000001,
																	"value": -2.425986213684083,
																	"mode": 2
																},
																{
																	"time": 1.39625,
																	"value": 1.885376472473146,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.14866767883300747,
																		"dt": -0.5099999999999992
																	},
																	"nextHandle": {
																		"dv": 0.09666321968558474,
																		"dt": 0.3316002672983347
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
														"progress": 0.6,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/dGrad02.png",
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
																	"time": 0.18125000000000013,
																	"value": 0,
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
																	"time": 0.56625,
																	"value": 1.059027777777778,
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
																	"time": 1.00125,
																	"value": 0,
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
									"name": "Sparkles02",
									"enabled": false,
									"editorOnly": true,
									"props": {
										"emitType": "Burst",
										"burstParticleCount": 10,
										"emitOrientation": "Normal",
										"emitAngle": 40,
										"instSpeed": [
											30,
											0,
											0
										],
										"lifeTime": 0.2,
										"warmUpTime": -1.05,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.4,
										"instScale_rand": 0.1,
										"instSpeed_rand": [
											7,
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157,
											1
										],
										"randomColor2": [
											0.9921568627450981,
											0.5058823529411764,
											0.4,
											1
										],
										"lifeTimeRand": 0.1,
										"burstDelay": 0.75,
										"emitShape": "Cone"
									},
									"x": 5.2,
									"y": 0.01,
									"z": 2.51,
									"rotationX": 90,
									"rotationY": 1.7,
									"rotationZ": -90,
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
															"emissive": 6
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
													"value": 0.2,
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
									"type": "object",
									"name": "Impact",
									"enabled": false,
									"editorOnly": true,
									"x": 5.08,
									"y": 0.01,
									"z": 2.52,
									"rotationX": 3.9,
									"children": [
										{
											"type": "emitter",
											"name": "ImpactContrast",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"lifeTime": 0.1,
												"frameDivisionY": 0,
												"animationSpeed": 0,
												"instScale": 4,
												"emitType": "Burst",
												"burstDelay": 0.15,
												"instScale_rand": 0.3,
												"frameDivisionX": 0,
												"instRotation_rand": [
													0,
													0,
													0
												],
												"lifeTimeRand": 0.02,
												"randomColor1": [
													0.615686274509804,
													0.6470588235294118,
													0.7490196078431373,
													1
												],
												"randomColor2": [
													0.615686274509804,
													0.7490196078431373,
													0.7450980392156863,
													1
												],
												"warmUpTime": -0.49,
												"instStretch": [
													0.7,
													1.75,
													1
												],
												"instStretch_rand": [
													0.25,
													0.5,
													0
												]
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.09999999999999999,
											"children": [
												{
													"type": "model",
													"name": "PlanePivBot_NoVrtx",
													"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
													"rotationX": 90,
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
																			"time": 0,
																			"value": 0.43333333333333335,
																			"mode": 2
																		},
																		{
																			"time": 0.72,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.022847819119101713,
																				"dt": -0.2399021007505667
																			},
																			"nextHandle": {
																				"dv": -0.016666666666666607,
																				"dt": 0.17499999999999993
																			}
																		},
																		{
																			"time": 1,
																			"value": 0.7,
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
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/causticTexture_03-2-Blured.png",
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
																				"dv": -0.009691703115208502,
																				"dt": -0.5000918807447791
																			},
																			"nextHandle": {
																				"dv": 0.016666666666666607,
																				"dt": 0.86
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
															"type": "curve",
															"name": "instScale",
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
																		"dv": -0.08024691358024694,
																		"dt": -0.4537982014936748
																	},
																	"nextHandle": {
																		"dv": 0.06746020731085037,
																		"dt": 0.3709811696857443
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
													"name": "instStretch.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.7933949939898362,
																"dt": -0.14590332154493602
															},
															"nextHandle": {
																"dv": 0.9833333333333334,
																"dt": 0.07888888888888888
															}
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.7833333333333333
															},
															"nextHandle": {
																"dv": -6.123233995736766e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "Impact",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"lifeTime": 0.1,
												"frameDivisionY": 0,
												"animationSpeed": 0,
												"instScale": 1.75,
												"emitType": "Burst",
												"burstDelay": 0.15,
												"instScale_rand": 0.3,
												"frameDivisionX": 0,
												"lifeTimeRand": 0.02,
												"randomColor1": [
													0.615686274509804,
													0.6470588235294118,
													0.7490196078431373,
													1
												],
												"randomColor2": [
													0.615686274509804,
													0.7490196078431373,
													0.7450980392156863,
													1
												],
												"warmUpTime": -0.52,
												"instStretch": [
													0.55,
													1.6,
													1
												],
												"instStretch_rand": [
													0.15,
													0.35,
													0
												]
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "model",
													"name": "PlanePivBot_NoVrtx",
													"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
													"rotationX": 90,
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
																			"time": 0,
																			"value": 0.43333333333333335,
																			"mode": 2
																		},
																		{
																			"time": 0.72,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.022847819119101713,
																				"dt": -0.2399021007505667
																			},
																			"nextHandle": {
																				"dv": -0.016666666666666607,
																				"dt": 0.17499999999999993
																			}
																		},
																		{
																			"time": 1,
																			"value": 0.7,
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
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/causticTexture_03-2-Blured.png",
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
																				"dv": -0.009691703115208502,
																				"dt": -0.5000918807447791
																			},
																			"nextHandle": {
																				"dv": 0.016666666666666607,
																				"dt": 0.86
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
																	0.9921568627450981,
																	0.8235294117647058,
																	0.6627450980392157
																]
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
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.08024691358024694,
																		"dt": -0.4537982014936748
																	},
																	"nextHandle": {
																		"dv": 0.06746020731085037,
																		"dt": 0.3709811696857443
																	}
																}
															]
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.7833333333333333
															},
															"nextHandle": {
																"dv": -6.123233995736766e-16,
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
										"emitAngle": 90,
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
										"warmUpTime": -1,
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
									"x": 0.39,
									"y": -0.64,
									"z": -2.28,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.1,
									"rotationZ": -40,
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
							"x": -0.995,
							"y": 0.49,
							"z": -0.09999999999999998,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationX": 9,
							"children": [
								{
									"type": "object",
									"name": "Slash",
									"x": 2,
									"y": -0.06000000000000015,
									"z": 2.53,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"y": 5.551115123125783e-17,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5000000000000004,
											"scaleY": 3.5,
											"scaleZ": 3.5,
											"rotationX": 3.000000000000002,
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
																	"time": -0.12937500000000002,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.11125,
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
														"texture": "Fx/Gradients/dGrad02.png",
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
																	"time": -0.12937500000000002,
																	"value": 0,
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
																	"time": 0.36242410551361487,
																	"value": 1.0416666666666667,
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
																	"time": 0.9112500000000001,
																	"value": 0,
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
											"y": 5.551115123125783e-17,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5000000000000004,
											"scaleY": 3.5,
											"scaleZ": 3.5,
											"rotationX": 3.000000000000002,
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
																	"time": 0.34201903841155845,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.35201903841155846,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.36201903841155847,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.7124999999999997,
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
																	"time": -0.12937500000000002,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.11125,
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
														"texture": "Fx/Gradients/dGrad02.png",
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
																	"time": -0.12937500000000002,
																	"value": 0,
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
																	"time": 0.3524241055136151,
																	"value": 1.0416666666666667,
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
																	"time": 0.9112500000000001,
																	"value": 0,
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
											"y": 5.551115123125783e-17,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5000000000000004,
											"scaleY": 3.5,
											"scaleZ": 3.5,
											"rotationX": 3.000000000000002,
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
																	"time": 0.3062477373356367,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.3162477373356367,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.3472760830360422,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.3572760830360422,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.7124999999999997,
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
																	"time": -0.12937500000000002,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.11125,
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
														"texture": "Fx/Gradients/dGrad02.png",
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
																	"time": -0.12937500000000002,
																	"value": 0,
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
																	"time": 0.3524241055136151,
																	"value": 1.0416666666666667,
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
																	"time": 0.9112500000000001,
																	"value": 0,
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
											"y": 5.551115123125783e-17,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5000000000000004,
											"scaleY": 3.5,
											"scaleZ": 3.5,
											"rotationX": 3.000000000000002,
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
																	"time": -0.12937500000000002,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.11125,
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
														"progress": 0.6,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/dGrad02.png",
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
																	"time": -0.12937500000000002,
																	"value": 0,
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
																	"time": 0.36242410551361487,
																	"value": 1.0416666666666667,
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
																	"time": 0.9112500000000001,
																	"value": 0,
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
									"type": "object",
									"name": "Impact",
									"enabled": false,
									"editorOnly": true,
									"x": 4.82,
									"y": 0.01,
									"z": 2.52,
									"rotationX": 3.9,
									"children": [
										{
											"type": "emitter",
											"name": "ImpactContrast",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"lifeTime": 0.1,
												"frameDivisionY": 0,
												"animationSpeed": 0,
												"instScale": 4,
												"emitType": "Burst",
												"burstDelay": 0.15,
												"instScale_rand": 0.3,
												"frameDivisionX": 0,
												"instRotation_rand": [
													0,
													0,
													0
												],
												"lifeTimeRand": 0.02,
												"randomColor1": [
													0.615686274509804,
													0.6470588235294118,
													0.7490196078431373,
													1
												],
												"randomColor2": [
													0.615686274509804,
													0.7490196078431373,
													0.7450980392156863,
													1
												],
												"warmUpTime": -0.27,
												"instStretch": [
													0.7,
													1.75,
													1
												],
												"instStretch_rand": [
													0.25,
													0.5,
													0
												]
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.09999999999999999,
											"children": [
												{
													"type": "model",
													"name": "PlanePivBot_NoVrtx",
													"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
													"rotationX": 90,
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
																			"time": 0,
																			"value": 0.43333333333333335,
																			"mode": 2
																		},
																		{
																			"time": 0.72,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.022847819119101713,
																				"dt": -0.2399021007505667
																			},
																			"nextHandle": {
																				"dv": -0.016666666666666607,
																				"dt": 0.17499999999999993
																			}
																		},
																		{
																			"time": 1,
																			"value": 0.7,
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
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/causticTexture_03-2-Blured.png",
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
																				"dv": -0.009691703115208502,
																				"dt": -0.5000918807447791
																			},
																			"nextHandle": {
																				"dv": 0.016666666666666607,
																				"dt": 0.86
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
															"type": "curve",
															"name": "instScale",
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
																		"dv": -0.08024691358024694,
																		"dt": -0.4537982014936748
																	},
																	"nextHandle": {
																		"dv": 0.06746020731085037,
																		"dt": 0.3709811696857443
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
													"name": "instStretch.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.7933949939898362,
																"dt": -0.14590332154493602
															},
															"nextHandle": {
																"dv": 0.9833333333333334,
																"dt": 0.07888888888888888
															}
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.7833333333333333
															},
															"nextHandle": {
																"dv": -6.123233995736766e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "Impact",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"lifeTime": 0.1,
												"frameDivisionY": 0,
												"animationSpeed": 0,
												"instScale": 1.75,
												"emitType": "Burst",
												"burstDelay": 0.15,
												"instScale_rand": 0.3,
												"frameDivisionX": 0,
												"lifeTimeRand": 0.02,
												"randomColor1": [
													0.615686274509804,
													0.6470588235294118,
													0.7490196078431373,
													1
												],
												"randomColor2": [
													0.615686274509804,
													0.7490196078431373,
													0.7450980392156863,
													1
												],
												"warmUpTime": -0.3,
												"instStretch": [
													0.55,
													1.6,
													1
												],
												"instStretch_rand": [
													0.15,
													0.35,
													0
												]
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "model",
													"name": "PlanePivBot_NoVrtx",
													"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
													"rotationX": 90,
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
																			"time": 0,
																			"value": 0.43333333333333335,
																			"mode": 2
																		},
																		{
																			"time": 0.72,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.022847819119101713,
																				"dt": -0.2399021007505667
																			},
																			"nextHandle": {
																				"dv": -0.016666666666666607,
																				"dt": 0.17499999999999993
																			}
																		},
																		{
																			"time": 1,
																			"value": 0.7,
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
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/causticTexture_03-2-Blured.png",
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
																				"dv": -0.009691703115208502,
																				"dt": -0.5000918807447791
																			},
																			"nextHandle": {
																				"dv": 0.016666666666666607,
																				"dt": 0.86
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
																	0.9921568627450981,
																	0.8235294117647058,
																	0.6627450980392157
																]
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
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.08024691358024694,
																		"dt": -0.4537982014936748
																	},
																	"nextHandle": {
																		"dv": 0.06746020731085037,
																		"dt": 0.3709811696857443
																	}
																}
															]
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.7833333333333333
															},
															"nextHandle": {
																"dv": -6.123233995736766e-16,
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
									"type": "emitter",
									"name": "Sparkles02",
									"enabled": false,
									"editorOnly": true,
									"props": {
										"emitType": "Burst",
										"burstParticleCount": 10,
										"emitOrientation": "Normal",
										"emitAngle": 40,
										"instSpeed": [
											30,
											0,
											0
										],
										"lifeTime": 0.2,
										"warmUpTime": -0.62,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.4,
										"instScale_rand": 0.1,
										"instSpeed_rand": [
											7,
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157,
											1
										],
										"randomColor2": [
											0.9921568627450981,
											0.5058823529411764,
											0.4,
											1
										],
										"lifeTimeRand": 0.1,
										"burstDelay": 0.75,
										"emitShape": "Cone"
									},
									"x": 4.94,
									"y": 0.01,
									"z": 2.51,
									"rotationX": 90,
									"rotationY": 1.7,
									"rotationZ": -90,
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
															"emissive": 6
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
													"value": 0.2,
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
										"emitAngle": 90,
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
										"warmUpTime": -0.4,
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
									"x": 4.23,
									"y": -0.94,
									"z": -1.43,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.1,
									"rotationZ": -20,
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
			"target": "FXAnimation.FXRoot.Female01_FreeCompany.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
		},
		{
			"type": "constraint",
			"name": "constraint",
			"editorOnly": true,
			"object": "FXAnimation.KnifeL",
			"target": "FXAnimation.FXRoot.Female01_FreeCompany.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_Weapon_L"
		}
	]
}