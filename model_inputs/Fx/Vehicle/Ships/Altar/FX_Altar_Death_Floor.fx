{
	"type": "fx",
	"cullingRadius": 15,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Altar",
					"source": "Vehicle/Fremen/Altar/Altar.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Altar/Anim_Altar_Death.fbx"
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"enabled": false,
					"object": "FXAnimation.FXRoot.Lights",
					"target": "FXAnimation.FXRoot.Altar"
				},
				{
					"type": "light",
					"name": "light_0",
					"editorOnly": true,
					"y": 2.98887,
					"z": -4.03598,
					"power": 2.42,
					"range": 20,
					"size": 2.05,
					"zNear": 0.02
				},
				{
					"type": "object",
					"name": "DeathFloor",
					"children": [
						{
							"type": "object",
							"name": "group",
							"enabled": false,
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
										"warmUpTime": -1.55
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
												"lifeTime": 4,
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
												"warmUpTime": -3.05,
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
												"lifeTime": 4,
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
												"warmUpTime": -3.05,
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
												"lifeTime": 4,
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
												"warmUpTime": -3.2,
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
												"lifeTime": 4,
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
												"warmUpTime": -3.2,
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
										"warmUpTime": -3.25,
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
							"type": "emitter",
							"name": "SandProjectionMesh",
							"enabled": false,
							"props": {
								"enableSort": false,
								"emitSurface": true,
								"frameCount": 2,
								"frameDivisionY": 2,
								"animationSpeed": 0,
								"instStretch": [
									1.1,
									1.1,
									1.7
								],
								"lifeTime": 7,
								"lifeTimeRand": 0.1,
								"warmUpTime": -3.35,
								"emitType": "Burst",
								"instStretch_rand": [
									0.1,
									0.1,
									0.4
								],
								"instScale": 12.5,
								"instScale_rand": 1,
								"seedGroup": 3,
								"useRandomColor": true,
								"randomColor1": [
									0.8235294117647058,
									0.7686274509803921,
									0.7176470588235294,
									1
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"maxCount": 2,
								"randomColor2": [
									0.9764705882352941,
									0.9647058823529412,
									0.9529411764705882,
									1
								],
								"instRotation_rand": [
									0,
									0,
									0
								]
							},
							"x": 2.84613,
							"z": -6.04144,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV",
									"source": "Fx/Meshes_Common/CylinderCone.fbx",
									"scaleX": 0.5,
									"scaleY": 0.25,
									"scaleZ": 0.45,
									"rotationX": 90,
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
													"emissive": 0.3
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"children": [
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
														"texture": "Fx/Alphas/T_SandProjection_Mesh6.png",
														"onDecal": false
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
															0.9764705882352941,
															0.9607843137254902,
															0.9490196078431372
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMapNoise",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
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
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.4807997904821406,
																		"dt": -0.4951636786304198
																	},
																	"nextHandle": {
																		"dv": -0.8169921875000001,
																		"dt": 0.27309197069853475
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
													"name": "DissolveMapGradient",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_SandProjection_Gradient.png",
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.644021307982501,
																		"dt": -0.3649454078567505
																	},
																	"nextHandle": {
																		"dv": -0.6,
																		"dt": 0.34
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
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 1
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.6,
											"mode": 0,
											"prevHandle": {
												"dv": -0.8360452004908794,
												"dt": -0.004266167276962038
											},
											"nextHandle": {
												"dv": 0.4833333333333333,
												"dt": 0.0017933693486200664
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.885
											},
											"nextHandle": {
												"dv": -1.3607186657192811e-16,
												"dt": 0.33333333333333326
											}
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
												"dv": 3.0890297805850073,
												"dt": -0.11575828486016804
											},
											"nextHandle": {
												"dv": -0.9363636363636363,
												"dt": 0.03508928571428571
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.009090909090909038,
												"dt": -0.6245892857142856
											},
											"nextHandle": {
												"dv": 0.008774267419493307,
												"dt": 0.6028344762228577
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
											"value": 0.7,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.033333333333333326,
												"dt": -0.7849999999999999
											},
											"nextHandle": {
												"dv": 0.014153133342954432,
												"dt": 0.33330629022657665
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Decal_Large",
							"enabled": false,
							"x": -1.15285,
							"y": -0.01047,
							"z": 2.70527,
							"scaleX": 60,
							"scaleY": 36,
							"scaleZ": 12,
							"albedoMap": "Fx/Alphas/Destruction_Decal_Alpha.png",
							"albedoStrength": 2,
							"children": [
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.7
									},
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 2.98,
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
													"time": 3.3041116184017123,
													"value": 1,
													"mode": 2
												},
												{
													"time": 15.938660956757161,
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
													"time": 19.965339028337997,
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
					"type": "subFX",
					"name": "FX_DeathFinalExplosion_Debris",
					"source": "Fx/Vehicle/Ships/FX_DeathFinalExplosion_Debris.fx",
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"time": 4.18929
				}
			]
		},
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
		}
	]
}