{
	"type": "fx",
	"duration": 1.3,
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
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"editorOnly": true,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": -0.1,
							"animation": "Anim/Male01/Anim_Male01_AttackMelee02.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Attack02",
					"y": -0.01,
					"z": 0.15,
					"rotationX": -3.8,
					"children": [
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
								"warmUpTime": -1.05,
								"emitType": "Burst",
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instSpeed": [
									10,
									0,
									0
								]
							},
							"x": 3.04,
							"y": 0.9,
							"z": -0.08000000000000002,
							"scaleX": 0.5,
							"scaleY": 0.4999999999999999,
							"scaleZ": 0.09999999999999998,
							"rotationX": -7.951386703658793e-16,
							"rotationZ": 24.5,
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
											"enabled": false,
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
															"time": 1.5,
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
							"type": "polygon",
							"name": "Slash",
							"x": 0.7000000000000001,
							"y": 0.24,
							"z": 2.3599999999999994,
							"scaleX": 3.5,
							"scaleY": 3.4999999999999996,
							"scaleZ": 3.4999999999999996,
							"rotationX": 150.00000000000003,
							"kind": 1,
							"args": [
								24,
								290,
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
										"envBlend": 0.4,
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
													"time": -0.0338614540466395,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.0111385459533604,
													"value": 1.067704238891602,
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
													"time": -0.0667215363511664,
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
													"time": 0.37613854595336055,
													"value": 1.0416666666666667,
													"mode": 1,
													"prevHandle": {
														"dv": -1.0046296296296298,
														"dt": -0.06620842174634933
													},
													"nextHandle": {
														"dv": -0.9548611111111112,
														"dt": 0.03999999999999987
													}
												},
												{
													"time": 0.8811385459533605,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01736111111111116,
														"dt": -0.41500000000000004
													},
													"nextHandle": {
														"dv": 0.008028060909314363,
														"dt": 0.1919027679762546
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
										"progress": 0.27,
										"saturation": 1,
										"width": 0.44,
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
									"isInstance": true
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
													"time": 0.36861084726987675,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.37861084726987676,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3947141383893096,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4047141383893096,
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
							"name": "SlashBackup",
							"enabled": false,
							"x": 0.7,
							"y": -8.06041,
							"z": 2.405,
							"children": [
								{
									"type": "polygon",
									"name": "SlashDistort",
									"x": 1.1102230246251565e-16,
									"y": 0.02499999999999994,
									"z": 0.04500000000000082,
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 3.5,
									"rotationX": 150.00000000000003,
									"kind": 1,
									"args": [
										24,
										290,
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
															"time": -0.0338614540466395,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 0.44613854595336044,
															"value": 0.11623109436035162,
															"mode": 0
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
															"time": -0.0667215363511664,
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
															"time": 0.37613854595336055,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9548611111111112,
																"dt": 0.03999999999999987
															}
														},
														{
															"time": 0.8811385459533605,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01736111111111116,
																"dt": -0.41500000000000004
															},
															"nextHandle": {
																"dv": 0.008028060909314363,
																"dt": 0.1919027679762546
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
									"name": "Slash",
									"x": 1.1102230246251565e-16,
									"y": -0.02499999999999991,
									"z": -0.04499999999999993,
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 3.5,
									"rotationX": 150.00000000000003,
									"kind": 1,
									"args": [
										24,
										290,
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
												"envBlend": 0.4,
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
															"time": -0.0338614540466395,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.0111385459533604,
															"value": 1.067704238891602,
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
															"time": -0.0667215363511664,
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
															"time": 0.37613854595336055,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9548611111111112,
																"dt": 0.03999999999999987
															}
														},
														{
															"time": 0.8811385459533605,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01736111111111116,
																"dt": -0.41500000000000004
															},
															"nextHandle": {
																"dv": 0.008028060909314363,
																"dt": 0.1919027679762546
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
												"progress": 0.27,
												"saturation": 1,
												"width": 0.44,
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
											"isInstance": true
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashImpact",
									"enabled": false,
									"x": 1.1102230246251565e-16,
									"y": -0.02499999999999991,
									"z": -0.04499999999999993,
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 3.5,
									"rotationX": 150.00000000000003,
									"kind": 1,
									"args": [
										24,
										290,
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
															"time": -0.0667215363511664,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.40234663671938065,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.41234663671938065,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.42234663671938066,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.8661385459533604,
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
												"envBlend": 0.4,
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
															"time": -0.0338614540466395,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.0111385459533604,
															"value": 1.067704238891602,
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
															"time": -0.0667215363511664,
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
															"time": 0.37613854595336055,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9548611111111112,
																"dt": 0.03999999999999987
															}
														},
														{
															"time": 0.8811385459533605,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01736111111111116,
																"dt": -0.41500000000000004
															},
															"nextHandle": {
																"dv": 0.008028060909314363,
																"dt": 0.1919027679762546
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
												"progress": 0.27,
												"saturation": 1,
												"width": 0.44,
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
											"isInstance": true
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashContrast",
									"x": 1.1102230246251565e-16,
									"y": -0.02499999999999991,
									"z": -0.04499999999999993,
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 3.5,
									"rotationX": 150.00000000000003,
									"kind": 1,
									"args": [
										24,
										290,
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
															"time": -0.0667215363511664,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3727409503791512,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.38274095037915123,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3967991778058173,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4067991778058173,
															"value": 0.016666666666666663,
															"mode": 2
														},
														{
															"time": 1.8661385459533604,
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
															"time": -0.0338614540466395,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.0111385459533604,
															"value": 1.067704238891602,
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
															"time": -0.0667215363511664,
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
															"time": 0.37613854595336055,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9548611111111112,
																"dt": 0.03999999999999987
															}
														},
														{
															"time": 0.8811385459533605,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01736111111111116,
																"dt": -0.41500000000000004
															},
															"nextHandle": {
																"dv": 0.008028060909314363,
																"dt": 0.1919027679762546
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
			]
		}
	]
}