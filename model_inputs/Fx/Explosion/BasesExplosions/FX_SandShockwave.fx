{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 1,
			"children": [
				{
					"type": "object",
					"name": "Shockwave",
					"children": [
						{
							"type": "emitter",
							"name": "ShockWave3",
							"props": {
								"emitType": "Burst",
								"instScale": 300,
								"emitDuration": 20,
								"burstDelay": 1.35,
								"speedFactor": 0.5,
								"lifeTime": 15,
								"warmUpTime": -0.35
							},
							"z": 0.5,
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
							"z": 2,
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
										"instScale": 7,
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
										"warmUpTime": -0.6,
										"emitType": "Burst",
										"burstParticleCount": 10,
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
									"scaleX": 40,
									"scaleY": 40,
									"scaleZ": 0.19999999999999998,
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
										"instScale": 7,
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
										"warmUpTime": -0.6,
										"emitType": "Burst",
										"burstParticleCount": 10,
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
									"scaleX": 40,
									"scaleY": 40,
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
										"instScale": 8,
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
										"warmUpTime": -0.75,
										"emitType": "Burst",
										"burstParticleCount": 18,
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
									"scaleX": 55,
									"scaleY": 55,
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
										"instScale": 8,
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
										"warmUpTime": -0.75,
										"emitType": "Burst",
										"burstParticleCount": 18,
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
									"scaleX": 55,
									"scaleY": 55,
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
										"range": 6,
										"power": 0.8
									},
									"isInstance": true
								}
							]
						}
					]
				}
			]
		}
	]
}