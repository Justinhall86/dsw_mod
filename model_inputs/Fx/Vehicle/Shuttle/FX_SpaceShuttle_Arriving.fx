{
	"type": "fx",
	"duration": 11,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "FLOORSAND",
					"x": -2.42,
					"z": 0.48,
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
									1,
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
									3,
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
							"x": 2.42,
							"z": -0.48,
							"scaleX": 5,
							"scaleY": 7,
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
											"time": 3.6832164677977572,
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
											"time": 4.642378881801853,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 6.4933518663188465,
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 1.0878525435319175,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.4134047726541758
													}
												},
												{
													"time": 2.273124717827887,
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
													"time": 2.4354907691013072,
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
													"time": 3.831838810052724,
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
										},
										{
											"type": "curve",
											"name": "emitRate",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.9646292204083884,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.4134047726541758
													}
												},
												{
													"time": 3.149901394704358,
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
													"time": 3.312267445977778,
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
													"time": 4.708615486929195,
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
													"time": 1.9646292204083884,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.4134047726541758
													}
												},
												{
													"time": 3.149901394704358,
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
													"time": 3.312267445977778,
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
													"time": 4.708615486929195,
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
							],
							"enabled": false
						}
					]
				},
				{
					"type": "model",
					"name": "SpaceShuttle",
					"source": "Vehicle/Atreide/SpaceShuttle/SpaceShuttle.fbx",
					"editorOnly": true,
					"scaleX": 2.4,
					"scaleY": 2.4,
					"scaleZ": 2.4,
					"animation": "Anim/SpaceShuttle/Anim_SpaceShuttle_Arriving.fbx",
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/SpaceShuttle/Anim_SpaceShuttle_Arriving.fbx"
						}
					]
				}
			]
		}
	]
}