{
	"type": "fx",
	"duration": 15,
	"cullingRadius": 15,
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
					"name": "DroneTesla",
					"source": "Vehicle/Vernius/DroneTesla/DroneTesla.fbx",
					"editorOnly": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/DroneTesla/Anim_DroneTesla_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "DeathFloor",
					"y": -0.55,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Explosion_Mid",
							"source": "Fx/Explosion/FX_Explosion_Mid.fx",
							"enabled": false,
							"x": -1.14639,
							"time": -0.6197496526979762
						},
						{
							"type": "subFX",
							"name": "FX_LensFlare_MidExplosion",
							"source": "Fx/Explosion/FX_LensFlare_MidExplosion.fx",
							"enabled": false,
							"x": -1.14639,
							"z": 3.8389,
							"scaleX": 1.75,
							"scaleY": 1.75,
							"scaleZ": 1.75,
							"time": 0.4552503473020239
						},
						{
							"type": "emitter",
							"name": "SandFloor",
							"props": {
								"instScale_rand": 3,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									1,
									1,
									1,
									0.8509803921568627
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 2.1,
								"emitType": "Burst",
								"burstParticleCount": 8,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 15,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 1,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									1,
									0,
									0
								],
								"instAcceleration": [
									5,
									0,
									0
								],
								"warmUpTime": -0.7,
								"emitAngle": 360,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"z": 0.15,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 0.1,
							"rotationZ": 74.1,
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
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
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
												"scale": 0.1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
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
															"value": -0.032777777777777795,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.05083333333333336
															}
														},
														{
															"time": 0.08,
															"value": 0.9833333333333334,
															"prevHandle": {
																"dv": 0.07562525672400151,
																"dt": -0.02399211269568948
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.2643750000000001
															}
														},
														{
															"time": 0.95,
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
													0.807843137254902,
													0.7843137254901961,
													0.7725490196078432
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
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
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
															"value": 1,
															"prevHandle": {
																"dv": 0.8483515290485304,
																"dt": -0.43041364341432775
															},
															"nextHandle": {
																"dv": -1.1333333333333333,
																"dt": 0.575
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
												"sandColorSet": true,
												"envBlend": 0.4,
												"envColorSet": true
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
											"time": 0.009999999999999995,
											"value": 1.0899757186013024,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Impact",
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "emitter",
									"name": "SandProjectionMesh",
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
										"warmUpTime": -0.75,
										"emitType": "Burst",
										"instStretch_rand": [
											0.1,
											0.1,
											0.4
										],
										"instScale": 11,
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
										],
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"z": -6.17158,
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
										"warmUpTime": -0.7,
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
										],
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"z": 0.25,
									"scaleX": 0.25,
									"scaleY": 0.25,
									"scaleZ": 0.025,
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
														"intensity": 0.03
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
								},
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"z": 2.5,
									"scaleX": 30,
									"scaleY": 25.71,
									"scaleZ": 13.71,
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
															"time": 0.6412751882969299,
															"value": 0,
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
															"time": 0.9307133654310312,
															"value": 1,
															"mode": 2
														},
														{
															"time": 10.186857466825597,
															"value": 1,
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
															"time": 14.210817213630419,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -1.3422260238602786
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
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
						}
					]
				}
			]
		}
	]
}