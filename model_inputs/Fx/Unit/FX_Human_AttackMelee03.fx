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
							"animation": "Anim/Male01/Anim_Male01_AttackMelee03.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Attack03",
					"y": -0.38,
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
								"warmUpTime": -1.8,
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
							"x": 0.5,
							"z": -0.08,
							"scaleX": 0.5,
							"scaleY": 0.5,
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
							"type": "polygon",
							"name": "Slash",
							"x": 0.4,
							"y": -0.20999999999999996,
							"z": 2.47,
							"scaleX": 3.5000000000000004,
							"scaleY": 3.5000000000000004,
							"scaleZ": 3.4999999999999996,
							"rotationX": 123.89999999999998,
							"rotationY": -27,
							"rotationZ": -16.899999999999995,
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
													"time": 0.2750000000000004,
													"value": -2.425986213684083,
													"mode": 2
												},
												{
													"time": 1.5350000000000004,
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
													"time": -0.10499999999999998,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01026734872793706,
														"dt": -0.49973239728616453
													},
													"nextHandle": {
														"dv": 0.01736111111111105,
														"dt": 0.845
													}
												},
												{
													"time": 0.8249999999999994,
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
													"time": 1.3999999999999995,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.10416666666666669,
														"dt": -0.505
													},
													"nextHandle": {
														"dv": -0.03951710933261162,
														"dt": 0.19157894604450182
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
													"time": 0.8336108472698767,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8436108472698767,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8597141383893094,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8697141383893094,
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
							"x": 0.4,
							"y": -5.22033,
							"z": 2.47,
							"children": [
								{
									"type": "polygon",
									"name": "Slash",
									"scaleX": 3.5000000000000004,
									"scaleY": 3.500000000000001,
									"scaleZ": 3.500000000000001,
									"rotationX": 123.9,
									"rotationY": -27,
									"rotationZ": -16.900000000000002,
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
															"time": 0.2750000000000004,
															"value": -2.425986213684083,
															"mode": 2
														},
														{
															"time": 1.5350000000000004,
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
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01026734872793706,
																"dt": -0.49973239728616453
															},
															"nextHandle": {
																"dv": 0.01736111111111105,
																"dt": 0.845
															}
														},
														{
															"time": 0.8249999999999994,
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
															"time": 1.3999999999999995,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.10416666666666669,
																"dt": -0.505
															},
															"nextHandle": {
																"dv": -0.03951710933261162,
																"dt": 0.19157894604450182
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
									"scaleX": 3.5000000000000004,
									"scaleY": 3.500000000000001,
									"scaleZ": 3.500000000000001,
									"rotationX": 123.9,
									"rotationY": -27,
									"rotationZ": -16.900000000000002,
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
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8517443936250246,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8617443936250246,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8952251345574234,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9052251345574234,
															"value": 0.016666666666666663,
															"mode": 2
														},
														{
															"time": 1.8699999999999999,
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
															"time": 0.2750000000000004,
															"value": -2.425986213684083,
															"mode": 2
														},
														{
															"time": 1.5350000000000004,
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
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01026734872793706,
																"dt": -0.49973239728616453
															},
															"nextHandle": {
																"dv": 0.01736111111111105,
																"dt": 0.845
															}
														},
														{
															"time": 0.8249999999999994,
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
															"time": 1.3999999999999995,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.10416666666666669,
																"dt": -0.505
															},
															"nextHandle": {
																"dv": -0.03951710933261162,
																"dt": 0.19157894604450182
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
									"scaleX": 3.5000000000000004,
									"scaleY": 3.500000000000001,
									"scaleZ": 3.500000000000001,
									"rotationX": 123.9,
									"rotationY": -27,
									"rotationZ": -16.900000000000002,
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
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8256176175576915,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8356176175576915,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8496758449843576,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8596758449843576,
															"value": 0.016666666666666663,
															"mode": 2
														},
														{
															"time": 1.8699999999999999,
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
															"time": 0.2750000000000004,
															"value": -2.425986213684083,
															"mode": 2
														},
														{
															"time": 1.5350000000000004,
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
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01026734872793706,
																"dt": -0.49973239728616453
															},
															"nextHandle": {
																"dv": 0.01736111111111105,
																"dt": 0.845
															}
														},
														{
															"time": 0.8249999999999994,
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
															"time": 1.3999999999999995,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.10416666666666669,
																"dt": -0.505
															},
															"nextHandle": {
																"dv": -0.03951710933261162,
																"dt": 0.19157894604450182
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
									"name": "SlashDistort",
									"scaleX": 3.5000000000000004,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 123.9,
									"rotationY": -27,
									"rotationZ": -16.9,
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
															"time": 0.2750000000000004,
															"value": -2.425986213684083,
															"mode": 2
														},
														{
															"time": 1.5350000000000004,
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
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01026734872793706,
																"dt": -0.49973239728616453
															},
															"nextHandle": {
																"dv": 0.01736111111111105,
																"dt": 0.845
															}
														},
														{
															"time": 0.8249999999999994,
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
															"time": 1.3999999999999995,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.10416666666666669,
																"dt": -0.505
															},
															"nextHandle": {
																"dv": -0.03951710933261162,
																"dt": 0.19157894604450182
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