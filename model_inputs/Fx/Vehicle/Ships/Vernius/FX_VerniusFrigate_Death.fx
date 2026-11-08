{
	"type": "fx",
	"duration": 23,
	"cullingRadius": 50,
	"blendFactor": 1,
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
					"name": "FolderRelay",
					"source": "Vehicle/Vernius/FolderRelay/FolderRelay.fbx",
					"editorOnly": true,
					"z": 10,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 3,
					"rotationZ": -89.99999999999999,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/FolderRelay/Anim_FolderRelay_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Death",
					"y": 4.16243,
					"children": [
						{
							"type": "object",
							"name": "smoke",
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
										"instScale": 5,
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
									"x": 4.440892098500626e-16,
									"y": 3.436180000000003,
									"z": -7.771561172376096e-16,
									"scaleX": 0.9999999999999999,
									"scaleZ": 0.9999999999999998,
									"rotationX": -2.981770013872047e-15,
									"rotationY": 2.385416011097638e-15,
									"rotationZ": 8.400000000000006,
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
													"time": 3.5480616649949086,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.8845942505213173,
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
													"time": 11.477061817084733,
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
													"value": 0.4260683760683762,
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
										"instScale": 5,
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
									"x": -0.13149,
									"y": 0.38201,
									"z": -0.75772,
									"rotationY": 14.6,
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
													"time": 3.191981376950718,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.113531810463683,
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
													"time": 10.222043938583509,
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
									"enabled": false,
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
										"instScale": 5,
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
									"x": -0.98974,
									"y": -1.5326,
									"z": 1.83434,
									"rotationX": -46.2,
									"rotationY": -18.3,
									"rotationZ": -13.4,
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
													"time": 3.0723438998559263,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.24181673915592,
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
													"time": 10.188288803393204,
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
													"value": 0.6455128205128207,
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
						},
						{
							"type": "object",
							"name": "LIGHTS",
							"y": -4.15029,
							"rotationX": -90,
							"children": [
								{
									"type": "model",
									"name": "VerniusFregate_LightsPole",
									"source": "Fx/Meshes_Common/VerniusFregate_Lights.fbx",
									"z": -4.02,
									"rotationZ": -60,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 15,
													"alphaKill": true,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.27058823529411763,
													0.1764705882352941,
													0.996078431372549
												]
											}
										}
									]
								},
								{
									"type": "model",
									"name": "VerniusFregate_LightsPole",
									"source": "Fx/Meshes_Common/VerniusFregate_LightsPole.fbx",
									"z": -4.02,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 8,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.7,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.15544841989685712,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.17934908267086094,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.004141679498037498,
														"dt": -0.3268503072465814
													},
													"nextHandle": {
														"dv": 0.007423737939468933,
														"dt": 0.7957663566574078
													}
												},
												{
													"time": 6.25502233977957,
													"value": 0,
													"mode": 2
												},
												{
													"time": 6.26502233977957,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.468441479311457,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0053686888213656525,
														"dt": -2.0967409957903858
													},
													"nextHandle": {
														"dv": 0.009869669766613834,
														"dt": 2.0584898002857672
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
							"name": "Explosions",
							"x": 0.07738257575757579,
							"y": -0.31901168831168825,
							"z": -0.1871653246753247,
							"children": [
								{
									"type": "object",
									"name": "Electricity",
									"x": -0.07738257575757576,
									"y": 0.31901168831168736,
									"z": 0.18716532467532454,
									"scaleX": 0.9999999999999999,
									"scaleY": 0.9999999999999999,
									"scaleZ": 0.9999999999999999,
									"rotationX": -7.951386703658793e-16,
									"rotationY": 9.939233379573491e-17,
									"children": [
										{
											"type": "object",
											"name": "Elec01",
											"scaleX": 0.6,
											"scaleY": 0.6,
											"scaleZ": 0.6,
											"children": [
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"frameCount": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
														"instScale_rand": 0,
														"warmUpTime": -3.55,
														"emitType": "Burst",
														"enableSort": false,
														"animationSpeed": 0.7,
														"instStretch": [
															1.6,
															1.2,
															1
														],
														"lifeTime": 0.15,
														"instScale": 3.5,
														"burstCount": 2,
														"burstDelay": 3,
														"emitSurface": true
													},
													"x": 4.64288,
													"y": 0.81311,
													"z": -1.12019,
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationX": 154.6,
													"rotationY": 11.4,
													"rotationZ": -66.5,
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
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 0.1,
																		"power": 1
																	}
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
												},
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"frameCount": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
														"instScale_rand": 0,
														"warmUpTime": -3.45,
														"emitType": "Burst",
														"enableSort": false,
														"animationSpeed": 0.7,
														"instStretch": [
															1.6,
															1,
															1
														],
														"lifeTime": 0.15,
														"instScale": 2.8,
														"burstCount": 2,
														"burstDelay": 3,
														"emitSurface": true
													},
													"x": -3.22532,
													"y": 0.18442,
													"z": 3.85242,
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationX": -43.9,
													"rotationY": -26.6,
													"rotationZ": -117.1,
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
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 0.1,
																		"power": 1
																	}
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
											"enabled": false,
											"children": [
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"frameCount": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
														"instScale_rand": 0,
														"warmUpTime": -6.8,
														"emitType": "Burst",
														"enableSort": false,
														"animationSpeed": 0.7,
														"instStretch": [
															1.5,
															0.95,
															1
														],
														"lifeTime": 0.1,
														"instScale": 1.4,
														"burstCount": 2,
														"burstDelay": 3
													},
													"x": 0.75711,
													"y": 1.73684,
													"z": 2.69727,
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationX": -89.8,
													"rotationY": 20.3,
													"rotationZ": -41.9,
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
												},
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"frameCount": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
														"instScale_rand": 0,
														"warmUpTime": -7,
														"emitType": "Burst",
														"enableSort": false,
														"animationSpeed": 0.7,
														"instStretch": [
															1,
															0.7,
															1
														],
														"lifeTime": 0.1,
														"instScale": 1.4,
														"burstCount": 2,
														"burstDelay": 3
													},
													"x": -0.87494,
													"y": 1.13015,
													"z": 1.77284,
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationX": -112,
													"rotationY": -34.6,
													"rotationZ": 62.5,
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
												"burstParticleCount": 10,
												"emitOrientation": "Speed",
												"emitShape": "Cone",
												"emitAngle": 57.27,
												"instSpeed": [
													12,
													0,
													0
												],
												"lifeTime": 0.45,
												"warmUpTime": -15,
												"emitSurface": true,
												"instStretch": [
													2.2,
													1,
													1
												],
												"instScale": 0.5,
												"instScale_rand": 0.3,
												"instSpeed_rand": [
													5,
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
												"burstDelay": 2,
												"burstCount": 2
											},
											"x": -2.26875,
											"y": -1.23202,
											"z": -0.11093,
											"scaleY": 1.0000000000000002,
											"rotationZ": 143.1,
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
										}
									]
								},
								{
									"type": "object",
									"name": "TopExplosions",
									"x": 1.600337424242424,
									"y": 1.2362116883116876,
									"z": 0.7122553246753245,
									"scaleX": 0.9999999999999999,
									"scaleY": 0.9999999999999999,
									"scaleZ": 0.9999999999999999,
									"rotationX": -4.9696166897867456e-17,
									"rotationY": -7.951386703658793e-16,
									"rotationZ": -89.99999999999999,
									"children": [
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": -2.77675,
											"y": -1.84826,
											"z": -1.64552,
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.3,
											"rotationY": -107.9,
											"rotationZ": 22.7,
											"time": 0.68
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": -0.46338,
											"y": -1.19209,
											"z": 1.0359,
											"scaleX": 0.2,
											"scaleY": 0.2,
											"scaleZ": 0.2,
											"rotationX": -20.3,
											"rotationY": -28,
											"rotationZ": 0.9,
											"time": 0.815
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": 1.71975,
											"y": -0.51657,
											"z": -1.56032,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": -28.9,
											"rotationY": -101.7,
											"rotationZ": -23.8,
											"time": 0.91237
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": 3.14624,
											"y": -0.98652,
											"z": 1.34801,
											"scaleX": 0.25,
											"scaleY": 0.25,
											"scaleZ": 0.25,
											"rotationY": 1.2,
											"time": 1.05389
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": 4.66055,
											"y": -0.26376,
											"z": -1.55549,
											"scaleX": 0.35,
											"scaleY": 0.35,
											"scaleZ": 0.35,
											"rotationX": -25.2,
											"rotationY": -133.3,
											"rotationZ": -65.5,
											"time": 1.18638
										}
									]
								},
								{
									"type": "object",
									"name": "SideExplosions",
									"x": -0.07738257575757579,
									"y": 0.10692168831168747,
									"z": -0.1705446753246755,
									"scaleX": 0.9999999999999999,
									"scaleY": 0.9999999999999999,
									"scaleZ": 0.9999999999999999,
									"rotationX": -7.951386703658793e-16,
									"rotationY": 9.939233379573491e-17,
									"children": [
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": -1.21916,
											"y": 3.41114,
											"z": 2.19737,
											"scaleX": 0.25,
											"scaleY": 0.25,
											"scaleZ": 0.25,
											"rotationX": 36.8,
											"rotationY": -79.9,
											"rotationZ": -65.1,
											"time": 0.54501
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": -1.15254,
											"y": 0.27827,
											"z": 1.29734,
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.3,
											"rotationX": -35.9,
											"rotationY": -90,
											"time": 0.93344
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": -1.32527,
											"y": -1.98158,
											"z": 2.60714,
											"scaleX": 0.35,
											"scaleY": 0.35,
											"scaleZ": 0.35,
											"rotationX": 11.6,
											"rotationY": -36.9,
											"rotationZ": -23.2,
											"time": 1.12917
										}
									]
								},
								{
									"type": "object",
									"name": "Explo1",
									"x": 1.1069474242424242,
									"y": -0.28357831168831193,
									"z": 0.29406532467532454,
									"scaleY": 0.9999999999999999,
									"rotationX": -8.173914343245263e-16,
									"rotationY": -13.400000000000004,
									"children": [
										{
											"type": "subFX",
											"name": "FX_Directional_Explosion_Medium",
											"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
											"x": -0.01627,
											"y": -0.02005,
											"z": 0.37845,
											"scaleX": 0.8,
											"scaleY": 0.8,
											"scaleZ": 0.8,
											"rotationX": 62.9,
											"rotationY": 50.9,
											"rotationZ": 105.9,
											"time": -0.4
										},
										{
											"type": "subFX",
											"name": "FX_Directional_Explosion_Medium",
											"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
											"x": -0.01627,
											"y": -0.02005,
											"z": 0.37845,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 0.4,
											"rotationX": 42.1,
											"rotationY": 33.1,
											"rotationZ": 75.6,
											"time": -0.4
										},
										{
											"type": "subFX",
											"name": "FX_Directional_Explosion_Medium",
											"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
											"x": -0.01627,
											"y": -0.02005,
											"z": 0.37845,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": 4.6,
											"rotationY": 113.8,
											"rotationZ": 37.8,
											"time": -0.4
										},
										{
											"type": "subFX",
											"name": "FX_Directional_Explosion_trails_Base_NoFlare",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
											"x": 0.0000011634238661351048,
											"y": -3.391261094165543e-7,
											"z": 0.000002455900010078782,
											"scaleX": 0.55,
											"scaleY": 0.5499999999999998,
											"scaleZ": 0.75,
											"rotationX": -40.29999999999999,
											"rotationY": 55.60000000000001,
											"rotationZ": 3.1986528961610973e-16,
											"time": -0.1
										}
									]
								},
								{
									"type": "object",
									"name": "Explo2",
									"x": -2.1978225757575753,
									"y": -2.2721783116883127,
									"z": 0.0002353246753245969,
									"scaleY": 0.9999999999999998,
									"rotationX": 5.700000000000002,
									"rotationY": 35.300000000000004,
									"rotationZ": 171,
									"children": [
										{
											"type": "subFX",
											"name": "FX_Directional_Explosion_Medium",
											"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
											"x": 0.07582,
											"y": -0.63609,
											"z": -1.24995,
											"scaleX": 0.7,
											"scaleY": 0.7,
											"scaleZ": 0.7,
											"rotationX": 55,
											"rotationY": 118.4,
											"rotationZ": 91.3,
											"time": -0.4
										},
										{
											"type": "subFX",
											"name": "FX_Directional_Explosion_trails_Base_NoFlare",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
											"x": 0.07222,
											"y": -0.54853,
											"z": -1.25441,
											"scaleX": 0.55,
											"scaleY": 0.5499999999999998,
											"scaleZ": 0.6999999999999996,
											"rotationX": -115.4,
											"rotationY": 66.2,
											"rotationZ": -82.5,
											"time": -0.1
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "LightDecals",
							"children": [
								{
									"type": "advancedDecal",
									"name": "ElectricitySmallLight_01",
									"x": 1.76793,
									"y": 0.06991,
									"z": -0.05197,
									"scaleX": 5,
									"scaleY": 6,
									"scaleZ": 4,
									"rotationX": 90,
									"rotationZ": -54.4,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 45,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
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
															"time": 3.525819874385858,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.5635880860119453,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.8775642021923638,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.519608380779536,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.58514480403171,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.970465677292209,
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
													0.4666666666666667,
													0.8352941176470589,
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
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
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 2.692812670846067,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.702812670846067,
													"value": 1,
													"mode": 2
												},
												{
													"time": 7.992808385982341,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.010697753887188,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ElectricitySmallLight_02",
									"enabled": false,
									"x": 0.89705,
									"y": 6.42863,
									"z": -1.79825,
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 4,
									"rotationY": 60,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 45,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
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
															"time": 4.145656510239794,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.155656510239794,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.405514976062371,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.107462689710107,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.1174626897101065,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.340600640607324,
															"value": 0,
															"mode": 2
														},
														{
															"time": 10.134362276329208,
															"value": 0,
															"mode": 2
														},
														{
															"time": 10.144362276329208,
															"value": 1,
															"mode": 2
														},
														{
															"time": 10.401505170065008,
															"value": 0,
															"mode": 2
														},
														{
															"time": 13.131371615427712,
															"value": 0,
															"mode": 2
														},
														{
															"time": 13.141371615427712,
															"value": 1,
															"mode": 2
														},
														{
															"time": 13.439613415892097,
															"value": 0,
															"mode": 2
														},
														{
															"time": 16.11778895367246,
															"value": 0,
															"mode": 2
														},
														{
															"time": 16.12778895367246,
															"value": 1,
															"mode": 2
														},
														{
															"time": 16.439883776642652,
															"value": 0,
															"mode": 2
														},
														{
															"time": 19.13470557571762,
															"value": 0,
															"mode": 2
														},
														{
															"time": 19.144705575717623,
															"value": 1,
															"mode": 2
														},
														{
															"time": 19.45680039868781,
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
													0.4666666666666667,
													0.8352941176470589,
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
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
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.01,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5274218750000008,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5374218750000006,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ElectricitySmallLight_03",
									"enabled": false,
									"x": 2.83205,
									"y": 5.29281,
									"z": 1.01842,
									"scaleX": 4,
									"scaleY": 4,
									"scaleZ": 2,
									"rotationX": 90,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 45,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
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
															"time": 5.0011305346611685,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.011130534661168,
															"value": 1.2,
															"mode": 2
														},
														{
															"time": 5.239294969095998,
															"value": -0.016666666666666663,
															"mode": 2
														},
														{
															"time": 5.82679531991924,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.84991345495407,
															"value": 0.9830555555555555,
															"mode": 2
														},
														{
															"time": 6.098132209417077,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.662263191304579,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.6722631913045785,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.922121657127155,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.290597666566022,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.300597666566022,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.523735617463238,
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
													0.4666666666666667,
													0.8352941176470589,
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
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
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.01,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5274218750000008,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5374218750000006,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"x": 1.82666,
									"y": 0.11604,
									"z": 0.95247,
									"scaleX": 6.75,
									"scaleY": 6.75,
									"scaleZ": 2.81,
									"rotationY": 61.9,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"enabled": false,
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.10332038599887777,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.21708307707401148,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.59928746418818,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.08690437641939565,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.09690437641939563,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7454778393049197,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7623528393049201,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo02",
									"x": -1.27381,
									"y": -2.32622,
									"z": -1.55036,
									"scaleX": 6.75,
									"scaleY": 6.75,
									"scaleZ": 2.81,
									"rotationX": 0.8,
									"rotationY": 57.2,
									"rotationZ": 3.8,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 4,
									"emissive": 60,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.10332038599887777,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.21708307707401148,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.59928746418818,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.08690437641939565,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.09690437641939563,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7454778393049197,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7623528393049201,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ExploS01",
									"x": -0.92124,
									"y": 2.7534,
									"z": 0.94132,
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 1.46,
									"rotationY": -41.1,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.9560096393684728,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1331254838474019,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.5153298709615703,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.835830938713857,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0129467831927863,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.501279401599381,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.6783952460783103,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ExploS02",
									"x": 0.58463,
									"y": 1.32449,
									"z": 1.66896,
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 1.46,
									"rotationY": 23.8,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 1.1911868039659357,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3683026484448648,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.7505070355590355,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 1.07100810331132,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.2481239477902493,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.7364565661968463,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.9135724106757754,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ExploS02",
									"x": -1.42953,
									"y": 0.06242,
									"z": 1.27111,
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 1.46,
									"rotationX": -33.4,
									"rotationY": -44.6,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 1.3206689475794293,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4977847920583585,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.8799891791725254,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 1.2004902469248135,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.377606091403743,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.865938709810336,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.0430545542892653,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ExploS03",
									"x": 1.21314,
									"y": -0.57354,
									"z": -1.21422,
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 1.46,
									"rotationX": 34.5,
									"rotationY": -51.1,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 1.3206689475794293,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4977847920583585,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.8799891791725254,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 1.2004902469248135,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.377606091403743,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.865938709810336,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.0430545542892653,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ExploS04",
									"x": -0.31117,
									"y": -2.95378,
									"z": 0.35055,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 4,
									"rotationX": 90,
									"rotationZ": -12.5,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"enabled": false,
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 1.486283538093166,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.6633993825720952,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.045603769686262,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 1.3661048374385503,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5432206819174796,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.031553300324073,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.208669144803002,
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
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Death",
					"target": "FXAnimation.FXRoot.FolderRelay.root.JNT_Root"
				}
			]
		}
	]
}