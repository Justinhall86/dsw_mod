{
	"type": "fx",
	"cullingRadius": 35,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
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
			"rotationZ": 165,
			"children": [
				{
					"type": "model",
					"name": "SietchTuek_mesh",
					"source": "Structure/Base/SietchTuek/SietchTuek.fbx",
					"editorOnly": true,
					"y": 2.53,
					"scaleX": 14.099999999999998,
					"scaleY": 14.099999999999998,
					"scaleZ": 14.1,
					"rotationZ": -150.00000000000003
				},
				{
					"type": "object",
					"name": "Decals",
					"x": -4.84833,
					"y": 11.54226,
					"z": 8.50583,
					"scaleX": 8.2,
					"scaleY": 8.2,
					"scaleZ": 8.2,
					"rotationZ": 150.8,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Decal_Large",
							"x": -0.18313,
							"y": 0.27765,
							"z": 0.27955,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 3,
							"rotationZ": 26.8,
							"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
							"albedoStrength": 1.2,
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
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"x": -0.41723,
							"y": 1.40384,
							"z": -0.3,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 2,
							"rotationZ": 23.9,
							"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
							"albedoStrength": 0.9,
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
					"name": "Explosions",
					"children": [
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
							"x": -3.76123,
							"y": 0.39263,
							"z": 9.12516,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"rotationX": -10,
							"rotationY": 19.8,
							"rotationZ": 2.6,
							"time": 1.23145
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
							"x": -8.19371,
							"y": -0.64818,
							"z": 6.68401,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 1.2,
							"rotationX": -17.3,
							"rotationY": -32.9,
							"rotationZ": 47.7,
							"time": 1.215
						},
						{
							"type": "subFX",
							"name": "07 - FX_Explosion_Mid_Slow_SmallDistort",
							"source": "Fx/Explosion/BasesExplosions/FX_Explosion_Mid_Slow_SmallDistort_Base_Photosensitive.fx",
							"x": -4.73093,
							"y": 0.69117,
							"z": 6.9635,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"rotationZ": -180,
							"time": 0.02848
						},
						{
							"type": "subFX",
							"name": "FX_ScreenShake02",
							"source": "Fx/Explosion/FX_ScreenShake02.fx",
							"x": -5.71579,
							"y": 0.35048,
							"z": 0.58779,
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
							"type": "light",
							"name": "light_0",
							"enabled": false,
							"x": -5.06149,
							"y": 0.49666,
							"z": 9.40812,
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
											"time": 1.3091363618727931,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3091363618727931,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3091363618727931,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3091363618727931,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3091363618727931,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3191363618727932,
											"value": 0.25,
											"mode": 2
										},
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
											"value": 0.6,
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
							"x": -5.22756,
							"y": 1.58368,
							"z": 9.06272,
							"scaleX": 0.15,
							"scaleY": 0.15,
							"scaleZ": 0.25,
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
															"emissive": 3,
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
					"name": "Smoke",
					"x": -6.28413,
					"y": 4.46008,
					"z": 10.66756,
					"scaleX": 7.68,
					"scaleY": 7.68,
					"scaleZ": 7.68,
					"rotationZ": 150.8,
					"children": [
						{
							"type": "object",
							"name": "FireSmoke",
							"x": -0.17285,
							"y": 0.52132,
							"z": -0.27989,
							"scaleX": 0.2,
							"scaleY": 0.2,
							"scaleZ": 0.2,
							"rotationZ": -59.6,
							"children": [
								{
									"type": "model",
									"name": "Feu_1",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"x": -0.6158,
									"y": 0.47542,
									"z": 0.60322,
									"scaleX": 4,
									"scaleY": 6,
									"rotationX": 63.2,
									"rotationY": -14,
									"rotationZ": -115.6,
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
									"x": 0.91838,
									"y": -0.82827,
									"z": 1.00434,
									"scaleX": 7,
									"scaleY": 6,
									"rotationX": 60.6,
									"rotationY": 6.4,
									"rotationZ": -94.3,
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
									"type": "emitter",
									"name": "Sparks",
									"props": {
										"lifeTime": 5,
										"lifeTimeRand": 1,
										"maxCount": 8,
										"alignMode": "Screen",
										"useRandomColor": true,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.12156862745098039,
											0.12156862745098039,
											0.12156862745098039,
											1
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0,
										"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
										"instAcceleration": [
											0,
											0.45,
											0.4
										],
										"instAcceleration_rand": [
											0,
											0.3,
											0.3
										],
										"instScale_rand": 0.2,
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
									"x": 0.39237,
									"y": -0.85996,
									"z": 0.74404,
									"scaleY": 7,
									"scaleZ": 2,
									"rotationZ": 10.6,
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
															"enableStencil": false,
															"parallax": 0,
															"emissive": 8
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
																"alpha": 0.7,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/TS_Dust_02.png"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": -0.0050000000000000044,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.08,
																			"value": 1,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "shader",
															"name": "ColorMult",
															"source": "shaders/ColorMult.hx",
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
																"texture": "Fx/noise/Wave_01.jpg",
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
																	"name": "width",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
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
								}
							]
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 1.4899999999999984,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1.4999999999999987,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "LightDecals",
					"enabled": false,
					"x": -4.47767,
					"y": 0.92095,
					"z": 8.82193,
					"children": [
						{
							"type": "advancedDecal",
							"name": "HighExplosion",
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 40,
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
													"time": 1.4831492424011223,
													"value": -0.01666666666666672
												},
												{
													"time": 1.4931492424011221,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.880426394939424,
													"value": 0,
													"prevHandle": {
														"dv": -0.03361111111111109,
														"dt": -1.949996230602265
													},
													"nextHandle": {
														"dv": 0.0057926397589892495,
														"dt": 0.3333135451062032
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
						}
					]
				}
			]
		}
	]
}