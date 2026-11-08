{
	"type": "fx",
	"duration": 4,
	"cullingRadius": 30,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
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
					"type": "model",
					"name": "Flag",
					"source": "Fx/Meshes_Common/CurvedPlan.fbx",
					"enabled": false,
					"z": 6.4909,
					"scaleX": 5,
					"scaleY": 8,
					"scaleZ": 0.87,
					"rotationY": 90,
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
									"enableStencil": false
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/water-normal.png"
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 1.8,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/z_FillWhite.jpg",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": false,
								"Z": false,
								"texScaleX": 10,
								"texScaleY": 10,
								"tex": "Fx/Alphas/T_NukeVertex.png",
								"intensity": 8,
								"scrollSpeed": [
									0,
									0.1
								]
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
									0.8313725490196078,
									0.8313725490196078,
									0.8313725490196078
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "2",
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.6,
					"children": [
						{
							"type": "object",
							"name": "Diplomacy",
							"scaleX": 1.25,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"z": -0.36748999999999943,
									"scaleX": 60,
									"scaleY": 60,
									"scaleZ": 3.697446508211333,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"fadePower": 1.8,
									"fadeStart": 0.08,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.35
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.018672458466697156,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.02
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3133333333333333
															}
														},
														{
															"time": 2.991604938271605,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.5833333333333334,
																"dt": -0.41634049687547625
															},
															"nextHandle": {
																"dv": -0.44394942207671123,
																"dt": 0.3159572000338183
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
													1,
													0.6745098039215687,
													0.3333333333333333
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.221494130468458,
														"dt": -0.19359425973581357
													},
													"nextHandle": {
														"dv": 1.1333333333333333,
														"dt": 0.10012345679012348
													}
												},
												{
													"time": 2.409826245999086,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.015151515151515138,
														"dt": -0.2250845907636031
													},
													"nextHandle": {
														"dv": 0.005635594886243612,
														"dt": 0.08359419364431056
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "smokepuff",
									"z": 0.25,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
									"children": [
										{
											"type": "emitter",
											"name": "SmokePuff",
											"props": {
												"lifeTime": 2.25,
												"lifeTimeRand": 0.5,
												"emitType": "Burst",
												"burstParticleCount": 15,
												"simulationSpace": "World",
												"emitOrientation": "Normal",
												"emitShape": "Cylinder",
												"emitRad1": 0.61,
												"emitSurface": true,
												"alignMode": "Screen",
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
												"instScale": 20,
												"instSpeed": [
													5,
													0,
													0
												],
												"instSpeed_rand": [
													1,
													0,
													0
												],
												"instRotation_rand": [
													0,
													0,
													360
												],
												"instScale_rand": 5,
												"instAcceleration": [
													-4,
													0,
													0
												],
												"instAcceleration_rand": [
													1,
													0,
													0
												],
												"instWorldAcceleration": [
													0,
													0,
													2
												],
												"instWorldAcceleration_rand": [
													0,
													0,
													1
												],
												"speedFactor": 0.5,
												"emitAngle": 360
											},
											"scaleX": 7,
											"scaleY": 7,
											"scaleZ": 0.38,
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
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
																"width": 0.4,
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
															"topIntensity": 0.42,
															"topSpan": 0.24,
															"dirIntensity": 0.1,
															"dirSpan": 0,
															"sandBlend": 0.7,
															"envBlend": 0.7
														},
														{
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 19.7,
																"power": 14.39
															},
															"isInstance": true
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Particles",
									"props": {
										"emitType": "Burst",
										"lifeTimeRand": 0.8,
										"burstParticleCount": 8,
										"emitSurface": true,
										"alignMode": "Screen",
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0,
										"instSpeed": [
											0,
											0,
											45
										],
										"instSpeed_rand": [
											0,
											0,
											25
										],
										"instAcceleration": [
											0,
											0,
											5
										],
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"instScale": 1.75,
										"instScale_rand": 0.6,
										"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
										"lifeTime": 1.6,
										"emitShape": "Cylinder",
										"emitRad2": 0.51,
										"speedFactor": 0.5,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"emitAngle": 360
									},
									"z": 0.16378,
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 2,
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
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
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
														"texture": "Fx/Alphas/Spark01.png"
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
																	"mode": 2
																},
																{
																	"time": 0.1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.07282361390791996,
																		"dt": -0.029591817714964313
																	},
																	"nextHandle": {
																		"dv": -0.07282361390791996,
																		"dt": 0.029591817714964313
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.8384636488340191
																	},
																	"nextHandle": {
																		"dv": 0.006154423696995358,
																		"dt": 0.30991955512506614
																	}
																}
															]
														}
													]
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
																	"time": 0.065,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.11089160652646488,
																		"dt": -0.015692208470726162
																	},
																	"nextHandle": {
																		"dv": -0.8833333333333333,
																		"dt": 0.12500000000000003
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.8384636488340191
																	},
																	"nextHandle": {
																		"dv": 0.006154423696995358,
																		"dt": 0.30991955512506614
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
														"sandBlend": 0.7,
														"sandColorSet": false,
														"envBlend": 0.7,
														"envColorSet": false
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
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06666666666666667,
														"dt": -0.56
													},
													"nextHandle": {
														"dv": 0.03967621425974007,
														"dt": 0.3332801997818148
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
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02083333333333337,
														"dt": -0.6899127654810223
													},
													"nextHandle": {
														"dv": 0.010055920637605917,
														"dt": 0.33333120750332956
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
														"dv": 2.844272778839864,
														"dt": -0.2607250047269874
													},
													"nextHandle": {
														"dv": -1.2,
														"dt": 0.11
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.835
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
											"name": "instStretch.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.019661636945587535,
														"dt": -0.47287388440109057
													},
													"nextHandle": {
														"dv": 0.019661636945587535,
														"dt": 0.47287388440109057
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Flare",
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												0,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "FlareLarge",
													"z": 18.64387,
													"scaleX": 20,
													"scaleY": 187.5,
													"scaleZ": 20,
													"rotationX": 90,
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
																	"enableStencil": false,
																	"parallax": 0
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
															"children": [
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
																		"alpha": 0.75,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_circle2.png"
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
																		"progress": 0.34,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 2,
																		"texture": "Fx/noise/Wave_01.jpg",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			-0.6
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
																	"name": "ColorMult",
																	"source": "shaders/ColorMult.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.9764705882352941,
																			0.7529411764705882,
																			0.5137254901960784
																		]
																	},
																	"isInstance": true
																}
															]
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
																"texture": "Fx/Gradients/Cyl05v_A.png",
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
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.4141402424583835,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.02
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3133333333333333
																			}
																		},
																		{
																			"time": 2.5977887936025876,
																			"value": 0,
																			"mode": 2
																		}
																	]
																}
															]
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
																"alpha": 0.8,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl04v_A.jpg"
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 10,
																"power": 2
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"enabled": false,
															"props": {
																"sandBlend": 0.7,
																"sandColorSet": false,
																"envBlend": 0.7,
																"envColorSet": false
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "polygon",
													"name": "Flare",
													"z": 15,
													"scaleX": 10,
													"scaleY": 53.33,
													"scaleZ": 10,
													"rotationX": 90,
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
																	"enableStencil": false,
																	"parallax": 0,
																	"emissive": 0.75
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
															"children": [
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
																		"texture": "Fx/Alphas/T_circle2.png"
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
																		"progress": 0.3,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 2,
																		"texture": "Fx/noise/Wave_01.jpg",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			-0.6
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
																	"name": "ColorMult",
																	"source": "shaders/ColorMult.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.9764705882352941,
																			0.7529411764705882,
																			0.5137254901960784
																		]
																	},
																	"isInstance": true
																}
															]
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
																"texture": "Fx/Gradients/Cyl05v_A.png",
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
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.42857142857142855,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.02
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3133333333333333
																			}
																		},
																		{
																			"time": 2.632465457154097,
																			"value": 0,
																			"mode": 2
																		}
																	]
																}
															]
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
																"alpha": 0.8,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl04v_A.jpg"
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 10,
																"power": 2
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
						},
						{
							"type": "object",
							"name": "Raiders",
							"editorOnly": true,
							"children": [
								{
									"type": "model",
									"name": "Male01_Raider",
									"source": "Character/Common/Raider/Male01_Raider.fbx",
									"y": 0.92873,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2
								},
								{
									"type": "model",
									"name": "Male01_Raider",
									"source": "Character/Common/Raider/Male01_Raider.fbx",
									"x": 1.64345,
									"y": -0.83697,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2
								},
								{
									"type": "model",
									"name": "Male01_Raider",
									"source": "Character/Common/Raider/Male01_Raider.fbx",
									"x": -1.95271,
									"y": -0.83697,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2
								}
							]
						}
					]
				}
			]
		}
	]
}