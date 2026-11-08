{
	"type": "fx",
	"duration": 5,
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
			"scaleX": 1.25,
			"scaleY": 1.25,
			"scaleZ": 1.25,
			"children": [
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"scaleX": 60,
					"scaleY": 60,
					"scaleZ": 3.697446508211333,
					"albedoMap": "Fx/Alphas/T_circle2.png",
					"fadePower": 1.8,
					"fadeStart": 0.08,
					"renderMode": "BeforeTonemapping",
					"blendMode": 2,
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.3
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
											"mode": 2
										},
										{
											"time": 0.018672458466697156,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.02
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3133333333333333
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.5833333333333334,
												"dt": -0.41634049687547625
											},
											"nextHandle": {
												"dv": -0.44394942207671123,
												"dt": 0.3159572000338183
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
									0.6745098039215687,
									0.3333333333333333
								]
							},
							"isInstance": true
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
										"dv": -2.1707566880291367,
										"dt": -0.22360679774997907
									},
									"nextHandle": {
										"dv": 0.7878787878787878,
										"dt": 0.08110196616369457
									}
								},
								{
									"time": 0.4182213077274807,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.015151515151515138,
										"dt": -0.2250845907636031
									},
									"nextHandle": {
										"dv": 0.005635594886243612,
										"dt": 0.08359419364431056
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "SmokePuff",
					"props": {
						"lifeTime": 1.75,
						"lifeTimeRand": 0.5,
						"emitType": "Burst",
						"burstParticleCount": 15,
						"simulationSpace": "World",
						"emitOrientation": "Normal",
						"emitShape": "Cylinder",
						"emitRad1": 0.61,
						"emitSurface": true,
						"alignMode": "Screen",
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
						"instScale": 20,
						"instSpeed": [
							5,
							0,
							0
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"instRotation_rand": [
							0,
							0,
							360
						],
						"instScale_rand": 5,
						"instWorldAcceleration_rand": [
							0,
							0,
							1
						],
						"instWorldAcceleration": [
							0,
							0,
							2
						],
						"instAcceleration_rand": [
							1,
							0,
							0
						],
						"instAcceleration": [
							-4,
							0,
							0
						]
					},
					"z": 0.5,
					"scaleX": 7,
					"scaleY": 7,
					"scaleZ": 0.38,
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
											"depthTest": "LessEqual"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
										"scale": 0.5
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
										"useScale": true,
										"wrap": true,
										"progress": 0.7,
										"saturation": 0,
										"width": 0.4,
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
									"type": "fakeLight",
									"name": "FakeLight",
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.42,
									"topSpan": 0.24,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 19.7,
										"power": 14.39
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Debris",
					"enabled": false,
					"props": {
						"lifeTimeRand": 0.25,
						"emitType": "Burst",
						"burstParticleCount": 10,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"alignMode": "Screen",
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0,
						"instScale": 2,
						"instSpeed": [
							0,
							0,
							100
						],
						"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
						"instRotation_rand": [
							0,
							0,
							360
						],
						"instScale_rand": 0.7,
						"instSpeed_rand": [
							0,
							0,
							10
						],
						"seedGroup": 1,
						"useRandomColor": true,
						"randomColor1": [
							0.9529411764705882,
							0.9529411764705882,
							0.9529411764705882,
							1
						],
						"randomColor2": [
							0.42745098039215684,
							0.42745098039215684,
							0.42745098039215684,
							1
						],
						"simulationSpace": "World",
						"lifeTime": 0.55,
						"instOrbitSpeed": [
							0,
							0,
							7
						],
						"instOrbitSpeed_rand": [
							0,
							0,
							3
						]
					},
					"scaleX": 10,
					"scaleY": 10,
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
											"textureWrap": true,
											"emissive": 2
										}
									},
									"wrapRepeat": true
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.65
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.63,
													"value": 1.0142450142450146,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.21166666666666667
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.12166666666666666
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16500000000000004
													},
													"nextHandle": {
														"dv": -1.860811850556283e-16,
														"dt": 0.33333333333333337
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
											1,
											1
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
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 3.1230642893642835,
										"dt": -0.08923040826755088
									},
									"nextHandle": {
										"dv": -1.05,
										"dt": 0.03
									}
								},
								{
									"time": 0.9903769144228197,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.09999999999999998,
										"dt": -0.9003769144228198
									},
									"nextHandle": {
										"dv": -0.07279432839662904,
										"dt": 0.6551489555696561
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "InstWorldSpeed.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.009057837245436214,
										"dt": -0.49999261594807487
									},
									"nextHandle": {
										"dv": -0.01666666666666672,
										"dt": 0.9199999999999999
									}
								},
								{
									"time": 1.92,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.8166666666666667,
										"dt": -0.355
									},
									"nextHandle": {
										"dv": 0.4498541012841457,
										"dt": 0.19554882361943476
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
									"value": 0.012707392165911546,
									"mode": 0,
									"prevHandle": {
										"dv": -1.562544836391683,
										"dt": -0.057312053992565525
									},
									"nextHandle": {
										"dv": 0.8951335055594681,
										"dt": 0.03233660096897972
									}
								},
								{
									"time": 1,
									"value": 1.01469963255798,
									"mode": 0,
									"prevHandle": {
										"dv": -0.024099204996862578,
										"dt": -0.9873942064019231
									},
									"nextHandle": {
										"dv": 0.0055778337215589505,
										"dt": 0.265963721460112
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instOrbitSpeed.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.3333333333333333
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
		}
	]
}