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
					"name": "FX_DeathFinalExplosion",
					"source": "Fx/Vehicle/Ships/FX_DeathFinalExplosion.fx",
					"time": 3.27475
				},
				{
					"type": "subFX",
					"name": "FX_DeathFloor_Dust",
					"source": "Fx/Vehicle/Ships/FX_DeathFloor_Dust.fx",
					"time": -0.85
				},
				{
					"type": "object",
					"name": "DeathFloor",
					"enabled": false,
					"x": -0.26821,
					"y": 3.64786,
					"rotationZ": 5.5,
					"children": [
						{
							"type": "object",
							"name": "group",
							"x": 1.2829,
							"y": -3.39664,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "emitter",
									"name": "ShockWave3",
									"props": {
										"emitType": "Burst",
										"instScale": 275,
										"emitDuration": 20,
										"burstDelay": 1.35,
										"speedFactor": 0.5,
										"lifeTime": 15,
										"warmUpTime": -2.25
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
														"alpha": 0.4,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_BlurCircle.png",
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.286550392695083,
																		"dt": -0.31785362643054976
																	},
																	"nextHandle": {
																		"dv": -0.85,
																		"dt": 0.21000000000000002
																	}
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
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.28500000000000003,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.36,
																	"value": 0.6,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.6499999999999999
																	},
																	"nextHandle": {
																		"dv": -2.7211090888961944e-16,
																		"dt": 0.3332931287768935
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.41000000000000025,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.42000000000000026,
																	"value": 0.35,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.405
																	},
																	"nextHandle": {
																		"dv": 0.013714721486098064,
																		"dt": 0.33326773211218813
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.4600000000000005,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.47000000000000053,
																	"value": 0.35,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.405
																	},
																	"nextHandle": {
																		"dv": 0.013714721486098064,
																		"dt": 0.33326773211218813
																	}
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
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.6,
														"envColorSet": false
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
														"progress": 0.64,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 3,
														"texture": "Fx/noise/T_Noise_Grunge_02.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
																	"time": 0.0049999999999999975,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9949999999999999,
																	"value": 0.4,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.8949999999999999
																	},
																	"nextHandle": {
																		"dv": -1.347456942463063e-16,
																		"dt": 0.33008462768233626
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.0006153761397992286,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": -0.5609260576910832,
														"dt": -0.42893757473558736
													},
													"nextHandle": {
														"dv": 1.1875,
														"dt": 0.0020001101826084625
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.010416666666666519,
														"dt": -0.98203833016689
													},
													"nextHandle": {
														"dv": -0.0008405810382348004,
														"dt": 0.0792558235752288
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "SandShockWave",
									"y": 2.5,
									"z": 2.19055,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"children": [
										{
											"type": "emitter",
											"name": "Impact_Burst_Mid_SandJet_L",
											"props": {
												"instScale_rand": 3.5,
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
													15
												],
												"lifeTimeRand": 3,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 10,
												"lifeTime": 5,
												"emitRad1": 0.8,
												"randomColor2": [
													0.8431372549019608,
													0.7607843137254902,
													0.7254901960784313,
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
													2,
													1
												],
												"warmUpTime": -3.95,
												"emitType": "Burst",
												"burstParticleCount": 8,
												"emitAngle": 180,
												"instRotation": [
													0,
													0,
													-30
												],
												"emitDuration": 20,
												"burstDelay": 1.35,
												"seedGroup": 3,
												"instSpeed": [
													2,
													0,
													0
												],
												"emitRad2": 0.9,
												"useRandomColor": true
											},
											"x": -0.7514,
											"z": -0.32935,
											"scaleX": 35,
											"scaleY": 35,
											"scaleZ": 0.23,
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
																"scale": 0.7
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
																"dv": -1.388476860780481,
																"dt": -0.06199247660355442
															},
															"nextHandle": {
																"dv": 0.7972549709272361,
																"dt": 0.03559570312500002
															}
														},
														{
															"time": 1,
															"value": 1.0582053444602273,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.92880859375
															},
															"nextHandle": {
																"dv": -2.5729900539317147e-16,
																"dt": 0.42212406308208533
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
												"instScale_rand": 3.5,
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
													15
												],
												"lifeTimeRand": 3,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 10,
												"lifeTime": 5,
												"emitRad1": 0.8,
												"randomColor2": [
													0.8431372549019608,
													0.7607843137254902,
													0.7254901960784313,
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
													2,
													1
												],
												"warmUpTime": -3.95,
												"emitType": "Burst",
												"burstParticleCount": 8,
												"emitAngle": 180,
												"instRotation": [
													0,
													0,
													30
												],
												"emitDuration": 20,
												"burstDelay": 1.35,
												"seedGroup": 2,
												"instSpeed": [
													2,
													0,
													0
												],
												"emitRad2": 0.9,
												"useRandomColor": true
											},
											"x": -0.7514,
											"z": -0.32935,
											"scaleX": 35,
											"scaleY": 35,
											"scaleZ": 0.23,
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
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 0.7
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
																"dv": -1.388476860780481,
																"dt": -0.06199247660355442
															},
															"nextHandle": {
																"dv": 0.7972549709272361,
																"dt": 0.03559570312500002
															}
														},
														{
															"time": 1,
															"value": 1.0582053444602273,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.92880859375
															},
															"nextHandle": {
																"dv": -2.5729900539317147e-16,
																"dt": 0.42212406308208533
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
												"instScale_rand": 4,
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
													15
												],
												"lifeTimeRand": 3,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 13,
												"lifeTime": 5,
												"emitRad1": 0.8,
												"randomColor2": [
													0.8431372549019608,
													0.7607843137254902,
													0.7254901960784313,
													1
												],
												"instSpeed_rand": [
													0.5,
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
													2,
													1
												],
												"warmUpTime": -4.1,
												"emitType": "Burst",
												"burstParticleCount": 13,
												"emitAngle": 180,
												"instRotation": [
													0,
													0,
													30
												],
												"emitDuration": 20,
												"burstDelay": 1.35,
												"seedGroup": 5,
												"instSpeed": [
													3,
													0,
													0
												],
												"useRandomColor": true
											},
											"x": -0.7514,
											"z": -0.32935,
											"scaleX": 50,
											"scaleY": 50,
											"scaleZ": 0.16,
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
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 0.7
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
																"dv": -1.388476860780481,
																"dt": -0.06199247660355442
															},
															"nextHandle": {
																"dv": 0.7972549709272361,
																"dt": 0.03559570312500002
															}
														},
														{
															"time": 1,
															"value": 1.0582053444602273,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.92880859375
															},
															"nextHandle": {
																"dv": -2.5729900539317147e-16,
																"dt": 0.42212406308208533
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
												"instScale_rand": 4,
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
													15
												],
												"lifeTimeRand": 3,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 13,
												"lifeTime": 5,
												"emitRad1": 0.8,
												"randomColor2": [
													0.8431372549019608,
													0.7607843137254902,
													0.7254901960784313,
													1
												],
												"instSpeed_rand": [
													0.5,
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
													2,
													1
												],
												"warmUpTime": -4.1,
												"emitType": "Burst",
												"burstParticleCount": 13,
												"emitAngle": 180,
												"instRotation": [
													0,
													0,
													-30
												],
												"emitDuration": 20,
												"burstDelay": 1.35,
												"seedGroup": 4,
												"instSpeed": [
													3,
													0,
													0
												],
												"useRandomColor": true
											},
											"x": -0.7514,
											"z": -0.32935,
											"scaleX": 50,
											"scaleY": 50,
											"scaleZ": 0.16,
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
																"scale": 0.7
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
															"topIntensity": 0.51,
															"topSpan": 0.3,
															"dirIntensity": 0.1,
															"dirSpan": 0,
															"sandBlend": 0.7,
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
															"value": -0.004801283442754212,
															"mode": 0,
															"prevHandle": {
																"dv": -1.388476860780481,
																"dt": -0.06199247660355442
															},
															"nextHandle": {
																"dv": 0.7972549709272361,
																"dt": 0.03559570312500002
															}
														},
														{
															"time": 1,
															"value": 1.0582053444602273,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.92880859375
															},
															"nextHandle": {
																"dv": -2.5729900539317147e-16,
																"dt": 0.42212406308208533
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
												"range": 4,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "emitter",
									"name": "Distort_Chockwave",
									"props": {
										"instScale_rand": 0,
										"maxCount": 50,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.9098039215686274,
											0.615686274509804,
											1,
											0.8509803921568627
										],
										"emitRate": 10,
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
										"emitType": "Burst",
										"burstDelay": 0.3,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"warmUpTime": -4.1,
										"instWorldAcceleration_rand": [
											0,
											0,
											0
										],
										"instScale": 0.8,
										"instOffset": [
											0,
											0,
											25
										]
									},
									"z": -20,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.05,
									"children": [
										{
											"type": "model",
											"name": "Ring",
											"source": "Fx/Meshes_Common/DiskFlat.fbx",
											"scaleX": 200,
											"scaleY": 200,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "Distortion",
															"blend": "Alpha",
															"shadows": false,
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"culling": "None",
															"depthWrite": "On",
															"drawOrder": "-100",
															"emissive": 2.2
														}
													},
													"diffuseMap": "Fx/noise/causticTexture_03-2.png"
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
														"intensity": 0.075
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "intensity",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.8043636363636364,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.5969588995728569,
																		"dt": -0.2623791435549754
																	},
																	"nextHandle": {
																		"dv": -0.5969588995728569,
																		"dt": 0.2623791435549754
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.08425454545454536,
																		"dt": -0.2350000000000001
																	},
																	"nextHandle": {
																		"dv": -0.08425454545454536,
																		"dt": 0.2350000000000001
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1.75,
														"scaleY": 1.75,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0,
														"shiftSpeedY": -0.01
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
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.5
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
															"name": "width",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.5350976805491343,
																	"value": 0.9422222222222223,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.03695353771889259
																	},
																	"nextHandle": {
																		"dv": -6.922428196740585e-16,
																		"dt": 0.24478506621704163
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.5,
																		"dt": -0.18500000000000005
																	},
																	"nextHandle": {
																		"dv": -0.8474237452673484,
																		"dt": 0.3135467857489186
																	}
																}
															]
														}
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
													"time": 0.0049999999999999975,
													"value": 0.0402048299726524,
													"mode": 0,
													"prevHandle": {
														"dv": -0.9239350146379692,
														"dt": -0.3456633226416698
													},
													"nextHandle": {
														"dv": 0.12028199966650588,
														"dt": 0.045000000000000005
													}
												},
												{
													"time": 1,
													"value": 1.0158254939343108,
													"mode": 0,
													"prevHandle": {
														"dv": -0.026729333259223442,
														"dt": -0.865
													},
													"nextHandle": {
														"dv": 0.0103433736750329,
														"dt": 0.33472657705803693
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
							"name": "Decal_Large",
							"x": -1.53796,
							"y": -3.12634,
							"z": 4.50649,
							"scaleX": 66.7,
							"scaleY": 40,
							"scaleZ": 13.3,
							"rotationX": 8.3,
							"rotationY": 1,
							"rotationZ": -6.9,
							"albedoMap": "Fx/Alphas/Destruction_Decal_Alpha.png",
							"albedoStrength": 2,
							"children": [
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.8
									},
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 3.902415370941163,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02356852808625938,
														"dt": -0.4998915283640561
													},
													"nextHandle": {
														"dv": 0.01611111111111113,
														"dt": 0.33834989965171247
													}
												},
												{
													"time": 4.226526989342876,
													"value": 1,
													"mode": 2
												},
												{
													"time": 21.000306001132785,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.01861245247967639,
														"dt": -4.211416294722059
													},
													"nextHandle": {
														"dv": -0.016666666666666607,
														"dt": 3.7753286941931172
													}
												},
												{
													"time": 25.02698407271362,
													"value": 0,
													"mode": 0
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
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.67,
										"saturation": 1,
										"width": 0.24,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": true,
										"envBlend": 0.8,
										"envColorSet": false
									}
								}
							]
						}
					]
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
					"type": "object",
					"name": "Planes",
					"enabled": false,
					"x": 0.07933,
					"y": -1.27855,
					"z": -1.04429,
					"children": [
						{
							"type": "model",
							"name": "PlanePivBot_NoVrtx",
							"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
							"x": -3.486585,
							"y": 10.002882500000002,
							"z": 0.12131750000000008,
							"scaleX": 17.84201163243683,
							"scaleY": 19.217961691254825,
							"scaleZ": 13.692462518979045,
							"rotationX": 5.545360159819014,
							"rotationY": -32.69645846201839,
							"rotationZ": -81.97546400067274,
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
											"colorMask": 255
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_JetSand_90_01.png"
									}
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 1,
									"keys": [
										{
											"time": 3.981412576586008,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0.7,
												"dt": 0.12960920751304128
											}
										},
										{
											"time": 4.981412576586008,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.915441604254537
											},
											"nextHandle": {
												"dv": -0.006044687257184451,
												"dt": 0.3333173150083603
											}
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
										"progress": 0.5,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 1,
											"keys": [
												{
													"time": 3.948838861735768,
													"value": -0.006821632385254017,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3063455200195313
													}
												},
												{
													"time": 4.9579770453295176,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": -0.6501693725585938,
														"dt": 0.5496199035644533
													}
												},
												{
													"time": 6.985263574870534,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.016666666666666607,
														"dt": -0.915441604254537
													},
													"nextHandle": {
														"dv": -0.006044687257184451,
														"dt": 0.3333173150083603
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
										"range": 12,
										"power": 0.8
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
							"type": "model",
							"name": "PlanePivBot_NoVrtx",
							"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
							"x": -2.964925,
							"y": -10.6116675,
							"z": -0.4757125,
							"scaleX": 16.500844648658845,
							"scaleY": 19.805436199371798,
							"scaleZ": 14.651053968246973,
							"rotationX": 8.18,
							"rotationY": 21.82,
							"rotationZ": -89.11417778289012,
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
											"colorMask": 255
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_JetSand_90_01.png"
									}
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 1,
									"keys": [
										{
											"time": 3.981412576586008,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0.7,
												"dt": 0.12960920751304128
											}
										},
										{
											"time": 4.981412576586008,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.915441604254537
											},
											"nextHandle": {
												"dv": -0.006044687257184451,
												"dt": 0.3333173150083603
											}
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
										"progress": 0.5,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 1,
											"keys": [
												{
													"time": 3.948838861735768,
													"value": -0.006821632385254017,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3063455200195313
													}
												},
												{
													"time": 4.9579770453295176,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": -0.6501693725585938,
														"dt": 0.5496199035644533
													}
												},
												{
													"time": 6.985263574870534,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.016666666666666607,
														"dt": -0.915441604254537
													},
													"nextHandle": {
														"dv": -0.006044687257184451,
														"dt": 0.3333173150083603
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
										"range": 12,
										"power": 0.8
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
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "PlanePivBot_NoVrtx",
							"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
							"x": 2.770045,
							"y": 9.2204525,
							"z": 0.5823575000000001,
							"scaleX": 16.02902861617923,
							"scaleY": 9.614341428081406,
							"scaleZ": 21.05498875293422,
							"rotationX": 10.899199023839143,
							"rotationY": -26.73085003255992,
							"rotationZ": -88.7526472091256,
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
											"colorMask": 255
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_JetSand_90_01.png"
									}
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 1,
									"keys": [
										{
											"time": 3.981412576586008,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0.7,
												"dt": 0.12960920751304128
											}
										},
										{
											"time": 4.981412576586008,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.915441604254537
											},
											"nextHandle": {
												"dv": -0.006044687257184451,
												"dt": 0.3333173150083603
											}
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
										"progress": 0.5,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 1,
											"keys": [
												{
													"time": 3.948838861735768,
													"value": -0.006821632385254017,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3063455200195313
													}
												},
												{
													"time": 4.9579770453295176,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": -0.6501693725585938,
														"dt": 0.5496199035644533
													}
												},
												{
													"time": 6.985263574870534,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.016666666666666607,
														"dt": -0.915441604254537
													},
													"nextHandle": {
														"dv": -0.006044687257184451,
														"dt": 0.3333173150083603
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
										"range": 12,
										"power": 0.8
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
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "PlanePivBot_NoVrtx",
							"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
							"x": 3.681465,
							"y": -8.6116675,
							"z": -0.22796250000000007,
							"scaleX": 15.753466051595304,
							"scaleY": 9.887201135660474,
							"scaleZ": 21.581147801327926,
							"rotationY": 19.09,
							"rotationZ": -81.58562073333785,
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
											"colorMask": 255
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_JetSand_90_01.png"
									}
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 1,
									"keys": [
										{
											"time": 3.981412576586008,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0.7,
												"dt": 0.12960920751304128
											}
										},
										{
											"time": 4.981412576586008,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.915441604254537
											},
											"nextHandle": {
												"dv": -0.006044687257184451,
												"dt": 0.3333173150083603
											}
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
										"progress": 0.5,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 1,
											"keys": [
												{
													"time": 3.948838861735768,
													"value": -0.006821632385254017,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3063455200195313
													}
												},
												{
													"time": 4.9579770453295176,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": -0.6501693725585938,
														"dt": 0.5496199035644533
													}
												},
												{
													"time": 6.985263574870534,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.016666666666666607,
														"dt": -0.915441604254537
													},
													"nextHandle": {
														"dv": -0.006044687257184451,
														"dt": 0.3333173150083603
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
										"range": 12,
										"power": 0.8
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
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
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