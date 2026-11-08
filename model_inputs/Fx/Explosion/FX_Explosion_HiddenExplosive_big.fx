{
	"type": "fx",
	"duration": 6,
	"cullingRadius": 100,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 200,
			"scaleY": 200,
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
					"type": "subFX",
					"name": "AnticipationUnderground",
					"source": "Fx/Explosion/AnticipationUnderground.fx",
					"z": -2,
					"scaleX": 3.5,
					"scaleY": 3.5,
					"scaleZ": 3.5,
					"time": 1.005,
					"children": [
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 5,
								"power": 0.8
							}
						}
					]
				},
				{
					"type": "object",
					"name": "ExplosionSlow",
					"z": 2,
					"children": [
						{
							"type": "object",
							"name": "ShockWave",
							"z": -1,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"children": [
								{
									"type": "emitter",
									"name": "Distort",
									"props": {
										"instScale_rand": 0,
										"maxCount": 5,
										"simulationSpace": "World",
										"animationSpeed": 0.2,
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
										"lifeTime": 1.8,
										"emitType": "Burst",
										"burstDelay": 0.1,
										"instScale": 125,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"warmUpTime": -0.95,
										"instStretch": [
											1,
											1,
											0.01
										]
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Ring",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
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
															"culling": "None"
														}
													},
													"diffuseMap": "Fx/noise/causticTexture_03-2.png"
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
														"texture": "Fx/Alphas/T_circle5.png"
													}
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/perlin2Normal.jpg",
														"intensity": 0.05
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
																		"dv": 1.1438836500205134,
																		"dt": -0.4763721338556696
																	},
																	"nextHandle": {
																		"dv": -0.2551111111111112,
																		"dt": 0.10551280456700678
																	}
																},
																{
																	"time": 1,
																	"value": 0.004242424242424214,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03333333333333333,
																		"dt": -0.51
																	},
																	"nextHandle": {
																		"dv": -0.02178544542538359,
																		"dt": 0.33331731500836026
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
														"scaleX": 0.5,
														"scaleY": 0.5,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0,
														"shiftSpeedY": -0.01
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 3,
														"power": 1
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
													"value": 0.012707392165911546,
													"mode": 0,
													"prevHandle": {
														"dv": -2.476916055641238,
														"dt": -0.11081055179448417
													},
													"nextHandle": {
														"dv": 1.1289962707111405,
														"dt": 0.05
													}
												},
												{
													"time": 1,
													"value": 1.01469963255798,
													"mode": 0,
													"prevHandle": {
														"dv": -0.12648137998854092,
														"dt": -0.69
													},
													"nextHandle": {
														"dv": 0.04797846416818524,
														"dt": 0.2699185912801351
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sand_Outline_ShockWave",
									"props": {
										"warmUpTime": -0.95,
										"emitType": "Burst",
										"instScale": 270,
										"lifeTime": 2.15,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"maxCount": 5
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
															"drawOrder": "100"
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
														"alpha": 4,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_SmokeDonut.png",
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.21,
														"saturation": 1,
														"width": 0.55,
														"uvScaleX": 3,
														"uvScaleY": 3.25,
														"texture": "Fx/noise/T_Noise_Grunge_02.png",
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
														"progress": 0.4,
														"saturation": 1,
														"width": 0.45,
														"uvScaleX": 2,
														"uvScaleY": 2.25,
														"texture": "Fx/noise/Water_01.png",
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
													"value": 0.012707392165911546,
													"mode": 0,
													"prevHandle": {
														"dv": -2.476916055641238,
														"dt": -0.11081055179448417
													},
													"nextHandle": {
														"dv": 1.1289962707111405,
														"dt": 0.05
													}
												},
												{
													"time": 1,
													"value": 1.01469963255798,
													"mode": 0,
													"prevHandle": {
														"dv": -0.12648137998854092,
														"dt": -0.69
													},
													"nextHandle": {
														"dv": 0.04797846416818524,
														"dt": 0.2699185912801351
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
					"name": "SandShockWave",
					"z": -0.36024,
					"scaleX": 2.3,
					"scaleY": 2.3,
					"scaleZ": 2.3,
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
									0.25,
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
								"warmUpTime": -1.1,
								"emitType": "Burst",
								"burstParticleCount": 12,
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
									0.5,
									0,
									0
								],
								"emitRad2": 0.9,
								"useRandomColor": true
							},
							"x": -0.7514,
							"z": -0.32935,
							"scaleX": 37,
							"scaleY": 37,
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
									0.25,
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
								"warmUpTime": -1.1,
								"emitType": "Burst",
								"burstParticleCount": 12,
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
									0.5,
									0,
									0
								],
								"emitRad2": 0.9,
								"useRandomColor": true
							},
							"x": -0.7514,
							"z": -0.32935,
							"scaleX": 37,
							"scaleY": 37,
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
								"instScale": 9,
								"lifeTime": 4,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8431372549019608,
									0.7607843137254902,
									0.7254901960784313,
									1
								],
								"instSpeed_rand": [
									0.25,
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
								"warmUpTime": -1.2,
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
									1.25,
									0,
									0
								],
								"useRandomColor": true
							},
							"x": -0.7514,
							"z": -0.32935,
							"scaleX": 50,
							"scaleY": 50,
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
								"instScale": 9,
								"lifeTime": 4,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8431372549019608,
									0.7607843137254902,
									0.7254901960784313,
									1
								],
								"instSpeed_rand": [
									0.25,
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
								"warmUpTime": -1.2,
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
									1.25,
									0,
									0
								],
								"useRandomColor": true
							},
							"x": -0.7514,
							"z": -0.32935,
							"scaleX": 50,
							"scaleY": 50,
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
								"range": 4.55,
								"power": 0.8
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "UndergroundExplosions",
					"z": -1.25,
					"scaleX": 2.3,
					"scaleY": 2.3,
					"scaleZ": 2.3,
					"children": [
						{
							"type": "emitter",
							"name": "Impact_Burst_Mid_SandJet_R",
							"props": {
								"instScale_rand": 1,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2.75,
								"lifeTime": 4,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8509803921568627,
									0.8509803921568627,
									0.8509803921568627,
									1
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png",
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
								"instStretch_rand": [
									0,
									0,
									1.75
								],
								"instStretch": [
									1,
									1,
									4.5
								],
								"warmUpTime": -1.1,
								"emitType": "Burst",
								"burstParticleCount": 5,
								"emitAngle": 180,
								"emitDuration": 20,
								"burstDelay": 1.35,
								"seedGroup": 5,
								"emitRad2": 0.9,
								"instRotation_rand": [
									0,
									0,
									360
								]
							},
							"z": 0.30457,
							"scaleX": 35,
							"scaleY": 35,
							"scaleZ": 0.19999999999999998,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV",
									"source": "Fx/Meshes_Common/BendedCrossPlane.fbx",
									"scaleX": 0.5,
									"scaleY": 0.2,
									"scaleZ": 0.5,
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
												"alpha": 0.65
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
																"dv": 0.00782367857939008,
																"dt": -0.03520655360725527
															},
															"nextHandle": {
																"dv": -0.15000000000000002,
																"dt": 0.674375
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.15625
															},
															"nextHandle": {
																"dv": 0.03384085855991686,
																"dt": 0.3197961133912159
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
													0.3568627450980392,
													0.3333333333333333,
													0.32156862745098036
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
												"progress": 0.5,
												"saturation": 0.1,
												"width": 1,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/causticTexture_03-2-Blured.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
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
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.17597127610376737,
																"dt": -0.6268976711196711
															},
															"nextHandle": {
																"dv": -0.1333333333333333,
																"dt": 0.47500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
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
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.4,
												"sandColorSet": false,
												"envBlend": 0.4,
												"envColorSet": false
											}
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
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.832419311974865,
												"dt": -0.023411793149293023
											},
											"nextHandle": {
												"dv": 0.5333333333333332,
												"dt": 0.015
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
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.25,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
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
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2.75,
								"lifeTime": 4,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8509803921568627,
									0.8509803921568627,
									0.8509803921568627,
									1
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png",
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
								"instStretch_rand": [
									0,
									0,
									1.75
								],
								"instStretch": [
									1,
									1,
									4.5
								],
								"warmUpTime": -1.1,
								"emitType": "Burst",
								"burstParticleCount": 5,
								"emitAngle": 180,
								"emitDuration": 20,
								"burstDelay": 1.35,
								"seedGroup": 6,
								"emitRad2": 0.9
							},
							"z": 0.30457,
							"scaleX": 35,
							"scaleY": 35,
							"scaleZ": 0.19999999999999998,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV",
									"source": "Fx/Meshes_Common/BendedCrossPlane.fbx",
									"scaleX": 0.5,
									"scaleY": 0.2,
									"scaleZ": 0.5,
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
												"alpha": 0.65
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
																"dv": 0.00782367857939008,
																"dt": -0.03520655360725527
															},
															"nextHandle": {
																"dv": -0.15000000000000002,
																"dt": 0.674375
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.15625
															},
															"nextHandle": {
																"dv": 0.03384085855991686,
																"dt": 0.3197961133912159
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
													0.3568627450980392,
													0.3333333333333333,
													0.32156862745098036
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
												"progress": 0.5,
												"saturation": 0.1,
												"width": 1,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/causticTexture_03-2-Blured.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
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
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.17597127610376737,
																"dt": -0.6268976711196711
															},
															"nextHandle": {
																"dv": -0.1333333333333333,
																"dt": 0.47500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
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
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.4,
												"sandColorSet": false,
												"envBlend": 0.4,
												"envColorSet": false
											}
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
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.832419311974865,
												"dt": -0.023411793149293023
											},
											"nextHandle": {
												"dv": 0.5333333333333332,
												"dt": 0.015
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
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.25,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
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
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2.75,
								"lifeTime": 4,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8509803921568627,
									0.8509803921568627,
									0.8509803921568627,
									1
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png",
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
								"instStretch_rand": [
									0,
									0,
									1.75
								],
								"instStretch": [
									1,
									1,
									4.5
								],
								"warmUpTime": -1.2,
								"emitType": "Burst",
								"burstParticleCount": 6,
								"emitAngle": 180,
								"emitDuration": 20,
								"burstDelay": 1.35,
								"seedGroup": 7,
								"emitRad2": 0.9
							},
							"z": 0.30457,
							"scaleX": 42,
							"scaleY": 42,
							"scaleZ": 0.19999999999999996,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV",
									"source": "Fx/Meshes_Common/BendedCrossPlane.fbx",
									"scaleX": 0.5,
									"scaleY": 0.2,
									"scaleZ": 0.5,
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
												"alpha": 0.65
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
																"dv": 0.00782367857939008,
																"dt": -0.03520655360725527
															},
															"nextHandle": {
																"dv": -0.15000000000000002,
																"dt": 0.674375
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.15625
															},
															"nextHandle": {
																"dv": 0.03384085855991686,
																"dt": 0.3197961133912159
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
													0.3568627450980392,
													0.3333333333333333,
													0.32156862745098036
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
												"progress": 0.5,
												"saturation": 0.1,
												"width": 1,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/causticTexture_03-2-Blured.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
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
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.17597127610376737,
																"dt": -0.6268976711196711
															},
															"nextHandle": {
																"dv": -0.1333333333333333,
																"dt": 0.47500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
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
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.4,
												"sandColorSet": false,
												"envBlend": 0.4,
												"envColorSet": false
											}
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
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.832419311974865,
												"dt": -0.023411793149293023
											},
											"nextHandle": {
												"dv": 0.5333333333333332,
												"dt": 0.015
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
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.25,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
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
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2.75,
								"lifeTime": 4,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8509803921568627,
									0.8509803921568627,
									0.8509803921568627,
									1
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png",
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
								"instStretch_rand": [
									0,
									0,
									1.75
								],
								"instStretch": [
									1,
									1,
									4.5
								],
								"warmUpTime": -1.2,
								"emitType": "Burst",
								"burstParticleCount": 6,
								"emitAngle": 180,
								"emitDuration": 20,
								"burstDelay": 1.35,
								"seedGroup": 8,
								"emitRad2": 0.9
							},
							"z": 0.30457,
							"scaleX": 42,
							"scaleY": 42,
							"scaleZ": 0.19999999999999996,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV",
									"source": "Fx/Meshes_Common/BendedCrossPlane.fbx",
									"scaleX": 0.5,
									"scaleY": 0.2,
									"scaleZ": 0.5,
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
												"alpha": 0.65
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
																"dv": 0.00782367857939008,
																"dt": -0.03520655360725527
															},
															"nextHandle": {
																"dv": -0.15000000000000002,
																"dt": 0.674375
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.15625
															},
															"nextHandle": {
																"dv": 0.03384085855991686,
																"dt": 0.3197961133912159
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
													0.3568627450980392,
													0.3333333333333333,
													0.32156862745098036
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
												"progress": 0.5,
												"saturation": 0.1,
												"width": 1,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/causticTexture_03-2-Blured.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
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
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.17597127610376737,
																"dt": -0.6268976711196711
															},
															"nextHandle": {
																"dv": -0.1333333333333333,
																"dt": 0.47500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
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
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.4,
												"sandColorSet": false,
												"envBlend": 0.4,
												"envColorSet": false
											}
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
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.832419311974865,
												"dt": -0.023411793149293023
											},
											"nextHandle": {
												"dv": 0.5333333333333332,
												"dt": 0.015
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
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.25,
										"ATTENUATE": true,
										"emissiveMap": null
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
								"range": 15,
								"power": 0.8
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "SietchTabr",
					"editorOnly": true,
					"z": 0.01,
					"scaleX": 4.61,
					"scaleY": 4.61,
					"scaleZ": 4.61,
					"rotationZ": 16.699999999999996,
					"children": [
						{
							"type": "model",
							"name": "SietchTabr",
							"source": "Structure/Base/SietchTabr/SietchTabr.fbx",
							"scaleX": 54,
							"scaleY": 54,
							"scaleZ": 54,
							"rotationZ": -180,
							"children": [
								{
									"type": "shader",
									"name": "SandBlend",
									"source": "shaders/SandBlend.hx",
									"props": {
										"colorMask": "Structure/Base/SietchTabr/SietchTabr_ColorMask.png"
									},
									"targetMaterial": "SietchTabr_MAT"
								},
								{
									"type": "shader",
									"name": "SandBlend",
									"source": "shaders/SandBlend.hx",
									"props": {
										"colorMask": "Structure/Base/SietchTabr/Mount_SietchTabr_ColorMask.png"
									},
									"targetMaterial": "Mount_MAT"
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"x": 0.023333333333333456,
							"y": -0.17666666666666625,
							"z": -0.010000000000000004,
							"children": [
								{
									"type": "tdecal",
									"name": "tdecal",
									"x": 0.24,
									"y": -2.87,
									"z": 0.03,
									"scaleX": 27.659999999999993,
									"scaleY": 29.149999999999988,
									"scaleZ": 1.29,
									"rotationX": 0.6,
									"rotationY": 0.2,
									"rotationZ": 158.8,
									"albedoMap": "Structure/Resources/Decals/DirtDecal_1_color.png",
									"normalMap": "Structure/Resources/Decals/DirtDecal_1_normal.png",
									"albedoStrength": 1.25,
									"renderMode": "Terrain"
								},
								{
									"type": "tdecal",
									"name": "tdecal",
									"x": 0.12666666666666668,
									"y": 5.466666666666668,
									"z": -0.06,
									"scaleX": 3.2199999999999998,
									"scaleY": 2.73,
									"scaleZ": 0.6800000000000002,
									"rotationX": -0.5999999999999998,
									"rotationZ": -8.899999999999999,
									"albedoMap": "Structure/Resources/Decals/DirtDecal_1_color.png",
									"normalMap": "Structure/Resources/Decals/DirtDecal_1_normal.png",
									"albedoStrength": 1.5
								},
								{
									"type": "tdecal",
									"name": "tdecal",
									"x": -0.3633333333333334,
									"y": -2.5933333333333337,
									"z": 0.030000000000000002,
									"scaleX": 28.54,
									"scaleY": 16.37,
									"scaleZ": 0.36,
									"rotationX": -0.5999999999999999,
									"rotationZ": -8.900000000000002,
									"albedoMap": "Structure/Resources/Decals/DirtDecal_1_color.png",
									"normalMap": "Structure/Resources/Decals/DirtDecal_1_normal.png",
									"albedoStrength": 1.5
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "SandWave",
					"x": 3,
					"y": -3,
					"z": 0.55667,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 3,
					"children": [
						{
							"type": "model",
							"name": "FX_Mesh_Disc_Wave",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
							"x": -0.25,
							"y": 0.23,
							"z": -0.88,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 90,
							"rotationX": -1.3,
							"rotationY": -0.9,
							"rotationZ": 81.8,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "LessEqual",
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
									"normalMap": "Fx/DistortionMaps/water-normal.png",
									"materialName": "any",
									"color": [
										0.6509803921568628,
										0.6509803921568628,
										0.6509803921568628,
										0.4784313725490196
									]
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": true,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/vGrad.png",
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
													"time": 1.1555533218383793,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.4191005706787114,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.031675511077271894,
														"dt": -0.3660274204626998
													},
													"nextHandle": {
														"dv": -0.033333333333333326,
														"dt": 0.38370217029625775
													}
												},
												{
													"time": 2.3009702110290533,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.004551823188861104,
														"dt": -0.774873962402344
													},
													"nextHandle": {
														"dv": -0.004551823188861104,
														"dt": 0.774873962402344
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 0.5,
										"width": 0.32,
										"uvScaleX": 6,
										"uvScaleY": 3,
										"texture": "Fx/noise/T_Noise_Grunge_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.2
										],
										"uvScaleSpeed": [
											0,
											0
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
										"sandColorSet": true,
										"envBlend": 0.77,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"tex": "Fx/DistortionMaps/waveNormal02.jpg",
										"intensity": 4,
										"scrollSpeed": [
											0.07,
											0
										],
										"smoothEdge": 1,
										"texScaleX": 0,
										"texScaleY": 0
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 4,
										"scaleY": 2,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.025
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftY",
											"keyMode": 1,
											"keys": [
												{
													"time": -0.23426422119140433,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.023020744572424055,
														"dt": -1.0331230136552487
													},
													"nextHandle": {
														"dv": -0.03722222756339133,
														"dt": 1.7789013494220134
													}
												},
												{
													"time": 4.765735778808596,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.20587436996747438,
														"dt": -0.24142791275560516
													},
													"nextHandle": {
														"dv": -0.20587436996747438,
														"dt": 0.24142791275560516
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 1.1617156672360602,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -2.464329621465803,
												"dt": -0.24990980693075057
											},
											"nextHandle": {
												"dv": 0.7020971105327201,
												"dt": 0.07492911578395955
											}
										},
										{
											"time": 2.1617156672360602,
											"value": 1.01469963255798,
											"mode": 0,
											"prevHandle": {
												"dv": -0.12648137998854092,
												"dt": -0.69
											},
											"nextHandle": {
												"dv": 0.04797846416818524,
												"dt": 0.2699185912801351
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": false,
										"REVERSE": false,
										"bias": 0.2,
										"scale": 1,
										"power": 1,
										"color": [
											0,
											0,
											0
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
					"name": "Debris",
					"z": -5,
					"scaleX": 0.7,
					"scaleY": 0.7,
					"scaleZ": 0.7,
					"children": [
						{
							"type": "emitter",
							"name": "DebrisCylinder",
							"props": {
								"lifeTime": 1.75,
								"lifeTimeRand": 0.75,
								"warmUpTime": -0.9,
								"emitType": "Burst",
								"burstParticleCount": 8,
								"emitShape": "Cylinder",
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"instScale": 15,
								"instSpeed": [
									50,
									0,
									125
								],
								"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 5,
								"instSpeed_rand": [
									30,
									0,
									7
								],
								"instWorldSpeed": [
									0,
									0,
									-20
								],
								"instWorldSpeed_rand": [
									0,
									0,
									-6
								],
								"seedGroup": 1,
								"randomColor1": [
									0.9294117647058824,
									0.36470588235294116,
									0.19215686274509802,
									1
								],
								"randomColor2": [
									0.19607843137254902,
									0.19607843137254902,
									0.19607843137254902,
									1
								],
								"simulationSpace": "World",
								"emitOrientation": "Normal",
								"emitRad1": 0.7,
								"speedFactor": 0.85,
								"emitSurface": true,
								"emitAngle": 360
							},
							"z": 9.65495,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 2,
							"children": [
								{
									"type": "model",
									"name": "M_debris",
									"source": "Fx/Explosion/M_debris.fbx",
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "PBR",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true
												}
											},
											"wrapRepeat": true
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
												"saturation": 1,
												"width": 1,
												"uvScaleX": 8,
												"uvScaleY": 8,
												"texture": "Fx/noise/clouds3.png",
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
															"time": 0,
															"value": 1.0142450142450146,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00815077011741522,
																"dt": -0.21165545373561706
															},
															"nextHandle": {
																"dv": -0.01690408357075024,
																"dt": 0.43895747599451307
															}
														},
														{
															"time": 0.6649999999999999,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1494776828110165,
																"dt": -0.235281207133059
															},
															"nextHandle": {
																"dv": -0.9533918695597478,
																"dt": 0.1951453197353988
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
													0.7294117647058823,
													0.49411764705882355,
													0.42745098039215684
												]
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
												"dv": 3.022033566727083,
												"dt": -0.2526618227919364
											},
											"nextHandle": {
												"dv": -1.0166666666666666,
												"dt": 0.085
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666663,
												"dt": -0.5253769144228198
											},
											"nextHandle": {
												"dv": -0.020808987292503984,
												"dt": 0.6554830997138851
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
												"dv": 2.9713780548902946,
												"dt": -0.3019303507388523
											},
											"nextHandle": {
												"dv": -1.0333333333333332,
												"dt": 0.105
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666663,
												"dt": -0.6053769144228197
											},
											"nextHandle": {
												"dv": -0.0180575879092897,
												"dt": 0.6554904411072038
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "InstWorldSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.008210081009433656,
												"dt": -0.4999939334744809
											},
											"nextHandle": {
												"dv": -0.01666666666666672,
												"dt": 1.015
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -1.1666666666666665,
												"dt": -0.010000000000000009
											},
											"nextHandle": {
												"dv": 0.7916682837335377,
												"dt": 0.006785728146287541
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
											"value": 0.012707392165911546,
											"mode": 0,
											"prevHandle": {
												"dv": -1.562544836391683,
												"dt": -0.057312053992565525
											},
											"nextHandle": {
												"dv": 0.8951335055594681,
												"dt": 0.03233660096897972
											}
										},
										{
											"time": 1,
											"value": 1.01469963255798,
											"mode": 0,
											"prevHandle": {
												"dv": -0.024099204996862578,
												"dt": -0.9873942064019231
											},
											"nextHandle": {
												"dv": 0.0055778337215589505,
												"dt": 0.265963721460112
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
					"name": "shake",
					"keyMode": 0,
					"keys": [
						{
							"time": 1.1205383852581943,
							"value": 0,
							"mode": 2
						},
						{
							"time": 1.1305383852581943,
							"value": 0.3,
							"mode": 2
						},
						{
							"time": 1.23,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": -0.003703703703703584,
								"dt": -0.06326687879432202
							},
							"nextHandle": {
								"dv": 0.003703703703703584,
								"dt": 0.06326687879432202
							}
						}
					]
				}
			]
		}
	]
}