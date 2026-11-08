{
	"type": "fx",
	"cullingRadius": 9999,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.7,
			"scaleY": 0.7,
			"scaleZ": 0.7,
			"children": [
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"z": 0.02,
					"scaleX": 4000,
					"scaleY": 4000,
					"scaleZ": 2,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				},
				{
					"type": "object",
					"name": "AwakeBackup",
					"enabled": false,
					"z": 0.5362499999999999,
					"children": [
						{
							"type": "emitter",
							"name": "emitter",
							"props": {
								"lifeTime": 1.5,
								"lifeTimeRand": 0.5,
								"emitRate": 1,
								"maxCount": 15,
								"emitShape": "Cylinder",
								"emitRad2": 0.79,
								"emitSurface": true,
								"instOrbitSpeed": [
									0,
									0.2,
									2
								],
								"instOrbitSpeed_rand": [
									0,
									0.05,
									0.5
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
								"instScale": 5,
								"instScale_rand": 2,
								"alignMode": "Screen",
								"emitType": "Burst",
								"burstParticleCount": 6,
								"emitAngle": 360,
								"useRandomColor": true,
								"randomColor1": [
									0.5647058823529412,
									0.5647058823529412,
									0.5647058823529412,
									1
								],
								"instWorldSpeed": [
									0,
									0,
									7
								],
								"instWorldSpeed_rand": [
									0,
									0,
									4
								]
							},
							"z": 0.5725000000000002,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 1.25,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.2,
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
													"colorMask": 255
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.25,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08333333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
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
													1,
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.20392156862745098,
													0.011764705882352941,
													0.14901960784313725
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ParticleColorRandom",
											"source": "hrt.shader.ParticleColorRandom",
											"props": {
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": 4281598758
															},
															{
																"position": 1,
																"color": -17563
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.z",
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
												"dt": -0.6337566306121156
											},
											"nextHandle": {
												"dv": -8.1737481543644e-16,
												"dt": 0.3333333333333333
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
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Spirale",
							"z": -0.03624999999999989,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"children": [
								{
									"type": "object",
									"name": "Village",
									"editorOnly": true,
									"x": -0.038696666666666664,
									"y": -0.3230993333333333,
									"z": 0.21681800000000007,
									"children": [
										{
											"type": "object",
											"name": "States",
											"x": -0.024,
											"y": 0.193174,
											"z": -0.8080719999999999,
											"children": [
												{
													"type": "object",
													"name": "Revolt_01",
													"enabled": false,
													"children": [
														{
															"type": "reference",
															"name": "FX_Fire_01",
															"source": "Fx/Smoke/FX_Fire_01.fx",
															"x": 0.36,
															"y": -2.44,
															"z": 1.6,
															"scaleX": 0.55,
															"scaleY": 0.55,
															"scaleZ": 0.55
														},
														{
															"type": "reference",
															"name": "FX_Fire_01",
															"source": "Fx/Smoke/FX_Fire_01.fx",
															"x": -2.37,
															"y": 1.82,
															"z": 1.2,
															"scaleX": 0.55,
															"scaleY": 0.55,
															"scaleZ": 0.55
														},
														{
															"type": "reference",
															"name": "FX_Fire_01",
															"source": "Fx/Smoke/FX_Fire_01.fx",
															"x": 0.98,
															"y": 1.23,
															"z": 0.05,
															"scaleX": 0.55,
															"scaleY": 0.55,
															"scaleZ": 0.55
														}
													]
												},
												{
													"type": "object",
													"name": "Revolt_02",
													"enabled": false,
													"children": [
														{
															"type": "reference",
															"name": "FX_Fire_01",
															"source": "Fx/Smoke/FX_Fire_01.fx",
															"x": 0.45,
															"y": -2.69,
															"z": 1.32
														},
														{
															"type": "reference",
															"name": "FX_Fire_01",
															"source": "Fx/Smoke/FX_Fire_01.fx",
															"x": -2.37,
															"y": 1.82,
															"z": 1.2
														},
														{
															"type": "reference",
															"name": "FX_Fire_01",
															"source": "Fx/Smoke/FX_Fire_01.fx",
															"x": 0.98,
															"y": 1.23,
															"z": 0.05
														},
														{
															"type": "reference",
															"name": "FX_Fire_01",
															"source": "Fx/Smoke/FX_Fire_01.fx",
															"x": 0.65,
															"y": -0.43,
															"z": 0.3
														}
													]
												},
												{
													"type": "object",
													"name": "Pillaged_01",
													"enabled": false,
													"children": [
														{
															"type": "reference",
															"name": "FX_Pillaged_Mist",
															"source": "Fx/Structure/Common/FX_Pillaged_Mist.fx",
															"x": -0.1,
															"y": 0.02,
															"z": -1.06,
															"scaleX": 6.99,
															"scaleY": 9.76,
															"scaleZ": 6.99,
															"rotationZ": -70.5
														},
														{
															"type": "reference",
															"name": "FX_Smoke_Big_Grey_1",
															"source": "Fx/Smoke/FX_Smoke_Big_Grey_1.fx",
															"x": 0.17,
															"y": -1.75,
															"z": 0.27,
															"scaleX": 1.5,
															"scaleY": 1.5,
															"scaleZ": 1.5
														},
														{
															"type": "reference",
															"name": "FX_Smoke_Big_Grey_1",
															"source": "Fx/Smoke/FX_Smoke_Big_Grey_1.fx",
															"x": -1.184,
															"y": 1.8379999999999999,
															"z": 0.266,
															"scaleX": 1.5,
															"scaleY": 1.5,
															"scaleZ": 1.5
														},
														{
															"type": "reference",
															"name": "FX_Smoke_Big_Grey_2",
															"source": "Fx/Smoke/FX_Smoke_Big_Grey_2.fx",
															"x": 0.996,
															"y": -0.14200000000000002,
															"z": 0.266,
															"scaleX": 1.5,
															"scaleY": 1.5,
															"scaleZ": 1.5
														},
														{
															"type": "advancedDecal",
															"name": "advancedDecal",
															"x": 0.16,
															"y": 0.09,
															"scaleX": 10.33,
															"scaleY": 10.33,
															"scaleZ": 8.05,
															"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
															"albedoStrength": 1.5
														}
													]
												},
												{
													"type": "object",
													"name": "Pillaged_02",
													"enabled": false,
													"children": [
														{
															"type": "reference",
															"name": "FX_Pillaged_Mist",
															"source": "Fx/Structure/Common/FX_Pillaged_Mist.fx",
															"x": -0.09,
															"y": 0.36,
															"z": -1.15,
															"scaleX": 7.48,
															"scaleY": 10.44,
															"scaleZ": 7.48,
															"rotationZ": -70.5
														},
														{
															"type": "reference",
															"name": "FX_Smoke_Big_Grey_1",
															"source": "Fx/Smoke/FX_Smoke_Big_Grey_1.fx",
															"x": -0.043999999999999984,
															"y": -2.002,
															"z": 0.266,
															"scaleX": 0.6,
															"scaleY": 0.6,
															"scaleZ": 0.6
														},
														{
															"type": "reference",
															"name": "FX_Smoke_Big_Grey_1",
															"source": "Fx/Smoke/FX_Smoke_Big_Grey_1.fx",
															"x": -1.184,
															"y": 1.8379999999999999,
															"z": 0.266,
															"scaleX": 0.6,
															"scaleY": 0.6,
															"scaleZ": 0.6
														},
														{
															"type": "reference",
															"name": "FX_Smoke_Big_Grey_2",
															"source": "Fx/Smoke/FX_Smoke_Big_Grey_2.fx",
															"x": 0.996,
															"y": -0.14200000000000002,
															"z": 0.266,
															"scaleX": 0.6,
															"scaleY": 0.6,
															"scaleZ": 0.6
														},
														{
															"type": "advancedDecal",
															"name": "advancedDecal",
															"x": 0.08,
															"y": 0.04,
															"z": 0.27,
															"scaleX": 10.54,
															"scaleY": 10.54,
															"scaleZ": 8.22,
															"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png"
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "group",
											"x": 0.096,
											"y": 0.393174,
											"z": -0.8080719999999999,
											"rotationZ": 6.599999999999998,
											"children": [
												{
													"type": "object",
													"name": "FX",
													"enabled": false,
													"x": -0.5266321196624828,
													"y": -0.5493611499185218,
													"z": 1.20125,
													"rotationZ": -6.599999999999999,
													"children": [
														{
															"type": "reference",
															"name": "Prefab_Antena_02",
															"source": "Structure/Village/Tiles/Model/Props/Prefab_Antena_02.prefab",
															"x": -0.78,
															"y": 3.00625,
															"z": -0.8212499999999999
														},
														{
															"type": "reference",
															"name": "Prefab_Antena_03",
															"source": "Structure/Village/Tiles/Model/Props/Prefab_Antena_03.prefab",
															"x": -1.89,
															"y": 2.03625,
															"z": 0.11875000000000013
														},
														{
															"type": "reference",
															"name": "Prefab_Antena_01",
															"source": "Structure/Village/Tiles/Model/Props/Prefab_Antena_01.prefab",
															"x": 2.26,
															"y": -1.18,
															"z": -0.82,
															"scaleX": 0.84,
															"scaleY": 0.84,
															"scaleZ": 0.84
														},
														{
															"type": "reference",
															"name": "LightYellow03_Sphere",
															"source": "Fx/Structure/Lights/LightYellow03_Sphere.fx",
															"x": 0.79,
															"y": -2.47375,
															"z": 1.13875,
															"scaleX": 0.25,
															"scaleY": 0.25,
															"scaleZ": 0.25
														},
														{
															"type": "reference",
															"name": "FX_Smoke_Big_5",
															"source": "Fx/Smoke/FX_Smoke_Big_5.fx",
															"x": 2.37,
															"y": 0.87,
															"z": 0.59,
															"scaleX": 0.3,
															"scaleY": 0.3,
															"scaleZ": 0.3,
															"rotationZ": -145.7
														},
														{
															"type": "reference",
															"name": "FX_Smoke_Big_5",
															"source": "Fx/Smoke/FX_Smoke_Big_5.fx",
															"x": -1.2,
															"y": -1.84,
															"z": -0.58,
															"scaleX": 0.3,
															"scaleY": 0.3,
															"scaleZ": 0.3,
															"rotationZ": -145.7
														}
													]
												},
												{
													"type": "model",
													"name": "Village_Large_01",
													"source": "Structure/Village/Tiles/Model/Village_Large_01.fbx",
													"x": -0.1421921619706209,
													"y": -0.1848820950609353,
													"scaleX": 1.25,
													"scaleY": 1.25,
													"scaleZ": 1.25,
													"rotationZ": 102.20000000000003,
													"children": [
														{
															"type": "shader",
															"name": "WindCloth",
															"source": "shaders/WindCloth.hx",
															"enabled": false,
															"props": {
																"speed": 2,
																"amount": 3.64,
																"zamount": 1,
																"freq": 9.09
															},
															"targetMaterial": "VillageMisc_01_Wind_Neutral_MAT",
															"recursiveApply": false,
															"isInstance": true
														}
													]
												},
												{
													"type": "object",
													"name": "Decals",
													"x": -0.6033333333333332,
													"y": 1.2766666666666666,
													"children": [
														{
															"type": "tdecal",
															"name": "tdecal",
															"x": 0.33,
															"y": -1.08,
															"scaleX": 12.93,
															"scaleY": 12.93,
															"scaleZ": 0.44,
															"rotationZ": 93.5,
															"albedoMap": "Structure/Resources/Decals/DirtDecal_1_color.png",
															"normalMap": "Structure/Resources/Decals/DirtDecal_1_normal.png"
														}
													]
												},
												{
													"type": "object",
													"name": "Sockets",
													"enabled": false,
													"x": 2.4499999999999997,
													"y": 2.130000000000001,
													"children": [
														{
															"type": "model",
															"name": "Socket",
															"source": "Structure/Village/Tiles/Model/Socket.fbx",
															"x": 92.57,
															"y": -1061.82,
															"scaleY": 1.0000000000000002,
															"scaleZ": 1.0000000000000002,
															"rotationZ": 100
														},
														{
															"type": "model",
															"name": "Socket",
															"source": "Structure/Village/Tiles/Model/Socket.fbx",
															"x": 1.5200000000000005,
															"y": -4.900000000000001,
															"scaleY": 1.0000000000000002,
															"scaleZ": 1.0000000000000002,
															"rotationZ": 100
														},
														{
															"type": "model",
															"name": "Socket",
															"source": "Structure/Village/Tiles/Model/Socket.fbx",
															"x": 1.7000000000000002,
															"y": -1.6700000000000017,
															"scaleY": 1.0000000000000002,
															"scaleZ": 1.0000000000000002,
															"rotationZ": 100
														},
														{
															"type": "model",
															"name": "Socket",
															"source": "Structure/Village/Tiles/Model/Socket.fbx",
															"x": -0.9299999999999999,
															"y": 2.669999999999998,
															"scaleY": 1.0000000000000002,
															"scaleZ": 1.0000000000000002,
															"rotationZ": 100
														},
														{
															"type": "model",
															"name": "Socket",
															"source": "Structure/Village/Tiles/Model/Socket.fbx",
															"x": 1.5300000000000011,
															"y": 1.2099999999999986,
															"scaleY": 1.0000000000000002,
															"scaleZ": 1.0000000000000002,
															"rotationZ": 100
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon",
											"editorOnly": true,
											"locked": true,
											"x": -0.024,
											"y": 0.35499400000000003,
											"z": -0.7779219999999999,
											"scaleX": 4000,
											"scaleY": 4000,
											"scaleZ": 2,
											"color": -14869219,
											"kind": 0,
											"args": [
												0
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Bol",
									"z": -1.55721,
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.2,
									"children": [
										{
											"type": "emitter",
											"name": "BolSharpInfinty",
											"props": {
												"instScale": 9,
												"lifeTime": 2,
												"instRotation": [
													0,
													180,
													0
												],
												"emitRate": 2,
												"emitType": "Burst"
											},
											"z": 1,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "model",
													"name": "Hemisphere",
													"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
													"scaleX": 5,
													"scaleY": 5,
													"scaleZ": 7,
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
																	"enableStencil": false,
																	"parallax": 0
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
																"alpha": 1.25,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": -0.03,
																"texture": "Fx/Gradients/GradientSpice_2.png",
																"onDecal": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": -0.0031778692272519393,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.5056226185032769,
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
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.34,
																"saturation": 1,
																"width": 0.5,
																"uvScaleX": 3,
																"uvScaleY": 4,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.25,
																	0.05
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
																			"time": 0.2090824569425393,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.11604552724598342,
																				"dt": -0.49988189441195807
																			},
																			"nextHandle": {
																				"dv": -0.06666666666666665,
																				"dt": 0.2871757354061881
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
																"range": 1.5,
																"power": 0.8
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
																	0.14509803921568626,
																	0.09411764705882353,
																	0.17254901960784313
																]
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instRotation.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 18,
															"mode": 2
														},
														{
															"time": 1,
															"value": 150,
															"mode": 0,
															"prevHandle": {
																"dv": -12,
																"dt": -0.5854014598540146
															},
															"nextHandle": {
																"dv": 6.832832721310788,
																"dt": 0.33332918749948154
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"z": -0.36749,
									"scaleX": 45,
									"scaleY": 45,
									"scaleZ": 2,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"fadePower": 1.8,
									"fadeStart": 0.08,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.4,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.014159784266047915,
																"dt": -0.2461037962976163
															},
															"nextHandle": {
																"dv": -0.03276054305348097,
																"dt": 0.3280474252074307
															}
														},
														{
															"time": 2,
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
													0.07058823529411765,
													0.00392156862745098,
													0.050980392156862744
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Swirl",
									"source": "Fx/Event/Swirl.fbx",
									"z": -0.4,
									"scaleX": 9.5,
									"scaleY": 9.5,
									"scaleZ": 7.65,
									"rotationZ": 42.6,
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
													"enableStencil": false,
													"parallax": 0,
													"emissive": 0.5
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
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01v_A.png",
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
												"progress": 0.5,
												"saturation": 0,
												"width": 0.4,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.3,
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.4,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.014159784266047915,
																"dt": -0.2461037962976163
															},
															"nextHandle": {
																"dv": -0.03276054305348097,
																"dt": 0.3280474252074307
															}
														},
														{
															"time": 2,
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
												"range": 1.5,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 7,
													"value": 1,
													"mode": 2
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
												"progress": 0.34,
												"saturation": 0,
												"width": 0.58,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.3,
													-0.1
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0.2090824569425393,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.11604552724598342,
																"dt": -0.49988189441195807
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.2871757354061881
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 1,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Logo",
							"children": [
								{
									"type": "advancedDecal",
									"name": "growingcircle",
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 10,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadeStart": 1,
									"emissive": 0.5,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.5
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.3,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_Ping04_thin.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.8
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.2,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.050000000000000044,
														"dt": -0.13257792518086675
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.20874632859099534
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
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.75,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 1,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Awake",
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.6,
					"children": [
						{
							"type": "advancedDecal",
							"name": "outsidecircle",
							"scaleX": 45,
							"scaleY": 45,
							"scaleZ": 56.25,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.75,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_CirclePattern05.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.46,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9949999999999999,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9999999999999998,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4949999999999999,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": 7.582140275681317e-16,
												"dt": -1.085221202809173
											},
											"nextHandle": {
												"dv": -7.582140275681317e-16,
												"dt": 1.085221202809173
											}
										},
										{
											"time": 1.9999999999999998,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 2.5,
											"value": 1,
											"mode": 0
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "insidecircle",
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 4.68,
							"rotationZ": 14,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.75,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/FloorScan_Round_12_1024_thick.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.46,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9949999999999999,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9999999999999998,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
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
											"time": 1.4949999999999999,
											"value": 0.01,
											"mode": 0,
											"prevHandle": {
												"dv": 0.004397321428571419,
												"dt": -1.0511728395061728
											},
											"nextHandle": {
												"dv": -0.0007187892533181729,
												"dt": 0.1671095069447516
											}
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.5,
											"value": 0,
											"mode": 0
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"enabled": false,
							"props": {
								"sandBlend": 0.5,
								"sandColorSet": false,
								"envBlend": 1,
								"envColorSet": false
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
									0.8156862745098039,
									0.49019607843137253,
									0
								]
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}