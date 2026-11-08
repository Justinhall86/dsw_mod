{
	"type": "fx",
	"duration": 25,
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": 0.08361,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 70,
			"rotationZ": 180,
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
					"type": "subFX",
					"name": "FX_DeathFinalExplosion_Photosensitive",
					"source": "Fx/Vehicle/Ships/FX_DeathFinalExplosion_Photosensitive.fx",
					"time": 3.27475
				},
				{
					"type": "subFX",
					"name": "FX_DeathFloor_Dust",
					"source": "Fx/Vehicle/Ships/FX_DeathFloor_Dust.fx",
					"time": -0.85
				},
				{
					"type": "model",
					"name": "Cronos",
					"source": "Vehicle/Imperial/Chronos/Chronos.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Chronos/Anim_Chronos_Death.fbx"
						}
					]
				},
				{
					"type": "emitter",
					"name": "Smoke",
					"props": {
						"instScale_rand": 2,
						"maxCount": 65,
						"simulationSpace": "World",
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
						"emitRate": 8,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
						"instScale": 13,
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
						"emitAngle": 38.18,
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instWorldAcceleration_rand": [
							0,
							0.05,
							0
						],
						"lifeTime": 6,
						"instSpeed": [
							6,
							0,
							0
						],
						"instSpeed_rand": [
							1.5,
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
							0.15,
							0
						],
						"enableSort": false,
						"instAcceleration": [
							1,
							2.5,
							0
						]
					},
					"x": -6.79604,
					"y": 1.54515,
					"z": 9.07939,
					"scaleX": 5,
					"scaleY": 5,
					"scaleZ": 5,
					"rotationY": -49.7,
					"rotationZ": -84.3,
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
										"alpha": 0.7
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
														"dv": 0.07434815435096212,
														"dt": -0.013591771967285254
													},
													"nextHandle": {
														"dv": -0.4,
														"dt": 0.07096513271331795
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.7934098672866821
													},
													"nextHandle": {
														"dv": 0.013450431843066416,
														"dt": 0.32003621266595966
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
													"value": 0.7,
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
													"value": 0.1,
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
									"value": 0.5,
									"mode": 0,
									"prevHandle": {
										"dv": 0.01716493190450957,
										"dt": -0.49913718658749795
									},
									"nextHandle": {
										"dv": -0.00666666666666671,
										"dt": 0.19385927438735967
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
							"name": "emitRate",
							"keyMode": 1,
							"keys": [
								{
									"time": 2.0621516847456363,
									"value": 0,
									"mode": 2
								},
								{
									"time": 3.983702118258603,
									"value": 2,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.003333333333333336
									},
									"nextHandle": {
										"dv": -0.9333333333333331,
										"dt": 1.528834655284883
									}
								},
								{
									"time": 11.57616968482202,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.05333333333333323,
										"dt": -3.5236773991584793
									},
									"nextHandle": {
										"dv": 0.03239105655764724,
										"dt": 2.140043136132158
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
							"name": "instAcceleration.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -2.9644666370982153,
										"dt": -0.3062152491313287
									},
									"nextHandle": {
										"dv": 0.7744791666666667,
										"dt": 0.07888888888888891
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.025520833333333326,
										"dt": -0.9566666666666667
									},
									"nextHandle": {
										"dv": 0.00890255983233487,
										"dt": 0.3333312198447246
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
						"simulationSpace": "World",
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
						"emitRate": 8,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
						"instScale": 10,
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
						"emitAngle": 38.18,
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instWorldAcceleration_rand": [
							0,
							0.05,
							0
						],
						"lifeTime": 4,
						"instSpeed": [
							4.5,
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
							0.15,
							0
						],
						"enableSort": false,
						"instAcceleration": [
							1,
							2.5,
							0
						]
					},
					"x": -1.70962,
					"y": -6.33744,
					"z": 2.87121,
					"scaleX": 5,
					"scaleY": 5,
					"scaleZ": 5,
					"rotationY": -49.7,
					"rotationZ": -84.3,
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
										"alpha": 0.7
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
														"dv": 0.07434815435096212,
														"dt": -0.013591771967285254
													},
													"nextHandle": {
														"dv": -0.4,
														"dt": 0.07096513271331795
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.7934098672866821
													},
													"nextHandle": {
														"dv": 0.013450431843066416,
														"dt": 0.32003621266595966
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
													"value": 0.7,
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
													"value": 0.1,
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
									"value": 0.5,
									"mode": 0,
									"prevHandle": {
										"dv": 0.01716493190450957,
										"dt": -0.49913718658749795
									},
									"nextHandle": {
										"dv": -0.00666666666666671,
										"dt": 0.19385927438735967
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
							"name": "emitRate",
							"keyMode": 1,
							"keys": [
								{
									"time": 2.0621516847456363,
									"value": 0,
									"mode": 2
								},
								{
									"time": 3.983702118258603,
									"value": 2,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.003333333333333336
									},
									"nextHandle": {
										"dv": -0.9333333333333331,
										"dt": 1.528834655284883
									}
								},
								{
									"time": 9.092214246378429,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.05333333333333323,
										"dt": -3.5236773991584793
									},
									"nextHandle": {
										"dv": 0.03239105655764724,
										"dt": 2.140043136132158
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
							"name": "instAcceleration.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -2.9644666370982153,
										"dt": -0.3062152491313287
									},
									"nextHandle": {
										"dv": 0.7744791666666667,
										"dt": 0.07888888888888891
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.025520833333333326,
										"dt": -0.9566666666666667
									},
									"nextHandle": {
										"dv": 0.00890255983233487,
										"dt": 0.3333312198447246
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "smoke",
					"x": 4.24555,
					"y": 5.40697,
					"z": 0.98061,
					"scaleX": 0.8,
					"scaleY": 0.8,
					"scaleZ": 0.8,
					"children": [
						{
							"type": "emitter",
							"name": "Smoke",
							"props": {
								"instScale_rand": 2,
								"maxCount": 65,
								"simulationSpace": "World",
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
								"emitRate": 8,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
								"instScale": 9,
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
								"emitAngle": 38.18,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldAcceleration_rand": [
									0,
									0.05,
									0
								],
								"lifeTime": 7,
								"instSpeed": [
									6,
									0,
									0
								],
								"instSpeed_rand": [
									1.5,
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
									0.15,
									0
								],
								"enableSort": false,
								"instAcceleration": [
									1,
									2.5,
									0
								]
							},
							"scaleX": 4.999999999999999,
							"scaleY": 5,
							"scaleZ": 5,
							"rotationY": -49.70000000000002,
							"rotationZ": -84.3,
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
												"alpha": 0.7
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
																"dv": 0.07434815435096212,
																"dt": -0.013591771967285254
															},
															"nextHandle": {
																"dv": -0.4,
																"dt": 0.07096513271331795
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.7934098672866821
															},
															"nextHandle": {
																"dv": 0.013450431843066416,
																"dt": 0.32003621266595966
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
															"value": 0.7,
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
															"value": 0.1,
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
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0.01716493190450957,
												"dt": -0.49913718658749795
											},
											"nextHandle": {
												"dv": -0.00666666666666671,
												"dt": 0.19385927438735967
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
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 2.0621516847456363,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.983702118258603,
											"value": 2,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.003333333333333336
											},
											"nextHandle": {
												"dv": -0.9333333333333331,
												"dt": 1.528834655284883
											}
										},
										{
											"time": 9.982688837518584,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.05333333333333323,
												"dt": -3.5236773991584793
											},
											"nextHandle": {
												"dv": 0.03239105655764724,
												"dt": 2.140043136132158
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
									"name": "instAcceleration.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.9644666370982153,
												"dt": -0.3062152491313287
											},
											"nextHandle": {
												"dv": 0.7744791666666667,
												"dt": 0.07888888888888891
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.025520833333333326,
												"dt": -0.9566666666666667
											},
											"nextHandle": {
												"dv": 0.00890255983233487,
												"dt": 0.3333312198447246
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