{
	"type": "fx",
	"cullingRadius": 10,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 2,
			"scaleY": 2,
			"scaleZ": 2,
			"children": [
				{
					"type": "model",
					"name": "Railgun",
					"source": "Vehicle/Vernius/FolderRelay/FolderRelay.fbx",
					"editorOnly": true,
					"z": 5,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Kraken/Anim_Kraken_Idle.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "FLOORTRAIL",
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"rotationZ": 180,
					"children": [
						{
							"type": "emitter",
							"name": "SandFloor2",
							"enabled": false,
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
								"lifeTimeRand": 0.2,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 3,
								"lifeTime": 2,
								"emitRad1": 0.64,
								"emitRad2": 0.89,
								"randomColor2": [
									0.807843137254902,
									0.788235294117647,
									0.7803921568627451,
									1
								],
								"instSpeed_rand": [
									0.025,
									0.25,
									0
								],
								"emitRate": 20,
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
									0.1,
									1,
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
								"maxCount": 40,
								"emitAngle": 360
							},
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 0.1,
							"rotationZ": -120,
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
												"scale": 0.3
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
												"range": 1.2,
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
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.75
							}
						},
						{
							"type": "object",
							"name": "Ripple",
							"z": 0.5,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.25,
							"children": [
								{
									"type": "emitter",
									"name": "Chockwave",
									"props": {
										"lifeTime": 6,
										"lifeTimeRand": 2,
										"emitRate": 1,
										"useRandomColor": true,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.9019607843137255,
											0.9019607843137255,
											0.9019607843137255,
											0.7294117647058823
										],
										"instScale": 50,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"instScale_rand": 2.5,
										"maxCount": 10
									},
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
															"depthTest": "LessEqual",
															"emissive": 2
														}
													}
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_LensFlare_06.png"
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
																	"mode": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.0058489084243771305,
																		"dt": -0.06672153635116596
																	},
																	"nextHandle": {
																		"dv": 0.0058489084243771305,
																		"dt": 0.06672153635116596
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
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.5,
														"sandColorSet": false,
														"envBlend": 0.8,
														"envColorSet": false
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.5294117647058824,
															0.403921568627451,
															1
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															1,
															1,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1,
														"power": 0.8
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
													"value": 0.1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.9944446984687934,
														"dt": -0.48890120703870477
													},
													"nextHandle": {
														"dv": 0.7,
														"dt": 0.3425225781956737
													}
												},
												{
													"time": 1,
													"value": 1,
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
			]
		}
	]
}