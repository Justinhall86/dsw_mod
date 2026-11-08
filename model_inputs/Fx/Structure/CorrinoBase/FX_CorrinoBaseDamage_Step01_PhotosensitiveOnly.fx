{
	"type": "fx",
	"cullingRadius": 10,
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
			"rotationZ": 210,
			"children": [
				{
					"type": "object",
					"name": "CorinoBase_mesh",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "District_1_3",
							"source": "Structure/Base/Corrino/CorrinoBase_District_01.fbx",
							"scaleY": 1.0000000000000004,
							"scaleZ": 1.0000000000000004,
							"rotationZ": -150.00000000000003
						},
						{
							"type": "model",
							"name": "District_2_2",
							"source": "Structure/Base/Corrino/CorrinoBase_District_02.fbx",
							"scaleY": 1.0000000000000004,
							"scaleZ": 1.0000000000000004,
							"rotationZ": -150.00000000000003
						},
						{
							"type": "model",
							"name": "District_3_1",
							"source": "Structure/Base/Corrino/CorrinoBase_District_03.fbx",
							"scaleY": 1.0000000000000004,
							"scaleZ": 1.0000000000000004,
							"rotationZ": -150.00000000000003
						},
						{
							"type": "model",
							"name": "CorrinoBase",
							"source": "Structure/Base/Corrino/CorrinoBase.fbx",
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"rotationZ": -150.00000000000003,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"enabled": false,
									"time": -0.1,
									"animation": "Structure/Base/Corrino/Anim_CorrinoBase.fbx"
								}
							]
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_ElectricityBig",
					"source": "Fx/Structure/CorrinoBase/FX_ElectricityBig_Photosensitive.fx",
					"x": -7.14364,
					"y": -10.89744,
					"z": -0.33997,
					"scaleX": 0.7,
					"scaleY": 0.7,
					"scaleZ": 0.7,
					"rotationX": -21.2,
					"rotationZ": 150,
					"time": 1.43
				},
				{
					"type": "object",
					"name": "Explosions",
					"x": 2.36314,
					"y": -2.803138571428571,
					"z": 3.3610814285714286,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_slow_Base_Photosensitive.fx",
							"x": -8.2769,
							"y": -1.30048,
							"z": 1.44049,
							"scaleX": 0.65,
							"scaleY": 0.6500000000000001,
							"scaleZ": 1.25,
							"rotationX": 16.7,
							"rotationY": 21.7,
							"rotationZ": 59.9,
							"time": 1.22
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_slow_Base_Photosensitive.fx",
							"x": -10.504030000000002,
							"y": -12.899650000000003,
							"z": -3.1058100000000004,
							"scaleX": 0.8000000000000003,
							"scaleY": 0.8000000000000003,
							"scaleZ": 1.25,
							"rotationX": 1.900000000000002,
							"rotationY": -37.1,
							"rotationZ": 24.60000000000001,
							"time": 1.2
						},
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High_Photosensitive.fx",
							"x": -7.06202,
							"y": -3.11726,
							"z": 0.72424,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationX": 32.2,
							"rotationY": -29.6,
							"rotationZ": 24.1,
							"time": 0.125
						},
						{
							"type": "subFX",
							"name": "02 - FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium_Photosensitive.fx",
							"x": -5.51723,
							"y": -16.56036,
							"z": 0.76762,
							"scaleX": 0.9000000000000001,
							"scaleY": 0.9000000000000001,
							"scaleZ": 0.9000000000000001,
							"rotationX": 36.6,
							"rotationY": -27.9,
							"rotationZ": -18.5,
							"time": 0.315
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						},
						{
							"type": "subFX",
							"name": "FX_ScreenShake02",
							"source": "Fx/Explosion/FX_ScreenShake02.fx",
							"x": -7.96846,
							"y": -2.0233,
							"z": 3.82445,
							"rotationZ": 150,
							"time": 0.895,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.6
									}
								}
							]
						},
						{
							"type": "light",
							"name": "light_1",
							"enabled": false,
							"x": -10.17539,
							"y": -11.15702,
							"z": 0.97347,
							"scaleX": 90.00000000000001,
							"scaleY": 90.00000000000001,
							"scaleZ": 90,
							"color": 16685394,
							"power": 0.8,
							"range": 90,
							"size": 5,
							"zNear": 0.02,
							"children": [
								{
									"type": "curve",
									"name": "power",
									"keyMode": 0,
									"keys": [
										{
											"time": 1.4299999999999995,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4749999999999994,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4849999999999994,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.97,
											"value": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.30000000000000004
											},
											"nextHandle": {
												"dv": -1.9798456586215568e-16,
												"dt": 0.16166666666666685
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "explofloor",
							"x": -7.45458,
							"y": -6.32658,
							"z": 1.14384,
							"scaleX": 0.15,
							"scaleY": 0.15,
							"scaleZ": 0.15,
							"children": [
								{
									"type": "emitter",
									"name": "FireExplo_floor",
									"props": {
										"warmUpTime": -1.49,
										"emitType": "Burst",
										"instScale": 87,
										"lifeTime": 4.5,
										"instRotation_rand": [
											0,
											0,
											0
										],
										"maxCount": 5,
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
									"x": 4.440892098500626e-16,
									"z": -4.440892098500626e-16,
									"scaleX": 0.10000000000000002,
									"scaleY": 0.10000000000000002,
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 2,
															"drawOrder": "-80",
															"depthWrite": "Off"
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
														"texture": "Fx/Alphas/T_circle2.png"
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
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.38408525123202764
																	},
																	"nextHandle": {
																		"dv": 0.014436864824411356,
																		"dt": 0.3332756687015779
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
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 1.4258279990287213,
																		"dt": -0.24442765697635202
																	},
																	"nextHandle": {
																		"dv": -1.1666666666666665,
																		"dt": 0.20000000000000007
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333326,
																		"dt": -0.33999999999999986
																	},
																	"nextHandle": {
																		"dv": -0.03266568666923559,
																		"dt": 0.33319000402620214
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
															0.6941176470588235,
															0.3607843137254902,
															0.2588235294117647
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 3.25,
														"texture": "Fx/noise/T_Fire.png",
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
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": -0.02018778987695988,
																		"dt": -1.1385913490605288
																	},
																	"nextHandle": {
																		"dv": 0.016666666666666607,
																		"dt": 0.94
																	}
																},
																{
																	"time": 1,
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
																	"value": 1,
																	"prevHandle": {
																		"dv": 1.245041497761005,
																		"dt": -0.020614551575750532
																	},
																	"nextHandle": {
																		"dv": -0.446875,
																		"dt": 0.0067260711913458004
																	}
																},
																{
																	"time": 1,
																	"value": 0.5,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.7109224214778171
																	},
																	"nextHandle": {
																		"dv": 0.007810578034972692,
																		"dt": 0.33333208232392514
																	}
																}
															]
														}
													]
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": -0.02018778987695988,
																		"dt": -1.1385913490605288
																	},
																	"nextHandle": {
																		"dv": 0.016666666666666607,
																		"dt": 0.94
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 1.2177795461420868,
																		"dt": -0.0988648016929929
																	},
																	"nextHandle": {
																		"dv": -0.7015380859375002,
																		"dt": 0.056053089618603016
																	}
																},
																{
																	"time": 1,
																	"value": 0.3,
																	"prevHandle": {
																		"dv": -0.014721679687500211,
																		"dt": -0.606056834154685
																	},
																	"nextHandle": {
																		"dv": 0.007243080094943305,
																		"dt": 0.333333876231921
																	}
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
																	"value": 1,
																	"prevHandle": {
																		"dv": 1.229552882459761,
																		"dt": -0.1737100874637916
																	},
																	"nextHandle": {
																		"dv": -0.7417695473251028,
																		"dt": 0.105
																	}
																},
																{
																	"time": 1,
																	"value": 0.3,
																	"prevHandle": {
																		"dv": -0.0014403292181069394,
																		"dt": -0.385
																	},
																	"nextHandle": {
																		"dv": -9.409347310140472e-17,
																		"dt": 0.3334009968594422
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
														"range": 5,
														"power": 0.8
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
													"value": 0.5,
													"prevHandle": {
														"dv": -2.494073049921499,
														"dt": -0.0712919490177076
													},
													"nextHandle": {
														"dv": 0.6127090979023997,
														"dt": 0.018205260047565522
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": -0.0010974281668227892,
														"dt": -1.0012819571088818
													},
													"nextHandle": {
														"dv": -1.6811564388663527e-16,
														"dt": 0.2703197486375193
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
					"name": "Decals",
					"x": -8.3889,
					"y": -5.03925,
					"scaleX": 9,
					"scaleY": 9,
					"scaleZ": 9,
					"rotationZ": -25.2,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Decal_Large",
							"x": 0.17517,
							"y": -0.16817,
							"scaleX": 7,
							"scaleY": 7,
							"scaleZ": 4,
							"rotationZ": 159.4,
							"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
							"albedoStrength": 1.5,
							"children": [
								{
									"type": "curve",
									"name": "color.a",
									"keys": [
										{
											"time": 1.4899999999999984,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.695,
											"value": 1,
											"mode": 2
										}
									]
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
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Decal_Large",
							"x": -1.33962,
							"y": 1.09571,
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 4,
							"rotationZ": 115.9,
							"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
							"children": [
								{
									"type": "curve",
									"name": "color.a",
									"keys": [
										{
											"time": 1.4899999999999984,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.695,
											"value": 1,
											"mode": 2
										}
									]
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
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Decal_tour",
							"x": 0.5178,
							"y": 0.58943,
							"z": 0.75656,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 4,
							"rotationZ": 145.9,
							"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
							"albedoStrength": 1.3,
							"children": [
								{
									"type": "curve",
									"name": "color.a",
									"keys": [
										{
											"time": 1.4899999999999984,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.695,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "LightDecals",
					"enabled": false,
					"x": -0.96624,
					"y": -8.5698,
					"z": 3.36108,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Explo01",
							"x": -3.77306,
							"y": 2.15178,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 20,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
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
													"time": 0.564169501695533,
													"value": -0.01666666666666672
												},
												{
													"time": 0.5741695016955328,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.22,
													"value": 0,
													"prevHandle": {
														"dv": -0.03361111111111109,
														"dt": -1.5705834960937506
													},
													"nextHandle": {
														"dv": 0.007194614712272117,
														"dt": 0.3333111668341301
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
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo02",
							"x": -2.68945,
							"y": -11.8634,
							"z": 1.16079,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
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
													"time": 0.7757857900178262,
													"value": -0.01666666666666672
												},
												{
													"time": 0.785785790017826,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.885,
													"value": 0,
													"prevHandle": {
														"dv": 0.01722222222222225,
														"dt": -1.1150000000000002
													},
													"nextHandle": {
														"dv": -0.00506531867811874,
														"dt": 0.33331457662242014
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
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.5
							}
						},
						{
							"type": "advancedDecal",
							"name": "eclairs",
							"x": -14.94836,
							"y": 0.98806,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 15,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 45,
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
											"colorMask": 255
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.3
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 2.4079508641362213,
													"value": -0.01666666666666672
												},
												{
													"time": 2.417950864136221,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 2.842561135590078,
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
											"time": 2.1080783294542953,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.118078329454295,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.1284565374482236,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.1384565374482234,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "eclairs",
							"x": -2.3092,
							"y": 2.38657,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 15,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 45,
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
											"colorMask": 255
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.3
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 2.464968297779563,
													"value": -0.01666666666666672
												},
												{
													"time": 2.474968297779563,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 2.89957856923342,
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
											"time": 2.165095763097637,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.175095763097637,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.1854739710915654,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.195473971091565,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "eclairs",
							"x": -2.39458,
							"y": -13.70855,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 15,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 45,
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
											"colorMask": 255
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.3
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 3.2017993524670634,
													"value": -0.01666666666666672
												},
												{
													"time": 3.211799352467063,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 3.6364096239209203,
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
											"time": 2.9019268177851374,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.911926817785137,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.9223050257790657,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.9323050257790655,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Smoke",
					"x": -1.99426,
					"y": -13.18977,
					"z": 1.58387,
					"scaleX": 7.68,
					"scaleY": 7.68,
					"scaleZ": 7.68,
					"rotationZ": -126.7,
					"children": [
						{
							"type": "object",
							"name": "FireSmoke",
							"x": 0.20999999999999996,
							"y": -1.4898600000000002,
							"z": 0.026040000000000004,
							"scaleX": 0.20000000000000004,
							"scaleY": 0.20000000000000004,
							"scaleZ": 0.2,
							"rotationZ": 67.3,
							"children": [
								{
									"type": "model",
									"name": "Feu_1",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"x": 1.63923,
									"y": 5.0651,
									"z": 2.53675,
									"scaleX": 6,
									"scaleY": 7,
									"rotationX": 73.8,
									"rotationY": -14,
									"rotationZ": -132.2,
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
													"emissive": 4,
													"drawOrder": "100"
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/TS_Dust_01.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 1,
														"shiftY": 0.77,
														"shiftSpeedX": -0.15,
														"shiftSpeedY": 0
													},
													"recursiveApply": false,
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
														"progress": 0.47,
														"saturation": 0,
														"width": 0.32,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.08,
															0.05
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
														"progress": 0.3,
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
															0.01,
															0.01
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															1,
															0.45098039215686275,
															0.2901960784313725
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
														"range": 2,
														"power": 0.5
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Feu_4",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"x": 4.28662,
									"y": -0.50487,
									"z": 1.62553,
									"scaleX": 10,
									"scaleY": 12,
									"rotationX": 60,
									"rotationZ": -105.5,
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
													"emissive": 4,
													"drawOrder": "110"
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
														"texture": "Fx/Alphas/TS_Dust_01.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 1,
														"shiftY": 0.77,
														"shiftSpeedX": -0.15,
														"shiftSpeedY": 0
													},
													"recursiveApply": false,
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
														"progress": 0.47,
														"saturation": 0,
														"width": 0.32,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.06,
															0.06
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
														"progress": 0.3,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.02,
															0.02
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
															0.10196078431372549,
															0.10196078431372549,
															0.10196078431372549
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
														"range": 2,
														"power": 0.5
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
															0.45098039215686275,
															0.2901960784313725
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
												"texture": "Fx/Gradients/GradientSpice_2.png"
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
										"alpha": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 1,
													"mode": 2
												}
											]
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
								"power": 1
							}
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 1.479999999999999,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1.4899999999999993,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "ElectricitySides",
					"enabled": false,
					"x": 0.165,
					"y": 1.555,
					"z": 1.56,
					"children": [
						{
							"type": "object",
							"name": "Elec02",
							"x": -16.18499,
							"y": -8.22409,
							"z": 2.99608,
							"scaleX": 4,
							"scaleY": 7,
							"scaleZ": 5,
							"rotationX": -55.1,
							"rotationY": -2.2,
							"rotationZ": -27.8,
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
										"warmUpTime": -2.4,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.8,
											1,
											1
										],
										"lifeTime": 0.15,
										"instScale": 0.9,
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
									"x": 0.12,
									"y": -0.14,
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.4,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Wave_03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
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
							"x": -2.60045,
							"y": -6.38683,
							"z": 3.45545,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationX": -109.8,
							"rotationY": 3.1,
							"rotationZ": -142.9,
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
										"warmUpTime": -2.5,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.8,
											1,
											1
										],
										"lifeTime": 0.15,
										"burstDelay": 0.5,
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
									"x": 0.12,
									"y": -0.14,
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.4,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Wave_03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
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
							"x": -3.38879,
							"y": -23.31752,
							"z": 3.45545,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationX": -109.8,
							"rotationY": 3.1,
							"rotationZ": -142.9,
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
										"warmUpTime": -3.2,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.8,
											1,
											1
										],
										"lifeTime": 0.15,
										"burstDelay": 0.5,
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
									"x": 0.12,
									"y": -0.14,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": 31.7,
									"rotationY": 60.4,
									"rotationZ": 45.3,
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.4,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Wave_03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
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
						}
					]
				},
				{
					"type": "emitter",
					"name": "Sparkles01",
					"enabled": false,
					"props": {
						"burstParticleCount": 10,
						"emitOrientation": "Speed",
						"emitShape": "Cone",
						"emitAngle": 70,
						"instSpeed": [
							35,
							0,
							0
						],
						"lifeTime": 0.5,
						"emitSurface": true,
						"instStretch": [
							2,
							1,
							1
						],
						"instScale_rand": 0.25,
						"instSpeed_rand": [
							10,
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
						"burstDelay": 5,
						"emitDuration": 50,
						"emitRate": 10,
						"instScale": 1.5,
						"maxCount": 10,
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
					"x": -7.33093,
					"y": -13.43091,
					"z": 3.25569,
					"scaleX": 5,
					"scaleY": 5,
					"scaleZ": 5,
					"rotationX": -60,
					"rotationY": -144.1,
					"rotationZ": 60,
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
						},
						{
							"type": "curve",
							"name": "emitRate",
							"keys": [
								{
									"time": 7.032384972302246,
									"value": -0.03333333333333333,
									"mode": 2
								},
								{
									"time": 7.042384972302246,
									"value": 5,
									"mode": 2
								},
								{
									"time": 7.204840759960939,
									"value": 5,
									"mode": 2
								},
								{
									"time": 7.214840759960939,
									"value": 0,
									"mode": 2
								}
							],
							"loop": true
						}
					]
				},
				{
					"type": "object",
					"name": "IddleElectricity",
					"enabled": false,
					"x": -5.10439,
					"y": -13.151575000000001,
					"z": 5.861955,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"x": -1.0256699999999999,
							"y": 2.6472950000000015,
							"z": 0.4810149999999993,
							"scaleX": 9,
							"scaleY": 6.999999999999999,
							"scaleZ": 4.999999999999999,
							"rotationX": -72.09999999999997,
							"rotationY": 11.299999999999995,
							"rotationZ": 49.800000000000004,
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
									"name": "AnimatedTexture",
									"source": "h3d.shader.AnimatedTexture",
									"props": {
										"startFrame": 0,
										"texture": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"speed": 10,
										"frameDivision": [
											1,
											4
										],
										"totalFrames": 4,
										"startTime": 0,
										"loop": true,
										"useSourceUVs": true,
										"blendBetweenFrames": true
									}
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Wave_03.png",
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
											"keys": [
												{
													"time": 0.3684606933593741,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.3924877929687491,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5361535644531245,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.6167407226562496,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.988543701171876,
													"value": -0.03333333333333333,
													"mode": 2
												}
											],
											"loop": true
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
							"type": "polygon",
							"name": "polygon",
							"x": 1.0256700000000016,
							"y": -2.6472949999999997,
							"z": -0.4810150000000011,
							"scaleX": 8,
							"scaleY": 4.999999999999999,
							"scaleZ": 5,
							"rotationX": -72.1,
							"rotationY": 11.3,
							"rotationZ": -23.99999999999999,
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
									"name": "AnimatedTexture",
									"source": "h3d.shader.AnimatedTexture",
									"props": {
										"startFrame": 0,
										"texture": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"speed": 10,
										"frameDivision": [
											1,
											4
										],
										"totalFrames": 4,
										"startTime": 0,
										"loop": true,
										"useSourceUVs": true,
										"blendBetweenFrames": true
									}
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Wave_03.png",
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
											"keys": [
												{
													"time": 0.23230712890624966,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.25633422851562465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4805871582031251,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
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
							"type": "advancedDecal",
							"name": "eclairsdecal",
							"x": -1.25898,
							"y": 0.77164,
							"z": -0.63779,
							"scaleX": 20.000000000000004,
							"scaleY": 20.000000000000004,
							"scaleZ": 15,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 45,
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
											"colorMask": 255
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.3
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0.26953899890184596,
													"value": -0.01666666666666672
												},
												{
													"time": 0.27953899890184575,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7041492703557028,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
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
								}
							]
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1.795,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1.805,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				}
			]
		}
	]
}