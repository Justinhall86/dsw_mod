{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "Backup Back",
			"enabled": false,
			"editorOnly": true,
			"x": -5.6073247474426315,
			"y": -5.67686614046143,
			"z": 0.46,
			"scaleX": 1.0000000000000002,
			"scaleY": 1.0000000000000002,
			"rotationZ": 106.66813476633583,
			"children": [
				{
					"type": "emitter",
					"name": "SandCloud",
					"props": {
						"instScale_rand": 0.5,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.5372549019607843,
							0.39215686274509803,
							0.8352941176470589,
							1
						],
						"instRotation_rand": [
							0,
							0,
							30
						],
						"lifeTimeRand": 0.2,
						"useRandomColor": true,
						"emitShape": "Box",
						"emitSurface": true,
						"instScale": 8,
						"emitAngle": 50,
						"emitRad1": 0.64,
						"emitRad2": 0.89,
						"randomColor2": [
							0.9176470588235294,
							0.8470588235294118,
							0.7490196078431373,
							1
						],
						"instSpeed_rand": [
							2,
							-0.5,
							0
						],
						"maxCount": 30,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
						"instWorldAcceleration_rand": [
							1,
							1,
							0
						],
						"instSpeed": [
							-1,
							-4,
							0
						],
						"instStartSpeed_rand": [
							0,
							0,
							0
						],
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"emitRate": 7,
						"seedGroup": 3,
						"emitOrientation": "Speed",
						"lifeTime": 2,
						"speedFactor": 0.5,
						"instAcceleration": [
							0,
							2,
							0
						],
						"instAcceleration_rand": [
							0,
							0.5,
							0
						]
					},
					"z": -1.1102230246251565e-16,
					"scaleX": 5.000000000000002,
					"scaleY": 0.5000000000000001,
					"scaleZ": 0.1,
					"rotationZ": 89.99999999999999,
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1.25
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
									"value": 0.4,
									"mode": 0,
									"prevHandle": {
										"dv": -1.236479282759262,
										"dt": -0.0032575169787558865
									},
									"nextHandle": {
										"dv": 0.7387405130927535,
										"dt": 0.00148829710014603
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.684644317626953
									},
									"nextHandle": {
										"dv": -1.510204380710576e-16,
										"dt": 0.3333333333333333
									}
								}
							]
						},
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
											"culling": "None",
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
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
														"dv": 0.6557055266964653,
														"dt": -0.3577545223100438
													},
													"nextHandle": {
														"dv": -0.6611111111111111,
														"dt": 0.36065369438940603
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
										"range": 0.2,
										"power": 0.5
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.25,
									"dirIntensity": 0.5,
									"dirSpan": 0.9,
									"sandBlend": 0.5,
									"envBlend": 0.4
								}
							]
						},
						{
							"type": "curve",
							"name": "instSpeed.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 2.453671028540081,
										"dt": -0.28834159879932764
									},
									"nextHandle": {
										"dv": -1.1333333333333333,
										"dt": 0.13313282189368175
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.8307967958813863
									},
									"nextHandle": {
										"dv": -9.808236876471888e-16,
										"dt": 0.3333333333333333
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
										"dv": 2.453671028540081,
										"dt": -0.28834159879932764
									},
									"nextHandle": {
										"dv": -1.1333333333333333,
										"dt": 0.13313282189368175
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.8307967958813863
									},
									"nextHandle": {
										"dv": -9.808236876471888e-16,
										"dt": 0.3333333333333333
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "SpiceClouds",
					"props": {
						"instScale_rand": 0.5,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.47058823529411764,
							0.39215686274509803,
							0.8352941176470589,
							1
						],
						"instRotation_rand": [
							0,
							0,
							30
						],
						"lifeTimeRand": 0.2,
						"useRandomColor": true,
						"emitShape": "Box",
						"emitSurface": true,
						"instScale": 5,
						"emitAngle": 50,
						"emitRad1": 0.64,
						"emitRad2": 0.89,
						"randomColor2": [
							0.4823529411764706,
							0.3058823529411765,
							0.4823529411764706,
							1
						],
						"instSpeed_rand": [
							2,
							-0.5,
							0
						],
						"maxCount": 30,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Dust_4x4_03.png",
						"instWorldAcceleration_rand": [
							1,
							1,
							0
						],
						"instSpeed": [
							-1,
							-4,
							0
						],
						"instStartSpeed_rand": [
							0,
							0,
							0
						],
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"seedGroup": 1,
						"emitOrientation": "Speed",
						"lifeTime": 2,
						"speedFactor": 0.5,
						"instAcceleration": [
							0,
							2,
							0
						],
						"instAcceleration_rand": [
							0,
							0.5,
							0
						],
						"emitRate": 4
					},
					"x": 4.440892098500626e-16,
					"z": -5.551115123125783e-17,
					"scaleX": 5.000000000000002,
					"scaleY": 0.5000000000000001,
					"scaleZ": 0.1,
					"rotationZ": 89.99999999999999,
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1.5
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
									"value": 0.4,
									"mode": 0,
									"prevHandle": {
										"dv": -1.236479282759262,
										"dt": -0.0032575169787558865
									},
									"nextHandle": {
										"dv": 0.7387405130927535,
										"dt": 0.00148829710014603
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.684644317626953
									},
									"nextHandle": {
										"dv": -1.510204380710576e-16,
										"dt": 0.3333333333333333
									}
								}
							]
						},
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
											"culling": "None",
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
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
														"dv": 0.6557055266964653,
														"dt": -0.3577545223100438
													},
													"nextHandle": {
														"dv": -0.6611111111111111,
														"dt": 0.36065369438940603
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
										"range": 0.2,
										"power": 0.5
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.5,
									"dirIntensity": 0.5,
									"dirSpan": 0.9,
									"sandBlend": 0.2,
									"envBlend": 0.5
								}
							]
						},
						{
							"type": "curve",
							"name": "instSpeed.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 2.453671028540081,
										"dt": -0.28834159879932764
									},
									"nextHandle": {
										"dv": -1.1333333333333333,
										"dt": 0.13313282189368175
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.8307967958813863
									},
									"nextHandle": {
										"dv": -9.808236876471888e-16,
										"dt": 0.3333333333333333
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
										"dv": 2.453671028540081,
										"dt": -0.28834159879932764
									},
									"nextHandle": {
										"dv": -1.1333333333333333,
										"dt": 0.13313282189368175
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.8307967958813863
									},
									"nextHandle": {
										"dv": -9.808236876471888e-16,
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
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Anim",
					"editorOnly": true,
					"scaleX": 0.9999999999999999,
					"scaleY": 0.9999999999999999,
					"rotationZ": -101.99689008787058,
					"children": [
						{
							"type": "curve",
							"name": "rotation.z",
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 2
								},
								{
									"time": 80,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Harvester",
					"scaleX": 0.35,
					"scaleY": 0.35,
					"scaleZ": 0.35,
					"children": [
						{
							"type": "model",
							"name": "Vehicule_Harvester",
							"source": "Vehicle/Atreide/Harvester/Vehicule_Harvester.fbx",
							"editorOnly": true,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"animation": "Anim/Harvester/Anim_Harvester_Harvest.fbx"
						},
						{
							"type": "emitter",
							"name": "Smoke_Front",
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 0.5,
								"maxCount": 100,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"simulationSpace": "World",
								"instStretch_rand": [
									0.5,
									0.5,
									0.5
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0.08,
								"randomColor1": [
									0.8823529411764706,
									0.9411764705882353,
									1,
									1
								],
								"randomColor2": [
									1,
									1,
									1,
									0.6313725490196078
								],
								"emitAngle": 0,
								"lifeTimeRand": 0.5,
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
								"enableSort": false,
								"speedFactor": 0.3,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
								"instScale": 2,
								"seedGroup": 3,
								"instOrbitSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 11
							},
							"x": 3.99,
							"z": 0.88,
							"scaleX": 0.8300000000000001,
							"scaleY": 7,
							"scaleZ": 0.8300000000000001,
							"rotationZ": -180,
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
													"keys": [
														{
															"time": 0,
															"value": 0.41887902047863906,
															"mode": 2
														},
														{
															"time": 0,
															"value": 0.41887902047863906,
															"mode": 2
														},
														{
															"time": 0.28,
															"value": 0.03333333333333333,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keys": [
														{
															"time": 0,
															"value": 0.4666666666666667,
															"mode": 2
														},
														{
															"time": 0.28,
															"value": 0.016666666666666663,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keys": [
														{
															"time": 0,
															"value": 0.5519999062058306,
															"mode": 2
														},
														{
															"time": 0.28,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1.5
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
															"value": -0.032878787878787896,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.03170677589602635
															}
														},
														{
															"time": 0.24318012753047186,
															"value": 1.00335101010101,
															"mode": 0,
															"prevHandle": {
																"dv": 0.008786899796430459,
																"dt": -0.03490382642970474
															},
															"nextHandle": {
																"dv": -0.22055555555555562,
																"dt": 0.8749999999999999
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"enabled": false,
											"props": {
												"REVERSE": false,
												"range": 0.1,
												"power": 0.1
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
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
																"dv": 0.1614372094585777,
																"dt": -0.537585907497062
															},
															"nextHandle": {
																"dv": -0.16666666666666674,
																"dt": 0.5549999999999999
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8333333333333333,
																"dt": -0.30000000000000004
															},
															"nextHandle": {
																"dv": -0.7113159996271997,
																"dt": 0.25607375986579195
															}
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
											"topIntensity": 0.3,
											"topSpan": 0.4,
											"dirIntensity": 0.45,
											"dirSpan": 0.67,
											"sandBlend": 0.7,
											"envBlend": 0.6
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
												"progress": 0.4,
												"saturation": 1,
												"width": 0.5,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
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
																"dv": 2.2033971051919433e-16,
																"dt": -0.5397630827254113
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.7749999999999999
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.7,
																"dt": -0.14500000000000002
															},
															"nextHandle": {
																"dv": -0.9143298895582741,
																"dt": 0.18939690569421394
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.021504928795595086,
																"dt": -0.4999895944975692
															},
															"nextHandle": {
																"dv": -0.033333333333333326,
																"dt": 0.7749999999999999
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
											"value": 0.7043395109298409,
											"mode": 2
										},
										{
											"time": 1,
											"value": 2.2249070841396517,
											"mode": 0,
											"prevHandle": {
												"dv": -0.07237122028132559,
												"dt": -0.5349999999999999
											},
											"nextHandle": {
												"dv": 0.04162030102982175,
												"dt": 0.30767563355153715
											}
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
											"time": 1,
											"value": 33.03703703703634,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Smoke_Front",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 0.5,
								"maxCount": 100,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"simulationSpace": "World",
								"instStretch_rand": [
									0.3,
									0.3,
									0.3
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0.08,
								"randomColor1": [
									0.8823529411764706,
									0.9411764705882353,
									1,
									1
								],
								"randomColor2": [
									1,
									1,
									1,
									0.6313725490196078
								],
								"emitAngle": 0,
								"lifeTimeRand": 0.2,
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
								"enableSort": false,
								"speedFactor": 0.3,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instScale": 2,
								"seedGroup": 3,
								"instOrbitSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTime": 0.5
							},
							"x": 0.21,
							"y": 3.52,
							"z": 0.14,
							"scaleX": 0.8300000000000001,
							"scaleY": 8,
							"scaleZ": 0.8300000000000001,
							"rotationZ": 86.3,
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
												"alpha": 2
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
															"value": -0.032878787878787896,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.03170677589602635
															}
														},
														{
															"time": 0.09499999999999999,
															"value": 0.9863636363636362,
															"mode": 0,
															"prevHandle": {
																"dv": 0.008786899796430459,
																"dt": -0.03490382642970474
															},
															"nextHandle": {
																"dv": -0.22055555555555562,
																"dt": 0.8749999999999999
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5019607843137255,
													0.1843137254901961,
													0.48627450980392156
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0,
															"value": 5.190814528284312,
															"mode": 2
														},
														{
															"time": 0,
															"value": 0.41887902047863906,
															"mode": 2
														},
														{
															"time": 0.845,
															"value": 0.03333333333333333,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keys": [
														{
															"time": 0,
															"value": 0.26331547350312273,
															"mode": 2
														},
														{
															"time": 0.845,
															"value": 0.016666666666666663,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.845,
															"value": 1,
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
												"range": 0.1,
												"power": 0.5
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
												"saturation": 1,
												"width": 0.3,
												"uvScaleX": 0.2,
												"uvScaleY": 0.2,
												"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
																"dv": 0.1614372094585777,
																"dt": -0.537585907497062
															},
															"nextHandle": {
																"dv": -0.16666666666666674,
																"dt": 0.5549999999999999
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8333333333333333,
																"dt": -0.30000000000000004
															},
															"nextHandle": {
																"dv": -0.7113159996271997,
																"dt": 0.25607375986579195
															}
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
											"topIntensity": 0.3,
											"topSpan": 0.4,
											"dirIntensity": 0.45,
											"dirSpan": 0.67,
											"sandBlend": 0.7,
											"envBlend": 0.6
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
												"progress": 0.4,
												"saturation": 1,
												"width": 0.5,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
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
																"dv": 2.2033971051919433e-16,
																"dt": -0.5397630827254113
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.7749999999999999
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.7,
																"dt": -0.14500000000000002
															},
															"nextHandle": {
																"dv": -0.9143298895582741,
																"dt": 0.18939690569421394
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.021504928795595086,
																"dt": -0.4999895944975692
															},
															"nextHandle": {
																"dv": -0.033333333333333326,
																"dt": 0.7749999999999999
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
											"value": 0.7043395109298409,
											"mode": 2
										},
										{
											"time": 1,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -1.3021822518231996,
												"dt": -0.65
											},
											"nextHandle": {
												"dv": 0.5825276918039374,
												"dt": 0.2911654111732722
											}
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
											"time": 1,
											"value": 33.03703703703634,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Smoke_Front",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 0.5,
								"maxCount": 100,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"simulationSpace": "World",
								"instStretch_rand": [
									0.3,
									0.3,
									0.3
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0.08,
								"randomColor1": [
									0.8823529411764706,
									0.9411764705882353,
									1,
									1
								],
								"randomColor2": [
									1,
									1,
									1,
									0.6313725490196078
								],
								"emitAngle": 0,
								"lifeTimeRand": 0.2,
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
								"enableSort": false,
								"speedFactor": 0.3,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"instScale": 2,
								"seedGroup": 3,
								"instOrbitSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTime": 0.5
							},
							"x": 0.44,
							"y": -3.51,
							"z": 0.14,
							"scaleX": 0.8300000000000001,
							"scaleY": 8,
							"scaleZ": 0.8300000000000001,
							"rotationZ": 90.8,
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
												"alpha": 2
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
															"value": -0.032878787878787896,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.03170677589602635
															}
														},
														{
															"time": 0.09499999999999999,
															"value": 0.9863636363636362,
															"mode": 0,
															"prevHandle": {
																"dv": 0.008786899796430459,
																"dt": -0.03490382642970474
															},
															"nextHandle": {
																"dv": -0.22055555555555562,
																"dt": 0.8749999999999999
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5019607843137255,
													0.1843137254901961,
													0.48627450980392156
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0,
															"value": 5.190814528284312,
															"mode": 2
														},
														{
															"time": 0,
															"value": 0.41887902047863906,
															"mode": 2
														},
														{
															"time": 0.845,
															"value": 0.03333333333333333,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keys": [
														{
															"time": 0,
															"value": 0.26331547350312273,
															"mode": 2
														},
														{
															"time": 0.845,
															"value": 0.016666666666666663,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.845,
															"value": 1,
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
												"range": 0.1,
												"power": 0.5
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
												"saturation": 1,
												"width": 0.3,
												"uvScaleX": 0.2,
												"uvScaleY": 0.2,
												"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
																"dv": 0.1614372094585777,
																"dt": -0.537585907497062
															},
															"nextHandle": {
																"dv": -0.16666666666666674,
																"dt": 0.5549999999999999
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8333333333333333,
																"dt": -0.30000000000000004
															},
															"nextHandle": {
																"dv": -0.7113159996271997,
																"dt": 0.25607375986579195
															}
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
											"topIntensity": 0.3,
											"topSpan": 0.4,
											"dirIntensity": 0.45,
											"dirSpan": 0.67,
											"sandBlend": 0.7,
											"envBlend": 0.6
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
												"progress": 0.4,
												"saturation": 1,
												"width": 0.5,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
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
																"dv": 2.2033971051919433e-16,
																"dt": -0.5397630827254113
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.7749999999999999
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.7,
																"dt": -0.14500000000000002
															},
															"nextHandle": {
																"dv": -0.9143298895582741,
																"dt": 0.18939690569421394
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.021504928795595086,
																"dt": -0.4999895944975692
															},
															"nextHandle": {
																"dv": -0.033333333333333326,
																"dt": 0.7749999999999999
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
											"value": 0.7043395109298409,
											"mode": 2
										},
										{
											"time": 1,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -1.358235001326388,
												"dt": -0.6190476190476191
											},
											"nextHandle": {
												"dv": 0.7546721809116912,
												"dt": 0.3432981752322093
											}
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
											"time": 1,
											"value": 33.03703703703634,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Chimney",
							"x": -3.96,
							"z": 5.2,
							"children": [
								{
									"type": "emitter",
									"name": "Smoke_Big_1",
									"props": {
										"lifeTime": 6,
										"alignMode": "Screen",
										"instScale_rand": 0.5,
										"maxCount": 100,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"simulationSpace": "World",
										"instStretch_rand": [
											0.1,
											0.1,
											0.1
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0.08,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"emitAngle": 0,
										"lifeTimeRand": 1,
										"instSpeed": [
											0.02,
											0,
											1
										],
										"instSpeed_rand": [
											0.01,
											0.025,
											0.2
										],
										"instAcceleration": [
											0.2,
											0,
											0
										],
										"instAcceleration_rand": [
											0,
											0.1,
											0.2
										],
										"enableSort": false,
										"speedFactor": 0.3,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
										"instScale": 2.3,
										"seedGroup": 2,
										"tag": null
									},
									"x": 0.76,
									"y": -0.63,
									"z": -0.38,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": -19.1,
									"rotationY": 29.9,
									"rotationZ": 149.4,
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
														"scale": 2
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "color.h",
															"keys": [
																{
																	"time": 0,
																	"value": 0.41887902047863906,
																	"mode": 2
																},
																{
																	"time": 0,
																	"value": 0.41887902047863906,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.03333333333333333,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"keys": [
																{
																	"time": 0,
																	"value": 0.6,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.016666666666666663,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"keys": [
																{
																	"time": 0,
																	"value": 0.5519999062058306,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 1,
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
														"uvScaleX": 0.2,
														"uvScaleY": 0.2,
														"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
																		"dv": 0.1614372094585777,
																		"dt": -0.537585907497062
																	},
																	"nextHandle": {
																		"dv": -0.16666666666666674,
																		"dt": 0.5549999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.8333333333333333,
																		"dt": -0.30000000000000004
																	},
																	"nextHandle": {
																		"dv": -0.7113159996271997,
																		"dt": 0.25607375986579195
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.44516906872488615,
																		"dt": -0.4813254700769495
																	},
																	"nextHandle": {
																		"dv": -0.30000000000000004,
																		"dt": 0.325048007965088
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.36666666666666664,
																		"dt": -0.2694946861267089
																	},
																	"nextHandle": {
																		"dv": -0.36666666666666664,
																		"dt": 0.2694946861267089
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
														"progress": 0.4,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
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
																		"dv": 2.2033971051919433e-16,
																		"dt": -0.5397630827254113
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.7749999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.7,
																		"dt": -0.14500000000000002
																	},
																	"nextHandle": {
																		"dv": -0.9143298895582741,
																		"dt": 0.18939690569421394
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.021504928795595086,
																		"dt": -0.4999895944975692
																	},
																	"nextHandle": {
																		"dv": -0.033333333333333326,
																		"dt": 0.7749999999999999
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
													"topIntensity": 0.3,
													"topSpan": 0.4,
													"dirIntensity": 0.45,
													"dirSpan": 0.67,
													"sandBlend": 0.7,
													"envBlend": 0.6
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
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.06,
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
											"name": "instSpeed.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": -0.026997755331088613,
													"mode": 0,
													"prevHandle": {
														"dv": -3.804478157639296,
														"dt": -0.1254911758516944
													},
													"nextHandle": {
														"dv": 0.8159708193041526,
														"dt": 0.026899705581763078
													}
												},
												{
													"time": 0.04804712461674793,
													"value": 0.8593153759820427,
													"mode": 0
												},
												{
													"time": 0.7252142857142857,
													"value": 0.15589225589225586,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.24173809523809522
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.24173809523809522
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 1.8583185031426556e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.14172795189504372
													}
												},
												{
													"time": 0.16999999999999998,
													"value": 1.0066758116140837,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.056666666666666664
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.22999999999999998
													}
												},
												{
													"time": 0.8443367346938775,
													"value": 0.24709315375982055,
													"mode": 0,
													"prevHandle": {
														"dv": -0.09289936401047516,
														"dt": -0.23928571428571432
													},
													"nextHandle": {
														"dv": 0.1080057274948862,
														"dt": 0.28240124663407146
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.0049999999999999975,
													"value": 1.0333333333333334,
													"mode": 0,
													"prevHandle": {
														"dv": 0.851303742790108,
														"dt": -0.48341891108438234
													},
													"nextHandle": {
														"dv": -0.4666666666666668,
														"dt": 0.265
													}
												},
												{
													"time": 0.9884999999999998,
													"value": 0.1696969696969698,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3266666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3266666666666666
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
													"value": 1.504034788726423,
													"mode": 2
												},
												{
													"time": 1,
													"value": 3,
													"mode": 0,
													"prevHandle": {
														"dv": -0.07237122028132559,
														"dt": -0.5349999999999999
													},
													"nextHandle": {
														"dv": 0.04162030102982175,
														"dt": 0.30767563355153715
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Smoke_Big_2",
									"props": {
										"lifeTime": 6,
										"alignMode": "Screen",
										"instScale_rand": 0.5,
										"maxCount": 100,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"simulationSpace": "World",
										"instStretch_rand": [
											0.1,
											0.1,
											0.1
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0.08,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"emitAngle": 0,
										"lifeTimeRand": 1,
										"instSpeed": [
											0.02,
											0,
											1
										],
										"instSpeed_rand": [
											0.01,
											0.025,
											0.2
										],
										"instAcceleration": [
											0.2,
											0,
											0
										],
										"instAcceleration_rand": [
											0,
											0.1,
											0.2
										],
										"enableSort": false,
										"speedFactor": 0.3,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
										"instScale": 2.3,
										"seedGroup": 30
									},
									"x": 0.76,
									"y": 0.73,
									"z": -0.38,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": -19.1,
									"rotationY": 29.9,
									"rotationZ": 149.4,
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
														"scale": 2
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "color.h",
															"keys": [
																{
																	"time": 0,
																	"value": 0.41887902047863906,
																	"mode": 2
																},
																{
																	"time": 0,
																	"value": 0.41887902047863906,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.03333333333333333,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"keys": [
																{
																	"time": 0,
																	"value": 0.6,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.016666666666666663,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"keys": [
																{
																	"time": 0,
																	"value": 0.5519999062058306,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 1,
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
														"uvScaleX": 0.2,
														"uvScaleY": 0.2,
														"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
																		"dv": 0.1614372094585777,
																		"dt": -0.537585907497062
																	},
																	"nextHandle": {
																		"dv": -0.16666666666666674,
																		"dt": 0.5549999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.8333333333333333,
																		"dt": -0.30000000000000004
																	},
																	"nextHandle": {
																		"dv": -0.7113159996271997,
																		"dt": 0.25607375986579195
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.44516906872488615,
																		"dt": -0.4813254700769495
																	},
																	"nextHandle": {
																		"dv": -0.30000000000000004,
																		"dt": 0.325048007965088
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.36666666666666664,
																		"dt": -0.2694946861267089
																	},
																	"nextHandle": {
																		"dv": -0.36666666666666664,
																		"dt": 0.2694946861267089
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
														"progress": 0.4,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
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
																		"dv": 2.2033971051919433e-16,
																		"dt": -0.5397630827254113
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.7749999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.7,
																		"dt": -0.14500000000000002
																	},
																	"nextHandle": {
																		"dv": -0.9143298895582741,
																		"dt": 0.18939690569421394
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.021504928795595086,
																		"dt": -0.4999895944975692
																	},
																	"nextHandle": {
																		"dv": -0.033333333333333326,
																		"dt": 0.7749999999999999
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
													"topIntensity": 0.3,
													"topSpan": 0.4,
													"dirIntensity": 0.45,
													"dirSpan": 0.67,
													"sandBlend": 0.7,
													"envBlend": 0.6
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
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.06,
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
											"name": "instSpeed.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": -0.026997755331088613,
													"mode": 0,
													"prevHandle": {
														"dv": -3.804478157639296,
														"dt": -0.1254911758516944
													},
													"nextHandle": {
														"dv": 0.8159708193041526,
														"dt": 0.026899705581763078
													}
												},
												{
													"time": 0.04804712461674793,
													"value": 0.8593153759820427,
													"mode": 0
												},
												{
													"time": 0.7252142857142857,
													"value": 0.15589225589225586,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.24173809523809522
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.24173809523809522
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 1.8583185031426556e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.14172795189504372
													}
												},
												{
													"time": 0.16999999999999998,
													"value": 1.0066758116140837,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.056666666666666664
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.22999999999999998
													}
												},
												{
													"time": 0.8443367346938775,
													"value": 0.24709315375982055,
													"mode": 0,
													"prevHandle": {
														"dv": -0.09289936401047516,
														"dt": -0.23928571428571432
													},
													"nextHandle": {
														"dv": 0.1080057274948862,
														"dt": 0.28240124663407146
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.0049999999999999975,
													"value": 1.0333333333333334,
													"mode": 0,
													"prevHandle": {
														"dv": 0.851303742790108,
														"dt": -0.48341891108438234
													},
													"nextHandle": {
														"dv": -0.4666666666666668,
														"dt": 0.265
													}
												},
												{
													"time": 0.9884999999999998,
													"value": 0.1696969696969698,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3266666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3266666666666666
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
													"value": 0.7043395109298409,
													"mode": 2
												},
												{
													"time": 1,
													"value": 3,
													"mode": 0,
													"prevHandle": {
														"dv": -0.07237122028132559,
														"dt": -0.5349999999999999
													},
													"nextHandle": {
														"dv": 0.04162030102982175,
														"dt": 0.30767563355153715
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Smoke_Big_3",
									"props": {
										"lifeTime": 6,
										"alignMode": "Screen",
										"instScale_rand": 0.5,
										"maxCount": 100,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"simulationSpace": "World",
										"instStretch_rand": [
											0.1,
											0.1,
											0.1
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0.08,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"emitAngle": 0,
										"lifeTimeRand": 1,
										"instSpeed": [
											0.02,
											0,
											1
										],
										"instSpeed_rand": [
											0.01,
											0.025,
											0.2
										],
										"instAcceleration": [
											0.2,
											0,
											0
										],
										"instAcceleration_rand": [
											0,
											0.1,
											0.2
										],
										"enableSort": false,
										"speedFactor": 0.3,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
										"instScale": 2.3,
										"seedGroup": 10
									},
									"x": 1.8,
									"y": 3.21,
									"z": -2.13,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 1.25,
									"rotationX": -13.6,
									"rotationY": 23.3,
									"rotationZ": 159.6,
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
														"scale": 2
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "color.h",
															"keys": [
																{
																	"time": 0,
																	"value": 0.41887902047863906,
																	"mode": 2
																},
																{
																	"time": 0,
																	"value": 0.41887902047863906,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.03333333333333333,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"keys": [
																{
																	"time": 0,
																	"value": 0.6,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.016666666666666663,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"keys": [
																{
																	"time": 0,
																	"value": 0.5519999062058306,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 1,
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
														"uvScaleX": 0.2,
														"uvScaleY": 0.2,
														"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
																		"dv": 0.1614372094585777,
																		"dt": -0.537585907497062
																	},
																	"nextHandle": {
																		"dv": -0.16666666666666674,
																		"dt": 0.5549999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.8333333333333333,
																		"dt": -0.30000000000000004
																	},
																	"nextHandle": {
																		"dv": -0.7113159996271997,
																		"dt": 0.25607375986579195
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.44516906872488615,
																		"dt": -0.4813254700769495
																	},
																	"nextHandle": {
																		"dv": -0.30000000000000004,
																		"dt": 0.325048007965088
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.36666666666666664,
																		"dt": -0.2694946861267089
																	},
																	"nextHandle": {
																		"dv": -0.36666666666666664,
																		"dt": 0.2694946861267089
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
														"progress": 0.4,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
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
																		"dv": 2.2033971051919433e-16,
																		"dt": -0.5397630827254113
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.7749999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.7,
																		"dt": -0.14500000000000002
																	},
																	"nextHandle": {
																		"dv": -0.9143298895582741,
																		"dt": 0.18939690569421394
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.021504928795595086,
																		"dt": -0.4999895944975692
																	},
																	"nextHandle": {
																		"dv": -0.033333333333333326,
																		"dt": 0.7749999999999999
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
													"topIntensity": 0.3,
													"topSpan": 0.4,
													"dirIntensity": 0.45,
													"dirSpan": 0.67,
													"sandBlend": 0.7,
													"envBlend": 0.6
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
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.06,
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
											"name": "instSpeed.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": -0.026997755331088613,
													"mode": 0,
													"prevHandle": {
														"dv": -3.804478157639296,
														"dt": -0.1254911758516944
													},
													"nextHandle": {
														"dv": 0.8159708193041526,
														"dt": 0.026899705581763078
													}
												},
												{
													"time": 0.04804712461674793,
													"value": 0.8593153759820427,
													"mode": 0
												},
												{
													"time": 0.7252142857142857,
													"value": 0.15589225589225586,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.24173809523809522
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.24173809523809522
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 1.8583185031426556e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.14172795189504372
													}
												},
												{
													"time": 0.16999999999999998,
													"value": 1.0066758116140837,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.056666666666666664
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.22999999999999998
													}
												},
												{
													"time": 0.8443367346938775,
													"value": 0.24709315375982055,
													"mode": 0,
													"prevHandle": {
														"dv": -0.09289936401047516,
														"dt": -0.23928571428571432
													},
													"nextHandle": {
														"dv": 0.1080057274948862,
														"dt": 0.28240124663407146
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.0049999999999999975,
													"value": 1.0333333333333334,
													"mode": 0,
													"prevHandle": {
														"dv": 0.851303742790108,
														"dt": -0.48341891108438234
													},
													"nextHandle": {
														"dv": -0.4666666666666668,
														"dt": 0.265
													}
												},
												{
													"time": 0.9884999999999998,
													"value": 0.1696969696969698,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3266666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3266666666666666
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
													"value": 0.7043395109298409,
													"mode": 2
												},
												{
													"time": 1,
													"value": 3,
													"mode": 0,
													"prevHandle": {
														"dv": -0.07237122028132559,
														"dt": -0.5349999999999999
													},
													"nextHandle": {
														"dv": 0.04162030102982175,
														"dt": 0.30767563355153715
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Smoke_Big_4",
									"props": {
										"lifeTime": 6,
										"alignMode": "Screen",
										"instScale_rand": 0.5,
										"maxCount": 100,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"simulationSpace": "World",
										"instStretch_rand": [
											0.1,
											0.1,
											0.1
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0.08,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"emitAngle": 0,
										"lifeTimeRand": 1,
										"instSpeed": [
											0.02,
											0,
											1
										],
										"instSpeed_rand": [
											0.01,
											0.025,
											0.2
										],
										"instAcceleration": [
											0.2,
											0,
											0
										],
										"instAcceleration_rand": [
											0,
											0.1,
											0.2
										],
										"enableSort": false,
										"speedFactor": 0.3,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
										"instScale": 2.3,
										"seedGroup": 25
									},
									"x": 1.8,
									"y": -3.21,
									"z": -2.13,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 1.25,
									"rotationX": -11.6,
									"rotationY": 18.1,
									"rotationZ": 157.5,
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
														"scale": 2
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "color.h",
															"keys": [
																{
																	"time": 0,
																	"value": 0.41887902047863906,
																	"mode": 2
																},
																{
																	"time": 0,
																	"value": 0.41887902047863906,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.03333333333333333,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"keys": [
																{
																	"time": 0,
																	"value": 0.6,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.016666666666666663,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"keys": [
																{
																	"time": 0,
																	"value": 0.5519999062058306,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 1,
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
														"uvScaleX": 0.2,
														"uvScaleY": 0.2,
														"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
																		"dv": 0.1614372094585777,
																		"dt": -0.537585907497062
																	},
																	"nextHandle": {
																		"dv": -0.16666666666666674,
																		"dt": 0.5549999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.8333333333333333,
																		"dt": -0.30000000000000004
																	},
																	"nextHandle": {
																		"dv": -0.7113159996271997,
																		"dt": 0.25607375986579195
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.44516906872488615,
																		"dt": -0.4813254700769495
																	},
																	"nextHandle": {
																		"dv": -0.30000000000000004,
																		"dt": 0.325048007965088
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.36666666666666664,
																		"dt": -0.2694946861267089
																	},
																	"nextHandle": {
																		"dv": -0.36666666666666664,
																		"dt": 0.2694946861267089
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
														"progress": 0.4,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
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
																		"dv": 2.2033971051919433e-16,
																		"dt": -0.5397630827254113
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.7749999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.7,
																		"dt": -0.14500000000000002
																	},
																	"nextHandle": {
																		"dv": -0.9143298895582741,
																		"dt": 0.18939690569421394
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.021504928795595086,
																		"dt": -0.4999895944975692
																	},
																	"nextHandle": {
																		"dv": -0.033333333333333326,
																		"dt": 0.7749999999999999
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
													"topIntensity": 0.3,
													"topSpan": 0.4,
													"dirIntensity": 0.45,
													"dirSpan": 0.67,
													"sandBlend": 0.7,
													"envBlend": 0.6
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
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.06,
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
											"name": "instSpeed.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": -0.026997755331088613,
													"mode": 0,
													"prevHandle": {
														"dv": -3.804478157639296,
														"dt": -0.1254911758516944
													},
													"nextHandle": {
														"dv": 0.8159708193041526,
														"dt": 0.026899705581763078
													}
												},
												{
													"time": 0.04804712461674793,
													"value": 0.8593153759820427,
													"mode": 0
												},
												{
													"time": 0.7252142857142857,
													"value": 0.15589225589225586,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.24173809523809522
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.24173809523809522
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 1.8583185031426556e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.14172795189504372
													}
												},
												{
													"time": 0.16999999999999998,
													"value": 1.0066758116140837,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.056666666666666664
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.22999999999999998
													}
												},
												{
													"time": 0.8443367346938775,
													"value": 0.24709315375982055,
													"mode": 0,
													"prevHandle": {
														"dv": -0.09289936401047516,
														"dt": -0.23928571428571432
													},
													"nextHandle": {
														"dv": 0.1080057274948862,
														"dt": 0.28240124663407146
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.0049999999999999975,
													"value": 1.0333333333333334,
													"mode": 0,
													"prevHandle": {
														"dv": 0.851303742790108,
														"dt": -0.48341891108438234
													},
													"nextHandle": {
														"dv": -0.4666666666666668,
														"dt": 0.265
													}
												},
												{
													"time": 0.9884999999999998,
													"value": 0.1696969696969698,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3266666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3266666666666666
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
													"value": 0.7043395109298409,
													"mode": 2
												},
												{
													"time": 1,
													"value": 3,
													"mode": 0,
													"prevHandle": {
														"dv": -0.07237122028132559,
														"dt": -0.5349999999999999
													},
													"nextHandle": {
														"dv": 0.04162030102982175,
														"dt": 0.30767563355153715
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
										"threshold": 0.01,
										"useRGB": false
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "CurvedPlan",
					"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
					"enabled": false,
					"x": -0.45,
					"z": 0.47,
					"scaleX": 2,
					"scaleY": 2.5,
					"scaleZ": 2.3,
					"rotationX": -90,
					"rotationY": -90,
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
							}
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
								"alpha": 1.3,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/circGrad01.png",
								"onDecal": false
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
								"progress": 0.25,
								"saturation": 2,
								"width": 1,
								"uvScaleX": 1.21,
								"uvScaleY": 0.7,
								"texture": "Fx/noise/T_Noise_Dirt_02.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0.06
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
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.6,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"enabled": false,
							"props": {
								"REVERSE": false,
								"range": 2,
								"power": 1
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "model",
					"name": "CurvedPlan",
					"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
					"x": -0.09,
					"z": 0.52,
					"scaleX": 2,
					"scaleY": 2.5,
					"scaleZ": 2,
					"rotationX": -90,
					"rotationY": -90,
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
							}
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
								"alpha": 1.2,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/circGrad01.png",
								"onDecal": false
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
								"progress": 0.21,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 2,
								"texture": "Fx/noise/Wave_01.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0.06
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
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.7,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 0.1,
								"texture": "Fx/noise/perlin06.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0.01
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
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.6,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"enabled": false,
							"props": {
								"REVERSE": false,
								"range": 0.1,
								"power": 1
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "model",
					"name": "HarvestFrontMesh_2",
					"source": "Fx/Vehicle/Harvester/HarvestFrontMesh_2.fbx",
					"x": 1.8,
					"z": 0.49,
					"scaleX": 1.2,
					"scaleY": 1.1,
					"scaleZ": 1.7,
					"rotationY": -40.4,
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
									"parallax": 0,
									"alphaKill": false,
									"enableStencil": false
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
								"texture": "Fx/Gradients/T_Square03.jpg",
								"onDecal": false
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
								"progress": 0.15,
								"saturation": 2,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 0.5,
								"texture": "Fx/noise/Wave_01.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0.15
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
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.7,
								"sandColorSet": false,
								"envBlend": 0.6,
								"envColorSet": false
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "model",
					"name": "HarvestFrontMesh_2",
					"source": "Fx/Vehicle/Harvester/HarvestFrontMesh_2.fbx",
					"x": 1.8,
					"z": 0.49,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.78,
					"rotationY": -40.4,
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
									"parallax": 0,
									"alphaKill": false,
									"enableStencil": false
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
								"texture": "Fx/Gradients/T_Square03.jpg",
								"onDecal": false
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
								"progress": 0.15,
								"saturation": 2,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 0.5,
								"texture": "Fx/noise/T_Noise_Wave_02.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0.15
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
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.7,
								"sandColorSet": false,
								"envBlend": 0.6,
								"envColorSet": false
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
									0.5372549019607843,
									0.3568627450980392,
									0.7019607843137254
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "polygon",
					"name": "polygon",
					"enabled": false,
					"x": -0.03,
					"y": -0.84,
					"z": 0.71,
					"scaleX": 0.17,
					"scaleY": 0.17,
					"scaleZ": 0.17,
					"rotationX": 71.6,
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
									"parallax": 0,
									"emissive": 1
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
								"texture": "Fx/Gradients/circGrad3.jpg"
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
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8893452552251544,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.233370298959369,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 2,
											"value": 0.8893452552251544,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"loop": true,
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
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 2,
											"value": 0.5,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16666666666666666
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.1683333333333333
											}
										},
										{
											"time": 2,
											"value": 0.5,
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
					"name": "polygon",
					"enabled": false,
					"x": -0.03,
					"y": 0.85,
					"z": 0.71,
					"scaleX": 0.17,
					"scaleY": 0.17,
					"scaleZ": 0.17,
					"rotationX": 111.8,
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
									"parallax": 0,
									"emissive": 1
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
								"texture": "Fx/Gradients/circGrad3.jpg"
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
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8893452552251544,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.233370298959369,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 2,
											"value": 0.8893452552251544,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"loop": true,
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
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 2,
											"value": 0.5,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16666666666666666
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.1683333333333333
											}
										},
										{
											"time": 2,
											"value": 0.5,
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
					"name": "polygon_3",
					"enabled": false,
					"x": 0.01,
					"y": -0.26,
					"z": 0.25,
					"scaleX": 0.17,
					"scaleY": 0.17,
					"scaleZ": 0.17,
					"rotationX": 175.3,
					"rotationY": -0.1,
					"rotationZ": 0.2,
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
									"parallax": 0,
									"emissive": 1
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
								"texture": "Fx/Gradients/circGrad3.jpg"
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
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8893452552251544,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.233370298959369,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 2,
											"value": 0.8893452552251544,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"loop": true,
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
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 2,
											"value": 0.5,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16666666666666666
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.1683333333333333
											}
										},
										{
											"time": 2,
											"value": 0.5,
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
					"name": "polygon_4",
					"enabled": false,
					"x": 0.01,
					"y": -0.26,
					"z": 0.24,
					"scaleX": 0.17,
					"scaleY": 0.17,
					"scaleZ": 0.17,
					"rotationX": 174.8,
					"rotationY": -0.1,
					"rotationZ": 0.2,
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
									"parallax": 0,
									"emissive": 1
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
								"texture": "Fx/Gradients/circGrad3.jpg"
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
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8893452552251544,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.233370298959369,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 2,
											"value": 0.8893452552251544,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"loop": true,
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
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 2,
											"value": 0.5,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16666666666666666
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.1683333333333333
											}
										},
										{
											"time": 2,
											"value": 0.5,
											"mode": 2
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
					"object": "FXAnimation.FXRoot.polygon_3",
					"target": "FXAnimation.FXRoot.Harvester.Vehicule_Harvester.B_ROOTJ.B_ChassisJ.B_Steam01Rj"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.polygon_4",
					"target": "FXAnimation.FXRoot.Harvester.Vehicule_Harvester.B_ROOTJ.B_ChassisJ.B_Steam01Lj"
				}
			]
		}
	]
}