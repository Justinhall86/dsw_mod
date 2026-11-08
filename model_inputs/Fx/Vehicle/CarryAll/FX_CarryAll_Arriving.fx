{
	"type": "fx",
	"duration": 10.5,
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
			"children": [
				{
					"type": "model",
					"name": "CarryAll",
					"source": "Vehicle/Atreide/CarryAll/CarryAll.fbx",
					"editorOnly": true,
					"scaleX": 2.4,
					"scaleY": 2.4,
					"scaleZ": 2.4,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/CarryAll/Anim_CarryAll_Arriving.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "FLOORSAND",
					"x": -0.75,
					"z": 0.97,
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
								"instScale": 4,
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
								"maxCount": 50,
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
							"scaleX": 7,
							"scaleY": 10,
							"scaleZ": 0.1,
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
											],
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
											],
											"isInstance": true
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
											"value": 0.0035385342353464466,
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
											"time": 2.475,
											"value": 0,
											"mode": 0
										},
										{
											"time": 4.274877929687501,
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
											"time": 5.762704635588453,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0026474846836679242,
												"dt": -0.16666181090700632
											},
											"nextHandle": {
												"dv": -0.016666666666666607,
												"dt": 1.051754150390626
											}
										},
										{
											"time": 7.337655332940632,
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
						},
						{
							"type": "emitter",
							"name": "SandFloor2",
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
								"instScale": 4,
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
								"emitRate": 15,
								"maxCount": 40,
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
							"x": 2.96,
							"scaleX": 7,
							"scaleY": 10,
							"scaleZ": 0.1,
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
												"progress": 0.8,
												"saturation": 0,
												"width": 0.6,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 0.9849999999999999,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.23333333333333334,
																"dt": -0.2599999999999999
															},
															"nextHandle": {
																"dv": -0.2060474409741551,
																"dt": 0.2295957199426298
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"enabled": false,
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.4,
											"dirIntensity": 0.45,
											"dirSpan": 0.67,
											"sandBlend": 1,
											"envBlend": 0.5,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2,
												"power": 0.5
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
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 2,
											"value": 0,
											"mode": 0
										},
										{
											"time": 3.5,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.056754422987069224,
												"dt": -1.0909153395063302
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 5.762704635588453,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0026474846836679242,
												"dt": -0.16666181090700632
											},
											"nextHandle": {
												"dv": -0.016666666666666607,
												"dt": 1.051754150390626
											}
										},
										{
											"time": 7.337655332940632,
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
							],
							"enabled": false
						},
						{
							"type": "object",
							"name": "SandTrails",
							"x": 0.76,
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
											30
										],
										"lifeTimeRand": 0.2,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 4.5,
										"emitAngle": 50,
										"lifeTime": 1.3,
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
										"emitRate": 12,
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
											2.5,
											0,
											0
										],
										"instStartSpeed_rand": [
											1,
											0,
											0
										],
										"instStartSpeed": [
											2,
											0,
											0
										],
										"instWorldSpeed_rand": [
											0,
											0,
											0
										]
									},
									"y": 1.2,
									"scaleX": 2,
									"scaleY": 18,
									"scaleZ": 0.1,
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
															"blend": "Add",
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 0.9849999999999999,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.23333333333333334,
																		"dt": -0.2599999999999999
																	},
																	"nextHandle": {
																		"dv": -0.2060474409741551,
																		"dt": 0.2295957199426298
																	}
																}
															]
														}
													],
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.3,
														"sandColorSet": false,
														"envBlend": 0.4,
														"envColorSet": false
													},
													"isInstance": true
												}
											]
										},
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
											"type": "curve",
											"name": "emitRate",
											"keyMode": 0,
											"keys": [
												{
													"time": 3.5,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01666666666666672,
														"dt": -1.8567681231908497
													},
													"nextHandle": {
														"dv": 0.00750327243209226,
														"dt": 0.8333012740364459
													}
												},
												{
													"time": 6.5,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666607,
														"dt": -1.6069867179961874
													},
													"nextHandle": {
														"dv": 0.008640023538844115,
														"dt": 0.8332908239174701
													}
												},
												{
													"time": 7,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.007468866523462635,
														"dt": -0.7130619345628836
													},
													"nextHandle": {
														"dv": -0.016666666666666607,
														"dt": 1.589164112363946
													}
												},
												{
													"time": 10,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.8333333333333334
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.8333333333333334
													}
												}
											]
										}
									],
									"enabled": false
								},
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
											30
										],
										"lifeTimeRand": 0.2,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 4.5,
										"emitAngle": 50,
										"lifeTime": 1.3,
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
										"emitRate": 12,
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
											2.5,
											0,
											0
										],
										"instStartSpeed_rand": [
											1,
											0,
											0
										],
										"instStartSpeed": [
											2,
											0,
											0
										],
										"instWorldSpeed_rand": [
											0,
											0,
											0
										]
									},
									"y": -1.2,
									"scaleX": 2,
									"scaleY": 18,
									"scaleZ": 0.1,
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
															"blend": "Add",
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 0.9849999999999999,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.23333333333333334,
																		"dt": -0.2599999999999999
																	},
																	"nextHandle": {
																		"dv": -0.2060474409741551,
																		"dt": 0.2295957199426298
																	}
																}
															]
														}
													],
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.3,
														"sandColorSet": false,
														"envBlend": 0.4,
														"envColorSet": false
													},
													"isInstance": true
												}
											]
										},
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
											"type": "curve",
											"name": "emitRate",
											"keyMode": 0,
											"keys": [
												{
													"time": 3.5,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01666666666666672,
														"dt": -1.8567681231908497
													},
													"nextHandle": {
														"dv": 0.00750327243209226,
														"dt": 0.8333012740364459
													}
												},
												{
													"time": 6.5,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666607,
														"dt": -1.6069867179961874
													},
													"nextHandle": {
														"dv": 0.008640023538844115,
														"dt": 0.8332908239174701
													}
												},
												{
													"time": 7,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.007468866523462635,
														"dt": -0.7130619345628836
													},
													"nextHandle": {
														"dv": -0.016666666666666607,
														"dt": 1.589164112363946
													}
												},
												{
													"time": 10,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.8333333333333334
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.8333333333333334
													}
												}
											]
										}
									],
									"enabled": false
								},
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
											30
										],
										"lifeTimeRand": 0.2,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 4.5,
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
											1,
											0,
											0
										],
										"emitRate": 30,
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
											2.5,
											0,
											0
										],
										"instStartSpeed_rand": [
											1,
											0,
											0
										],
										"instStartSpeed": [
											2,
											0,
											0
										],
										"instWorldSpeed_rand": [
											0,
											0,
											0
										]
									},
									"x": 2.2,
									"scaleX": 5,
									"scaleY": 10,
									"scaleZ": 0.1,
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
															"blend": "Add",
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.77,
														"saturation": 0,
														"width": 1,
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
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 0.9849999999999999,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.23333333333333334,
																		"dt": -0.2599999999999999
																	},
																	"nextHandle": {
																		"dv": -0.2060474409741551,
																		"dt": 0.2295957199426298
																	}
																}
															]
														}
													],
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.3,
														"sandColorSet": false,
														"envBlend": 0.4,
														"envColorSet": false
													},
													"isInstance": true
												}
											]
										},
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
											"type": "curve",
											"name": "emitRate",
											"keyMode": 0,
											"keys": [
												{
													"time": 2,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.5,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.056754422987069224,
														"dt": -1.0909153395063302
													},
													"nextHandle": {
														"dv": 0.016666666666666607,
														"dt": 0.31836303710937575
													}
												},
												{
													"time": 4,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0026474846836679242,
														"dt": -0.16666181090700632
													},
													"nextHandle": {
														"dv": -0.016666666666666607,
														"dt": 1.051754150390626
													}
												},
												{
													"time": 6,
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
									],
									"enabled": false
								},
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
											30
										],
										"lifeTimeRand": 0.2,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 4.5,
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
											1,
											0,
											0
										],
										"emitRate": 30,
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
											2.5,
											0,
											0
										],
										"instStartSpeed_rand": [
											1,
											0,
											0
										],
										"instStartSpeed": [
											2,
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
									"x": 2.2,
									"scaleX": 5,
									"scaleY": 10,
									"scaleZ": 0.1,
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
														"progress": 0.77,
														"saturation": 0,
														"width": 1,
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
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 0.9849999999999999,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.23333333333333334,
																		"dt": -0.2599999999999999
																	},
																	"nextHandle": {
																		"dv": -0.2060474409741551,
																		"dt": 0.2295957199426298
																	}
																}
															]
														}
													],
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.3,
														"sandColorSet": false,
														"envBlend": 0.4,
														"envColorSet": false
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 2,
														"power": 0.5
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
											"type": "curve",
											"name": "emitRate",
											"keyMode": 0,
											"keys": [
												{
													"time": 2,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.5,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.056754422987069224,
														"dt": -1.0909153395063302
													},
													"nextHandle": {
														"dv": 0.016666666666666607,
														"dt": 0.31836303710937575
													}
												},
												{
													"time": 4,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0026474846836679242,
														"dt": -0.16666181090700632
													},
													"nextHandle": {
														"dv": -0.016666666666666607,
														"dt": 1.051754150390626
													}
												},
												{
													"time": 6,
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
									],
									"enabled": false
								}
							]
						}
					]
				}
			]
		}
	]
}