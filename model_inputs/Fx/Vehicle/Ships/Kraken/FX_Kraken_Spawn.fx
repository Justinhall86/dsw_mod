{
	"type": "fx",
	"duration": 6,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"enabled": false,
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
					"type": "model",
					"name": "Kraken",
					"source": "Vehicle/Atreide/Kraken/Kraken.fbx",
					"editorOnly": true,
					"scaleX": 1.6,
					"scaleY": 1.6,
					"scaleZ": 1.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Banshee/Anim_Banshee_Spawn.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Spawn",
					"x": 0.91406,
					"y": -0.38335,
					"z": 1.06295,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "object",
							"name": "FLOORSAND",
							"x": -0.31784416666666665,
							"y": 0.38334666666666656,
							"z": -0.09295333333333322,
							"children": [
								{
									"type": "emitter",
									"name": "SandFloor2",
									"props": {
										"instScale_rand": 0.5,
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
											180
										],
										"lifeTimeRand": 0.2,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 7,
										"lifeTime": 0.65,
										"emitRad1": 0.64,
										"emitRad2": 0.89,
										"randomColor2": [
											0.6705882352941176,
											0.596078431372549,
											0.5568627450980392,
											1
										],
										"instSpeed_rand": [
											2,
											0,
											0
										],
										"emitRate": 25,
										"maxCount": 60,
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
											4,
											0,
											0
										],
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"alignMode": "Screen"
									},
									"scaleX": 3,
									"scaleY": 4.28,
									"scaleZ": 0.04,
									"rotationZ": -89.99999999999999,
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
														"progress": 0.7,
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
														"range": 1.5,
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
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": -0.827144588185986,
														"dt": -0.512990755987711
													},
													"nextHandle": {
														"dv": 0.537534364642519,
														"dt": 0.3374369812011724
													}
												},
												{
													"time": 1,
													"value": 1.0582053444602273,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0548504453716856,
														"dt": -0.5364207458496086
													},
													"nextHandle": {
														"dv": 0.03370328877818467,
														"dt": 0.33218191941495984
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
													"time": -0.013680774467064838,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6251960499119025,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.5333333333333333,
														"dt": -0.4725329589843752
													},
													"nextHandle": {
														"dv": 0.016666666666666607,
														"dt": 0.31836303710937575
													}
												},
												{
													"time": 0.9654880605172385,
													"value": 0.9833333333333334,
													"mode": 0,
													"prevHandle": {
														"dv": 0.013998838370318695,
														"dt": -0.16649398454989783
													},
													"nextHandle": {
														"dv": -0.050000000000000044,
														"dt": 0.5973310007620591
													}
												},
												{
													"time": 1.927534067435193,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.5
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
							"name": "Distort",
							"x": 0.3178441666666667,
							"y": -0.38334666666666656,
							"z": 0.09295333333333344,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.25,
							"children": [
								{
									"type": "emitter",
									"name": "HeatWave_Distort",
									"props": {
										"lifeTime": 3,
										"lifeTimeRand": 2,
										"emitRate": 2,
										"useRandomColor": true,
										"randomColor1": [
											1,
											1,
											1,
											0.8313725490196078
										],
										"randomColor2": [
											0.9019607843137255,
											0.9019607843137255,
											0.9019607843137255,
											0.7294117647058823
										],
										"instScale": 250,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"instScale_rand": 20,
										"maxCount": 10
									},
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
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
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.8,
														"sandColorSet": false,
														"envBlend": 0.2,
														"envColorSet": false
													}
												},
												{
													"type": "shader",
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
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
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/sand-normal.png",
														"intensity": 0.015
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
										},
										{
											"type": "curve",
											"name": "emitRate",
											"keyMode": 1,
											"keys": [
												{
													"time": -0.20410378467757218,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.1788281153468414,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.050000000000000155,
														"dt": -0.3649115753173824
													},
													"nextHandle": {
														"dv": -0.033333333333333326,
														"dt": 0.1216371917724608
													}
												},
												{
													"time": 0.6379647921351737,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0156341411588999,
														"dt": -0.16639813980499726
													},
													"nextHandle": {
														"dv": -0.03333333333333355,
														"dt": 0.3547751426696766
													}
												},
												{
													"time": 1.2686761568812668,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.5
													}
												}
											]
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Spawn",
					"enabled": false,
					"x": 0.91406,
					"y": -0.38335,
					"z": 1.06295,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "object",
							"name": "FLOORSAND",
							"x": -0.31784416666666665,
							"y": 0.38334666666666656,
							"z": -0.09295333333333322,
							"children": [
								{
									"type": "emitter",
									"name": "SandFloor2",
									"props": {
										"instScale_rand": 0.5,
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
											180
										],
										"lifeTimeRand": 0.2,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 7,
										"lifeTime": 1.3,
										"emitRad1": 0.64,
										"emitRad2": 0.89,
										"randomColor2": [
											0.6705882352941176,
											0.596078431372549,
											0.5568627450980392,
											1
										],
										"instSpeed_rand": [
											2,
											0,
											0
										],
										"emitRate": 25,
										"maxCount": 60,
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
											4,
											0,
											0
										],
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"alignMode": "Screen"
									},
									"scaleX": 3,
									"scaleY": 4.28,
									"scaleZ": 0.04,
									"rotationZ": -89.99999999999999,
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
														"progress": 0.7,
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
														"range": 1.5,
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
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": -0.827144588185986,
														"dt": -0.512990755987711
													},
													"nextHandle": {
														"dv": 0.537534364642519,
														"dt": 0.3374369812011724
													}
												},
												{
													"time": 1,
													"value": 1.0582053444602273,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0548504453716856,
														"dt": -0.5364207458496086
													},
													"nextHandle": {
														"dv": 0.03370328877818467,
														"dt": 0.33218191941495984
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
													"time": 1.184670818550513,
													"value": 0,
													"mode": 0
												},
												{
													"time": 2.2109846241306523,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.5333333333333333,
														"dt": -0.4725329589843752
													},
													"nextHandle": {
														"dv": 0.016666666666666607,
														"dt": 0.31836303710937575
													}
												},
												{
													"time": 2.839601830048488,
													"value": 0.9833333333333334,
													"mode": 0,
													"prevHandle": {
														"dv": 0.003049479409525164,
														"dt": -0.16665774004934028
													},
													"nextHandle": {
														"dv": -0.01666666666666672,
														"dt": 0.9108535024523738
													}
												},
												{
													"time": 4.225125467581677,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.5
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
							"name": "Distort",
							"x": 0.3178441666666667,
							"y": -0.38334666666666656,
							"z": 0.09295333333333344,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.25,
							"children": [
								{
									"type": "emitter",
									"name": "HeatWave_Distort",
									"props": {
										"lifeTime": 6,
										"lifeTimeRand": 2,
										"emitRate": 2,
										"useRandomColor": true,
										"randomColor1": [
											1,
											1,
											1,
											0.8313725490196078
										],
										"randomColor2": [
											0.9019607843137255,
											0.9019607843137255,
											0.9019607843137255,
											0.7294117647058823
										],
										"instScale": 250,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"instScale_rand": 20,
										"maxCount": 10
									},
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
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
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.8,
														"sandColorSet": false,
														"envBlend": 0.2,
														"envColorSet": false
													}
												},
												{
													"type": "shader",
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
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
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/sand-normal.png",
														"intensity": 0.015
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
										},
										{
											"type": "curve",
											"name": "emitRate",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.9942478083400057,
													"value": 0,
													"mode": 0
												},
												{
													"time": 1.7646166895655913,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.050000000000000155,
														"dt": -0.3649115753173824
													},
													"nextHandle": {
														"dv": -0.033333333333333326,
														"dt": 0.1216371917724608
													}
												},
												{
													"time": 2.5120785616664234,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0156341411588999,
														"dt": -0.16639813980499726
													},
													"nextHandle": {
														"dv": -0.03333333333333355,
														"dt": 0.3547751426696766
													}
												},
												{
													"time": 3.5662675570277504,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.5
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