{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": 0.08762,
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
			"rotationZ": 180,
			"children": [
				{
					"type": "model",
					"name": "SietchTabr_mesh",
					"source": "Structure/Base/SietchTabr/SietchTabr.fbx",
					"editorOnly": true,
					"x": 3.30123,
					"y": -7.89184,
					"scaleX": 248,
					"scaleY": 248,
					"scaleZ": 248,
					"rotationZ": 22.7
				},
				{
					"type": "object",
					"name": "Explosions",
					"z": -0.38779,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
							"x": 22.42224,
							"y": -9.41339,
							"z": 0.86723,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.8,
							"rotationX": 40.2,
							"rotationY": 13.8,
							"rotationZ": 48.5,
							"time": 1.235
						},
						{
							"type": "subFX",
							"name": "09 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
							"x": 19.44878,
							"y": -2.14445,
							"z": -1.87195,
							"scaleX": 1.4,
							"scaleY": 1.4,
							"scaleZ": 1.4,
							"rotationX": 37.8,
							"rotationY": -0.3,
							"rotationZ": 105.2,
							"time": 1.215
						},
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High_Photosensitive.fx",
							"x": 26.27887,
							"y": 8.6451,
							"z": 1.63495,
							"rotationX": 90,
							"rotationZ": 140.1,
							"time": 0.27
						},
						{
							"type": "subFX",
							"name": "FX_ScreenShake02",
							"source": "Fx/Explosion/FX_ScreenShake02.fx",
							"x": 23.66494,
							"y": -4.13649,
							"z": 0.86952,
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
							"x": 23.09626,
							"y": -4.46636,
							"z": 2.37887,
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
							"x": 22.35273,
							"y": -5.54306,
							"z": 1.10209,
							"scaleX": 0.25,
							"scaleY": 0.25,
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
															"emissive": 5,
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
					"x": 15.57871,
					"y": -1.34593,
					"z": 1.90713,
					"scaleX": 8,
					"scaleY": 8,
					"scaleZ": 8,
					"rotationZ": 61.4,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Decal_Large",
							"x": -0.34765,
							"y": -0.90678,
							"z": -0.19,
							"scaleX": 7,
							"scaleY": 7,
							"scaleZ": 3,
							"rotationX": 4.2,
							"rotationY": 0.1,
							"rotationZ": 26.8,
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
							"name": "advancedDecal",
							"x": 0.84897,
							"y": 0.62884,
							"z": -0.01388,
							"scaleX": 5.5,
							"scaleY": 5.5,
							"scaleZ": 3,
							"rotationZ": 55.5,
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
										"width": 0.15,
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
						}
					]
				},
				{
					"type": "object",
					"name": "Smoke",
					"x": 25.21789,
					"y": -10.09718,
					"z": 1.90713,
					"scaleX": 8,
					"scaleY": 8,
					"scaleZ": 8,
					"rotationZ": -7.8,
					"children": [
						{
							"type": "object",
							"name": "FireSmoke",
							"x": -0.07734,
							"y": -0.53122,
							"z": 0.02604,
							"scaleX": 0.20000000000000004,
							"scaleY": 0.20000000000000004,
							"scaleZ": 0.2,
							"rotationZ": 18.7,
							"children": [
								{
									"type": "model",
									"name": "Feu_1",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"x": 0.91329,
									"y": 4.45836,
									"z": -0.51344,
									"scaleX": 7,
									"scaleY": 15,
									"rotationX": 69.3,
									"rotationY": -2.8,
									"rotationZ": -48.7,
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
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															1,
															0.4627450980392157,
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
									"name": "Feu_2",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"x": -3.64714,
									"y": 4.21032,
									"z": 1.76269,
									"scaleX": 6,
									"scaleY": 10,
									"rotationX": 46.7,
									"rotationY": 2.9,
									"rotationZ": -25.9,
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
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															1,
															0.4627450980392157,
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
									"x": -0.2459,
									"y": 9.78557,
									"z": 0.59735,
									"scaleX": 8,
									"scaleY": 6,
									"rotationX": 59.3,
									"rotationY": -2.5,
									"rotationZ": -52.6,
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
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															1,
															0.4627450980392157,
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
										"maxCount": 10,
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
									"x": -0.32359,
									"y": 4.33747,
									"z": 0.75386,
									"scaleY": 6,
									"scaleZ": 5,
									"rotationZ": 73.8,
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
					"x": 2.3631400000000005,
					"y": -2.8031385714285713,
					"z": 3.3610814285714286,
					"children": [
						{
							"type": "advancedDecal",
							"name": "HighExplosion",
							"x": 21.10085,
							"y": -5.45342,
							"z": -0.67618,
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
							"type": "advancedDecal",
							"name": "Explo01",
							"x": 24.29255,
							"y": 11.36218,
							"z": -2.88109,
							"scaleX": 18,
							"scaleY": 18,
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
													"time": 0.6941695016955329,
													"value": -0.01666666666666672
												},
												{
													"time": 0.7041695016955327,
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