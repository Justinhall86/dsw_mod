{
	"type": "fx",
	"duration": 33.5,
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
			],
			"enabled": false
		},
		{
			"type": "object",
			"name": "FXRoot",
			"y": -0.7,
			"z": -1.39,
			"scaleX": 4,
			"scaleY": 4,
			"scaleZ": 1.5,
			"children": [
				{
					"type": "emitter",
					"name": "CloudDust",
					"props": {
						"instScale_rand": 0.5,
						"simulationSpace": "World",
						"animationSpeed": 0.01,
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
							360
						],
						"lifeTimeRand": 1,
						"emitSurface": true,
						"instOrbitSpeed_rand": [
							0,
							0,
							0
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"lifeTime": 2.5,
						"emitRad1": 0.53,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
						"instScale": 1.5,
						"useRandomColor": true,
						"randomColor2": [
							0.7215686274509804,
							0.7215686274509804,
							0.7215686274509804,
							1
						],
						"emitRate": 3,
						"maxCount": 10,
						"emitShape": "Box",
						"speedFactor": 0.3,
						"instAcceleration": [
							0.1,
							0.1,
							0
						],
						"instAcceleration_rand": [
							-0.2,
							-0.2,
							0
						],
						"warmUpTime": -3
					},
					"y": -0.23,
					"z": 0.54,
					"scaleX": 2,
					"scaleY": 1.15,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"z": 0.1,
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
									"diffuseMap": "Fx/Structure/Smoke/white.png",
									"color": [
										0.6509803921568628,
										0.6509803921568628,
										0.6509803921568628,
										0.7294117647058823
									]
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
										"alpha": 1.1
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
														"dv": -3.0422716342761236,
														"dt": -0.34988109631104786
													},
													"nextHandle": {
														"dv": 0.23722222222222222,
														"dt": 0.027998637832460843
													}
												},
												{
													"time": 0.21071428571428572,
													"value": 0.9889393939393939,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.21499999999999997
													},
													"nextHandle": {
														"dv": -4.1025160037449046e-17,
														"dt": 0.05024937810560444
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.050833333333333286,
														"dt": -0.3400000000000001
													},
													"nextHandle": {
														"dv": 0.03197892211731358,
														"dt": 0.21389180694859003
													}
												}
											]
										}
									],
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
										"progress": 0.95,
										"saturation": 1,
										"width": 0.6,
										"uvScaleX": 0.42,
										"uvScaleY": 0.32,
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
									],
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 1.2,
										"power": 1.1
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
											0.7333333333333333,
											0.7333333333333333,
											0.7333333333333333
										]
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"enabled": false,
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.35,
									"dirIntensity": 0.22,
									"dirSpan": 0.86,
									"sandBlend": 0.25,
									"envBlend": 0.5
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.45,
									"topSpan": 0.35,
									"dirIntensity": 0.22,
									"dirSpan": 0.76,
									"sandBlend": 0.35,
									"envBlend": 0.5
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1.2,
										"power": 1.5
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.3,
										"useRGB": false
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
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -2.953665519239532,
										"dt": -0.05943840675895013
									},
									"nextHandle": {
										"dv": 1.25785098444774,
										"dt": 0.027639315317825597
									}
								},
								{
									"time": 1,
									"value": 1.2937895840033895,
									"mode": 0,
									"prevHandle": {
										"dv": 0.06468947920016954,
										"dt": -0.7595312499999993
									},
									"nextHandle": {
										"dv": -0.028301783884839983,
										"dt": 0.33222816759814844
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "CloudDustSmall",
					"props": {
						"instScale_rand": 0.5,
						"simulationSpace": "World",
						"animationSpeed": 0.01,
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
							360
						],
						"lifeTimeRand": 1,
						"emitSurface": true,
						"instOrbitSpeed_rand": [
							0,
							0,
							0
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"lifeTime": 1.5,
						"emitRad1": 0.53,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
						"useRandomColor": true,
						"randomColor2": [
							0.7215686274509804,
							0.7215686274509804,
							0.7215686274509804,
							1
						],
						"emitRate": 4,
						"emitShape": "Box",
						"speedFactor": 0.3,
						"instAcceleration": [
							0.1,
							0.1,
							0
						],
						"instAcceleration_rand": [
							-0.2,
							-0.2,
							0
						],
						"warmUpTime": -2,
						"seedGroup": 1,
						"instScale": 0.7
					},
					"y": -0.23,
					"z": 0.86,
					"scaleX": 2,
					"scaleY": 1.15,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"z": 0.1,
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
									"diffuseMap": "Fx/Structure/Smoke/white.png",
									"color": [
										0.6509803921568628,
										0.6509803921568628,
										0.6509803921568628,
										0.7294117647058823
									]
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
										"alpha": 1.1
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
														"dv": -3.0422716342761236,
														"dt": -0.34988109631104786
													},
													"nextHandle": {
														"dv": 0.23722222222222222,
														"dt": 0.027998637832460843
													}
												},
												{
													"time": 0.21071428571428572,
													"value": 0.9889393939393939,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.21499999999999997
													},
													"nextHandle": {
														"dv": -4.1025160037449046e-17,
														"dt": 0.05024937810560444
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.050833333333333286,
														"dt": -0.3400000000000001
													},
													"nextHandle": {
														"dv": 0.03197892211731358,
														"dt": 0.21389180694859003
													}
												}
											]
										}
									],
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
										"progress": 0.95,
										"saturation": 1,
										"width": 0.6,
										"uvScaleX": 0.42,
										"uvScaleY": 0.32,
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
									],
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 1.2,
										"power": 1.1
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
											0.7333333333333333,
											0.7333333333333333,
											0.7333333333333333
										]
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"enabled": false,
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.35,
									"dirIntensity": 0.22,
									"dirSpan": 0.86,
									"sandBlend": 0.25,
									"envBlend": 0.5
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.45,
									"topSpan": 0.35,
									"dirIntensity": 0.22,
									"dirSpan": 0.76,
									"sandBlend": 0.35,
									"envBlend": 0.5
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1.2,
										"power": 1.5
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.3,
										"useRGB": false
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
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -2.953665519239532,
										"dt": -0.05943840675895013
									},
									"nextHandle": {
										"dv": 1.25785098444774,
										"dt": 0.027639315317825597
									}
								},
								{
									"time": 1,
									"value": 1.2937895840033895,
									"mode": 0,
									"prevHandle": {
										"dv": -0.01804067236371365,
										"dt": -0.5101543155597382
									},
									"nextHandle": {
										"dv": 0.011742224522742449,
										"dt": 0.3323141063427952
									}
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Airfield_Construction",
					"source": "Structure/Buildings/Airfield/Airfield_Construction.fbx",
					"editorOnly": true,
					"z": 1,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Structure/Buildings/Airfield/Airfield_Construction.fbx"
						}
					],
					"enabled": false
				}
			]
		}
	]
}