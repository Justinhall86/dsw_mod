{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "polygon",
			"editorOnly": true,
			"locked": true,
			"z": 0.04,
			"scaleX": 10000,
			"scaleY": 10000,
			"scaleZ": 5,
			"color": -14869219,
			"kind": 0,
			"args": [
				0
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "areaDisplay",
					"name": "circle",
					"borderTexture": "Fx/Areas/vgrad_alpha.png",
					"border": 0.65,
					"radius": 3.5,
					"renderMode": "AfterTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.61
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "reference",
					"name": "Prefab_Thumper",
					"source": "Structure/Point_Of_Interest/Thumper/Prefab_Thumper.prefab",
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2
				},
				{
					"type": "emitter",
					"name": "Impact_Burst_Close_SandJet_R",
					"props": {
						"instScale_rand": 1,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9529411764705882,
							0.9058823529411765,
							0.8823529411764706,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							30
						],
						"lifeTimeRand": 0.2,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 7,
						"lifeTime": 2,
						"emitRad1": 0.73,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"emitRate": 20,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
						"instWorldAcceleration_rand": [
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
						"instStretch_rand": [
							0,
							0.25,
							0
						],
						"instStretch": [
							1,
							2.5,
							1
						],
						"emitType": "BurstDuration",
						"burstParticleCount": 8,
						"emitAngle": 200,
						"instRotation": [
							0,
							0,
							45
						],
						"emitDuration": 20,
						"burstDelay": 1.35,
						"warmUpTime": -0.8
					},
					"x": -0.17773,
					"z": 0.79,
					"scaleX": 13,
					"scaleY": 13,
					"scaleZ": 0.2,
					"rotationZ": 90,
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.5
									},
									"isInstance": true
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
										"progress": 0.58,
										"saturation": 0,
										"width": 0.5,
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
														"dv": 1.1946815774171073,
														"dt": -0.37422467067608545
													},
													"nextHandle": {
														"dv": -1.0693652343750002,
														"dt": 0.3379705070727756
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
									"topIntensity": 0.3,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Impact_Burst_Close_SandJet_L",
					"props": {
						"instScale_rand": 1,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9529411764705882,
							0.9058823529411765,
							0.8823529411764706,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							30
						],
						"lifeTimeRand": 0.2,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 7,
						"lifeTime": 2,
						"emitRad1": 0.73,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"emitRate": 20,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
						"instWorldAcceleration_rand": [
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
						"instStretch_rand": [
							0,
							0.25,
							0
						],
						"instStretch": [
							1,
							2.5,
							1
						],
						"emitType": "BurstDuration",
						"burstParticleCount": 8,
						"emitAngle": 200,
						"instRotation": [
							0,
							0,
							-45
						],
						"emitDuration": 20,
						"burstDelay": 1.35,
						"warmUpTime": -0.8
					},
					"x": -0.17773,
					"z": 0.79,
					"scaleX": 13,
					"scaleY": 13,
					"scaleZ": 0.2,
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.5
									},
									"isInstance": true
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
										"progress": 0.58,
										"saturation": 0,
										"width": 0.5,
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
														"dv": 1.1946815774171073,
														"dt": -0.37422467067608545
													},
													"nextHandle": {
														"dv": -1.0693652343750002,
														"dt": 0.3379705070727756
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
									"topIntensity": 0.3,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Impact_Burst_Mid_SandJet_R",
					"props": {
						"instScale_rand": 1,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9529411764705882,
							0.9058823529411765,
							0.8823529411764706,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							15
						],
						"lifeTimeRand": 0.5,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 8,
						"lifeTime": 2,
						"emitRad1": 0.8,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"emitRate": 20,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
						"instWorldAcceleration_rand": [
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
						"instStretch_rand": [
							0,
							0.25,
							0
						],
						"instStretch": [
							1,
							1.5,
							1
						],
						"warmUpTime": -1,
						"emitType": "BurstDuration",
						"burstParticleCount": 13,
						"emitAngle": 200,
						"instRotation": [
							0,
							0,
							30
						],
						"emitDuration": 20,
						"burstDelay": 1.35
					},
					"x": -0.17773,
					"z": 0.38495,
					"scaleX": 30,
					"scaleY": 30,
					"scaleZ": 0.2,
					"rotationZ": 90,
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.5
									},
									"isInstance": true
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
										"useScale": true,
										"wrap": true,
										"progress": 0.58,
										"saturation": 0,
										"width": 0.7,
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
														"dv": 1.1946815774171073,
														"dt": -0.37422467067608545
													},
													"nextHandle": {
														"dv": -1.0693652343750002,
														"dt": 0.3379705070727756
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
									"topIntensity": 0.3,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Impact_Burst_Mid_SandJet_L",
					"props": {
						"instScale_rand": 1,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9529411764705882,
							0.9058823529411765,
							0.8823529411764706,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							15
						],
						"lifeTimeRand": 0.5,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 8,
						"lifeTime": 2,
						"emitRad1": 0.8,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"emitRate": 20,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
						"instWorldAcceleration_rand": [
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
						"instStretch_rand": [
							0,
							0.25,
							0
						],
						"instStretch": [
							1,
							1.5,
							1
						],
						"warmUpTime": -1,
						"emitType": "BurstDuration",
						"burstParticleCount": 13,
						"emitAngle": 200,
						"instRotation": [
							0,
							0,
							-30
						],
						"emitDuration": 20,
						"burstDelay": 1.35,
						"seedGroup": 3
					},
					"x": -0.17773,
					"z": 0.38495,
					"scaleX": 30,
					"scaleY": 30,
					"scaleZ": 0.2,
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.5
									},
									"isInstance": true
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
										"useScale": true,
										"wrap": true,
										"progress": 0.58,
										"saturation": 0,
										"width": 0.7,
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
														"dv": 1.1946815774171073,
														"dt": -0.37422467067608545
													},
													"nextHandle": {
														"dv": -1.0693652343750002,
														"dt": 0.3379705070727756
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
									"topIntensity": 0.3,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Impact_Burst_Far_SandJet_L",
					"props": {
						"instScale_rand": 1,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9529411764705882,
							0.9058823529411765,
							0.8823529411764706,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							15
						],
						"lifeTimeRand": 0.5,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 8,
						"lifeTime": 2,
						"emitRad1": 0.9,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"emitRate": 20,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
						"instWorldAcceleration_rand": [
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
						"instStretch_rand": [
							0,
							0.25,
							0
						],
						"instStretch": [
							1,
							1.5,
							1
						],
						"warmUpTime": -1.2,
						"emitType": "BurstDuration",
						"burstParticleCount": 18,
						"emitAngle": 200,
						"instRotation": [
							0,
							0,
							-30
						],
						"emitDuration": 20,
						"burstDelay": 1.35,
						"seedGroup": 1
					},
					"x": -0.17773,
					"z": 0.38495,
					"scaleX": 45,
					"scaleY": 45,
					"scaleZ": 0.2,
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.5
									},
									"isInstance": true
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
										"useScale": true,
										"wrap": true,
										"progress": 0.58,
										"saturation": 0,
										"width": 0.7,
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
														"dv": 1.1946815774171073,
														"dt": -0.37422467067608545
													},
													"nextHandle": {
														"dv": -1.0693652343750002,
														"dt": 0.3379705070727756
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
									"topIntensity": 0.3,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Impact_Burst_Far_SandJet_R",
					"props": {
						"instScale_rand": 1,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9529411764705882,
							0.9058823529411765,
							0.8823529411764706,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							15
						],
						"lifeTimeRand": 0.5,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 8,
						"lifeTime": 2,
						"emitRad1": 0.9,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"emitRate": 20,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
						"instWorldAcceleration_rand": [
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
						"instStretch_rand": [
							0,
							0.25,
							0
						],
						"instStretch": [
							1,
							1.5,
							1
						],
						"warmUpTime": -1.2,
						"emitType": "BurstDuration",
						"burstParticleCount": 18,
						"emitAngle": 200,
						"instRotation": [
							0,
							0,
							30
						],
						"emitDuration": 20,
						"burstDelay": 1.35,
						"seedGroup": 2
					},
					"z": 0.38495,
					"scaleX": 45,
					"scaleY": 45,
					"scaleZ": 0.2,
					"rotationZ": 90,
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.5
									},
									"isInstance": true
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
										"useScale": true,
										"wrap": true,
										"progress": 0.58,
										"saturation": 0,
										"width": 0.7,
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
														"dv": 1.1946815774171073,
														"dt": -0.37422467067608545
													},
													"nextHandle": {
														"dv": -1.0693652343750002,
														"dt": 0.3379705070727756
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
									"topIntensity": 0.3,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
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
						"useRGB": false,
						"resetAlpha": false
					},
					"isInstance": true
				},
				{
					"type": "model",
					"name": "FX_Mesh_Disc",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
					"z": 0.72627,
					"scaleX": 90,
					"scaleY": 90,
					"scaleZ": 50,
					"rotationZ": -180,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "DecalPass",
									"blend": "Alpha",
									"shadows": false,
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"parallax": 0,
									"alphaKill": false,
									"textureWrap": true,
									"culling": "None"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"materialName": "any",
							"mainPassName": "decal"
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": false,
								"wrap": true,
								"invert": true,
								"replace": false,
								"alpha": 1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Alphas/sand_gaussian.png",
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
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": 0.005,
								"shiftSpeedY": -0.02,
								"USE_SOURCE_UV": false
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
								"texture": "Fx/Gradients/vGrad_inv.jpg",
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
								"progress": 0.8,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 3,
								"uvScaleY": 2,
								"texture": "Fx/Gradients/Cyl06u_A.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									-1
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
									"enabled": false,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 0.5,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.5,
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
								"progress": 0.25,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Alphas/sand_gaussian.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.07,
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
									"enabled": false,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 0.5,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.5,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"enabled": false,
							"props": {
								"X": true,
								"Y": true,
								"Z": true,
								"texScaleX": 1,
								"texScaleY": 1,
								"tex": "Fx/noise/causticTexture_04.jpg",
								"intensity": 4,
								"scrollSpeed": [
									0,
									0.03
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "intensity",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 2,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16666666666666666
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 4,
											"value": 0.5,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "texScaleX",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 2
										},
										{
											"time": 1.5,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16666666666666666
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 3,
											"value": 0.8,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "texScaleY",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 1.5,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16666666666666666
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 3,
											"value": 0.9,
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
								"range": 1,
								"power": 0.5
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
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"enabled": false,
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
												"dv": -0.04114912760556359,
												"dt": -0.49996190040761035
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.405
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										},
										{
											"time": 5,
											"value": 1,
											"mode": 0
										},
										{
											"time": 6,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.46930516719818005
											},
											"nextHandle": {
												"dv": -2.398428290550722e-16,
												"dt": 0.33499999999999996
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
								"amount": 1,
								"ATTENUATE": false,
								"emissiveMap": "Fx/Gradients/ColorSand.png"
							}
						}
					]
				},
				{
					"type": "emitter",
					"name": "ShockWave",
					"props": {
						"warmUpTime": -0.6,
						"emitType": "BurstDuration",
						"instScale": 150,
						"lifeTime": 2.5,
						"emitDuration": 20,
						"burstDelay": 1.35
					},
					"z": 0.63154,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual"
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
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png",
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
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.815
													},
													"nextHandle": {
														"dv": -2.7211090888961944e-16,
														"dt": 0.3332931287768935
													}
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
										"range": 1,
										"power": 0.5
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
										"envBlend": 0.7,
										"envColorSet": false
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
										"dv": 2.031230825729126e-16,
										"dt": -0.4975877519485654
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.135
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.050000000000000044,
										"dt": -0.495
									},
									"nextHandle": {
										"dv": 0.03365458515640994,
										"dt": 0.3331803930484605
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "ShockWave",
					"props": {
						"warmUpTime": -0.6,
						"emitType": "BurstDuration",
						"instScale": 150,
						"lifeTime": 2.5,
						"emitDuration": 20,
						"burstDelay": 1.35
					},
					"z": 0.63154,
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
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png",
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
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01666666666666672,
														"dt": -0.5708015990978788
													},
													"nextHandle": {
														"dv": 0.009785546759570019,
														"dt": 0.33328019978181483
													}
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
										"range": 1,
										"power": 0.5
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
										"envBlend": 0.8,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DistortionNormal",
									"source": "shaders/DistortionNormal.hx",
									"props": {
										"intensity": 0.03
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
										"dv": 0.059198894770916444,
										"dt": -0.49727071607569884
									},
									"nextHandle": {
										"dv": -0.01666666666666672,
										"dt": 0.14
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.050000000000000044,
										"dt": -0.495
									},
									"nextHandle": {
										"dv": 0.03365458515640994,
										"dt": 0.3331803930484605
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