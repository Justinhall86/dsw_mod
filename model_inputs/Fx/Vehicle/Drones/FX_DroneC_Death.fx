{
	"type": "fx",
	"duration": 16,
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
							"animation": "Anim/DroneC/Anim_DroneC_Death.fbx"
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_Directional_Explosion_Medium",
					"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
					"y": -0.44626,
					"z": 3.12078,
					"rotationX": 33.8,
					"time": -0.4
				},
				{
					"type": "subFX",
					"name": "FX_Directional_Explosion_Low",
					"source": "Fx/Explosion/FX_Directional_Explosion_Low.fx",
					"x": -1.24019,
					"y": 1.42137,
					"z": 3.36179,
					"scaleX": 0.7,
					"scaleY": 0.7,
					"scaleZ": 0.7,
					"rotationX": -70.3,
					"rotationY": -9.3,
					"rotationZ": 24.3
				},
				{
					"type": "subFX",
					"name": "FX_Directional_Explosion_Low",
					"source": "Fx/Explosion/FX_Directional_Explosion_Low.fx",
					"x": 0.23005,
					"y": 0.43973,
					"z": 3.04883,
					"rotationX": -95.6,
					"rotationY": 4.4,
					"rotationZ": -48.8,
					"time": -0.1
				},
				{
					"type": "emitter",
					"name": "SandJet",
					"enabled": false,
					"props": {
						"instScale_rand": 0.9,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9803921568627451,
							0.9254901960784314,
							0.8980392156862745,
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
						"instScale": 6,
						"emitAngle": 90,
						"alignMode": "Screen",
						"lifeTime": 4.5,
						"emitRad1": 0.64,
						"emitRad2": 0.89,
						"randomColor2": [
							0.7490196078431373,
							0.6705882352941176,
							0.6313725490196078,
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
						"maxCount": 5,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
						"warmUpTime": -5.3,
						"emitType": "Burst",
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instSpeed": [
							25,
							0,
							0
						],
						"burstParticleCount": 2
					},
					"x": 4.01386,
					"y": -1.86665,
					"z": -0.61539,
					"scaleZ": 0.1,
					"rotationZ": -33.2,
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
					"type": "emitter",
					"name": "SandJet",
					"enabled": false,
					"props": {
						"instScale_rand": 0.9,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9803921568627451,
							0.9254901960784314,
							0.8980392156862745,
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
						"instScale": 6,
						"emitAngle": 90,
						"alignMode": "Screen",
						"lifeTime": 4.5,
						"emitRad1": 0.64,
						"emitRad2": 0.89,
						"randomColor2": [
							0.7490196078431373,
							0.6705882352941176,
							0.6313725490196078,
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
						"maxCount": 5,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
						"warmUpTime": -5.5,
						"emitType": "Burst",
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instSpeed": [
							25,
							0,
							0
						],
						"burstParticleCount": 2
					},
					"x": 4.36098,
					"y": 0.8142,
					"z": -0.61539,
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
					"type": "emitter",
					"name": "Smoke",
					"props": {
						"instScale_rand": 2,
						"maxCount": 65,
						"animationSpeed": 0.3,
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
							180
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
						"instScale": 7,
						"burstDelay": 0.05,
						"instStretch_rand": [
							0,
							0,
							0
						],
						"emitShape": "Cone",
						"emitRad1": 0.83,
						"emitSurface": true,
						"lifeTimeRand": 0.5,
						"alignMode": "Screen",
						"emitAngle": 16.36,
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instWorldAcceleration_rand": [
							0,
							0.1,
							0
						],
						"lifeTime": 4,
						"instSpeed": [
							2.15,
							0,
							0
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
						"speedFactor": 0.5,
						"instWorldAcceleration": [
							0,
							0.5,
							0
						],
						"enableSort": false,
						"instAcceleration": [
							1,
							1,
							0
						],
						"emitRate": 6,
						"warmUpTime": -0.75
					},
					"x": 1.38451,
					"y": -0.38475,
					"z": 1.16518,
					"scaleX": 2.9999999999999996,
					"scaleY": 3,
					"scaleZ": 2.9999999999999996,
					"rotationX": 82.7,
					"rotationY": -43.1,
					"rotationZ": -81.3,
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
										"scale": 2
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.85
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
														"dv": 0.012744706103127165,
														"dt": -0.03443902804756137
													},
													"nextHandle": {
														"dv": -0.16666666666666674,
														"dt": 0.45123456790123473
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01666666666666672,
														"dt": -0.41135802469135807
													},
													"nextHandle": {
														"dv": 0.012980169199833783,
														"dt": 0.3199852081262777
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
											0.13725490196078433,
											0.13725490196078433,
											0.13725490196078433
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
										"range": 0.5,
										"power": 1
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
										"progress": 0.58,
										"saturation": 0,
										"width": 0.73,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.02,
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
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0.4440584429210647,
														"dt": -0.6148501517368579
													},
													"nextHandle": {
														"dv": -0.21666666666666667,
														"dt": 0.3
													}
												},
												{
													"time": 1,
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": -0.009090909090909038,
														"dt": -0.4642857142857143
													},
													"nextHandle": {
														"dv": 0.008539703073546545,
														"dt": 0.4361348355418391
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
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.75,
									"topSpan": 0.8,
									"dirBrighten": true,
									"dirIntensity": 0.8,
									"dirSpan": 0.9,
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
									"value": 0.3,
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
									"value": 0.9,
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
										"dv": 1.9871071861164984e-16,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.8809876543209877
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.01282051282051282,
										"dt": -0.21777777777777785
									},
									"nextHandle": {
										"dv": 0.019664722888838422,
										"dt": 0.3332806368123195
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
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 0.006932902717983742,
										"dt": -0.5012942970380149
									},
									"nextHandle": {
										"dv": -0.039999999999999925,
										"dt": 3.8604104614257824
									}
								},
								{
									"time": 4.963991682547854,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 1.1318237304687502,
										"dt": -0.04999999999999982
									},
									"nextHandle": {
										"dv": -1.0329692413400184,
										"dt": 0.04796831991252049
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Electricity",
					"x": -0.564375,
					"y": 1.4806249999999999,
					"z": 0.42875,
					"children": [
						{
							"type": "object",
							"name": "Elec01",
							"x": 1.12116,
							"y": -1.73394,
							"z": 2.65527,
							"rotationX": 61.1,
							"rotationY": -149.6,
							"rotationZ": -41.1,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
										"instScale_rand": 0,
										"warmUpTime": -1,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.6,
											1.2,
											1
										],
										"lifeTime": 0.15,
										"instScale": 1.2
									},
									"x": 0.12,
									"y": -0.14,
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "Less",
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Elec02",
							"x": 1.96315,
							"y": 0.97437,
							"z": 3.54278,
							"rotationX": -83.1,
							"rotationY": -23.7,
							"rotationZ": -147.2,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_01.png",
										"instScale_rand": 0,
										"warmUpTime": -1.5,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.5,
											0.95,
											1
										],
										"lifeTime": 0.1,
										"instScale": 1.2
									},
									"x": -0.02,
									"y": 0.07,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": -5.7,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Elec04",
							"x": -2.30689,
							"y": -2.92593,
							"z": 1.91726,
							"rotationX": -73.2,
							"rotationY": 4,
							"rotationZ": -33.5,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_02.png",
										"instScale_rand": 0,
										"warmUpTime": -3.6,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.5,
											0.8,
											1
										],
										"lifeTime": 0.1,
										"instScale": 1.8
									},
									"y": -0.71,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationY": 69.7,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
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
								}
							]
						},
						{
							"type": "object",
							"name": "Elec06",
							"x": -3.40703,
							"y": -0.59491,
							"z": 1.67297,
							"rotationX": -4.6,
							"rotationY": -158.8,
							"rotationZ": -81.7,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_02.png",
										"instScale_rand": 0,
										"warmUpTime": -3.8,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.6,
											0.95,
											1
										],
										"lifeTime": 0.1,
										"instScale": 1.2
									},
									"x": -0.09,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationY": 1.8,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Elec07",
							"x": 2.79182,
							"y": -2.27673,
							"z": 2.43996,
							"rotationX": -97.5,
							"rotationY": 29.8,
							"rotationZ": -122.7,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
										"instScale_rand": 0.3,
										"warmUpTime": -4.75,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.1,
											0.8,
											1
										],
										"lifeTime": 0.1,
										"burstCount": 2,
										"instScale": 1.5,
										"instStretch_rand": [
											0,
											0,
											0
										]
									},
									"x": -0.87712,
									"y": 0.67824,
									"z": 0.40527,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": -0.1,
									"rotationY": 11.7,
									"rotationZ": -23.3,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Elec08",
							"x": 4.26159,
							"y": -0.50902,
							"z": 1.47737,
							"rotationX": -56.3,
							"rotationY": -18.8,
							"rotationZ": -92.2,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
										"instScale_rand": 0,
										"warmUpTime": -5.25,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1,
											1.2,
											1
										],
										"lifeTime": 0.1,
										"instScale": 1.25
									},
									"x": -0.7175,
									"y": -0.93796,
									"z": 0.0035,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": -23.6,
									"rotationY": -6.5,
									"rotationZ": -49.2,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Elec09",
							"x": 5.38159,
							"y": -1.47902,
							"z": 1.23737,
							"rotationX": 44.8,
							"rotationY": 112.7,
							"rotationZ": 41.2,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_02.png",
										"instScale_rand": 0,
										"warmUpTime": -5.4,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.1,
											0.9,
											1
										],
										"lifeTime": 0.1
									},
									"x": -0.17434,
									"y": 0.20302,
									"z": -0.16624,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": -16.6,
									"rotationY": -49.3,
									"rotationZ": -1.5,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.25,
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
															"depthTest": "Less",
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sparkles01",
							"props": {
								"emitType": "Burst",
								"burstParticleCount": 15,
								"emitOrientation": "Speed",
								"emitShape": "Cone",
								"emitAngle": 57.27,
								"instSpeed": [
									7,
									0,
									0
								],
								"lifeTime": 0.45,
								"warmUpTime": -11,
								"emitSurface": true,
								"instStretch": [
									2.2,
									1,
									1
								],
								"instScale": 0.55,
								"instScale_rand": 0.3,
								"instSpeed_rand": [
									4,
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
									0.10196078431372549,
									0.3411764705882353,
									1,
									1
								],
								"randomColor2": [
									0.7137254901960784,
									0.17254901960784313,
									0.17254901960784313,
									1
								],
								"lifeTimeRand": 0.2,
								"burstDelay": 1.5
							},
							"x": 0.5479,
							"y": -1.3108,
							"z": 1.25997,
							"scaleY": 1.0000000000000002,
							"rotationX": 101.6,
							"rotationY": -45.2,
							"rotationZ": 57.8,
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
													"emissive": 50
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": 1.3450505427640504,
																"dt": -0.2952549971921085
															},
															"nextHandle": {
																"dv": -0.6833333333333333,
																"dt": 0.15000000000000002
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
												},
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
											"value": 0,
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
							"type": "emitter",
							"name": "Sparkles02",
							"props": {
								"emitType": "Burst",
								"burstParticleCount": 15,
								"emitOrientation": "Speed",
								"emitShape": "Cone",
								"emitAngle": 57.27,
								"instSpeed": [
									7,
									0,
									0
								],
								"lifeTime": 0.6,
								"warmUpTime": -6.5,
								"emitSurface": true,
								"instStretch": [
									2.2,
									1,
									1
								],
								"instScale": 0.5,
								"instScale_rand": 0.3,
								"instSpeed_rand": [
									4,
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
									0.10196078431372549,
									0.3411764705882353,
									1,
									1
								],
								"randomColor2": [
									0.7137254901960784,
									0.17254901960784313,
									0.17254901960784313,
									1
								],
								"lifeTimeRand": 0.2,
								"burstCount": 2,
								"burstDelay": 0.75
							},
							"x": 2.50911,
							"y": -1.79362,
							"z": 1.38052,
							"rotationX": 86.3,
							"rotationY": -34.6,
							"rotationZ": -94.6,
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
													"emissive": 50
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
											"value": 0,
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
							"name": "Sparkles03",
							"props": {
								"emitType": "Burst",
								"burstParticleCount": 15,
								"emitOrientation": "Speed",
								"emitShape": "Cone",
								"emitAngle": 57.27,
								"instSpeed": [
									7,
									0,
									0
								],
								"lifeTime": 0.6,
								"warmUpTime": -7,
								"emitSurface": true,
								"instStretch": [
									2.2,
									1,
									1
								],
								"instScale": 0.5,
								"instScale_rand": 0.3,
								"instSpeed_rand": [
									4,
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
									0.10196078431372549,
									0.3411764705882353,
									1,
									1
								],
								"randomColor2": [
									0.7137254901960784,
									0.17254901960784313,
									0.17254901960784313,
									1
								],
								"lifeTimeRand": 0.2,
								"burstDelay": 1.5
							},
							"x": 2.77032,
							"y": 0.89979,
							"z": 0.32887,
							"rotationX": -72.1,
							"rotationY": -22.7,
							"rotationZ": 91.5,
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
													"emissive": 50
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": 1.3450505427640504,
																"dt": -0.2952549971921085
															},
															"nextHandle": {
																"dv": -0.6833333333333333,
																"dt": 0.15000000000000002
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
												},
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
											"value": 0,
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
						}
					]
				},
				{
					"type": "emitter",
					"name": "SandFloor2",
					"props": {
						"instScale_rand": 4,
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
						"instScale": 8,
						"lifeTime": 1.2,
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
							20,
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
						"warmUpTime": -1.45,
						"emitType": "Burst",
						"burstParticleCount": 20
					},
					"x": 3.06761,
					"z": -1,
					"scaleX": 8.075000000000001,
					"scaleY": 8.075000000000001,
					"scaleZ": 0.019,
					"rotationZ": -90,
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
							"enabled": false,
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
										"dv": 0,
										"dt": -0.5800000000000001
									},
									"nextHandle": {
										"dv": -5.442874662877125e-16,
										"dt": 0.33333333333333326
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
}