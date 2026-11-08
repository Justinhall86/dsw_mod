{
	"type": "fx",
	"duration": 13,
	"cullingRadius": 3,
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
			"z": -0.1,
			"rotationZ": 114.99999999999997,
			"children": [
				{
					"type": "object",
					"name": "SmallExplosions",
					"x": 2.36314,
					"y": -2.803138571428571,
					"z": 3.3610814285714286,
					"children": [
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High_Photosensitive.fx",
							"x": -9.23559,
							"y": -0.54284,
							"z": 4.8566,
							"scaleX": 1.5,
							"scaleY": 1.5000000000000009,
							"scaleZ": 1.5000000000000009,
							"rotationX": -38.9,
							"rotationY": -50,
							"rotationZ": 53.7
						},
						{
							"type": "subFX",
							"name": "02 - FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium_Photosensitive.fx",
							"x": -5.17102,
							"y": 14.31387,
							"z": -1.10042,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"rotationX": -30,
							"time": 0.39244
						},
						{
							"type": "subFX",
							"name": "05 - FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium_Photosensitive.fx",
							"x": 9.41131,
							"y": 1.24022,
							"z": -0.31684,
							"rotationX": -30,
							"rotationZ": 180,
							"time": 1.05173
						},
						{
							"type": "subFX",
							"name": "06 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High_Photosensitive.fx",
							"x": 8.47512,
							"y": 8.51685,
							"z": -1.68533,
							"scaleX": 1.3,
							"scaleY": 1.3,
							"scaleZ": 1.3,
							"rotationY": 17,
							"rotationZ": 29.9,
							"time": 1.25445
						},
						{
							"type": "subFX",
							"name": "07 - FX_Explosion_Mid_Slow_SmallDistort",
							"source": "Fx/Explosion/BasesExplosions/FX_Explosion_Mid_Slow_SmallDistort_Base_Photosensitive.fx",
							"x": -2.78339,
							"y": 3.14334,
							"z": -5.29413,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationZ": -180,
							"time": 0.17999
						},
						{
							"type": "subFX",
							"name": "08 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
							"x": -11.1188,
							"y": -9.92443,
							"z": -2.47298,
							"scaleZ": 1.2,
							"rotationX": -51.7,
							"rotationY": 13.5,
							"rotationZ": 154.9,
							"time": 1.42677
						},
						{
							"type": "subFX",
							"name": "09 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
							"x": 0.62853,
							"y": 11.32691,
							"z": -3.58022,
							"scaleX": 1.5,
							"scaleY": 1.5000000000000002,
							"scaleZ": 1.7,
							"rotationX": 36.2,
							"rotationY": -18.8,
							"rotationZ": 152.6,
							"time": 1.42677
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
						}
					]
				},
				{
					"type": "object",
					"name": "BigExplosions",
					"children": [
						{
							"type": "subFX",
							"name": "FX_ScreenShake",
							"source": "Fx/Explosion/FX_ScreenShake.fx",
							"rotationZ": -180,
							"time": 2.67
						},
						{
							"type": "subFX",
							"name": "FX_ExplosionCircular",
							"source": "Fx/Explosion/BasesExplosions/FX_ExplosionCircular_Photosensitive.fx",
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"rotationZ": -114.99999999999997,
							"time": 2.41001
						},
						{
							"type": "light",
							"name": "light_1",
							"enabled": false,
							"z": 5.5603,
							"scaleX": 110,
							"scaleY": 110,
							"scaleZ": 110,
							"color": 11623490,
							"range": 110,
							"zNear": 0.02,
							"children": [
								{
									"type": "curve",
									"name": "power",
									"keys": [
										{
											"time": 3.123180687227288,
											"value": 0,
											"mode": 2
										},
										{
											"time": 5,
											"value": 3,
											"mode": 2
										},
										{
											"time": 3.976678071580829,
											"value": 0,
											"mode": 2
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
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						},
						{
							"type": "object",
							"name": "Anticipation",
							"z": 1.25645,
							"children": [
								{
									"type": "emitter",
									"name": "FireTube_Big",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 4,
										"animationSpeed": 0,
										"instStretch": [
											0.97,
											0.97,
											1.5
										],
										"emitType": "Burst",
										"instStretch_rand": [
											0,
											0,
											0.05
										],
										"instScale": 64,
										"instScale_rand": 1,
										"seedGroup": 4,
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
										"maxCount": 1,
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
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png",
										"warmUpTime": -1.6,
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
									"z": 2.5129,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Cylinder",
											"source": "Fx/Meshes_Common/FireTube_tapered03.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 90,
											"rotationZ": -90,
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
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.75
													},
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
																		"dt": -0.5449999999999999
																	},
																	"nextHandle": {
																		"dv": 0.010192021509306938,
																		"dt": 0.33327910335433686
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
														"power": 0.8
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
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.45,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 1.25,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.1
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
																		"dv": 0.044066720545493605,
																		"dt": -1.1385534908346637
																	},
																	"nextHandle": {
																		"dv": -0.016666666666666607,
																		"dt": 0.4306172839506173
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Noise_Wave_02.png",
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
																	"value": 1,
																	"prevHandle": {
																		"dv": 0.4501476276915423,
																		"dt": -0.6144515117989549
																	},
																	"nextHandle": {
																		"dv": -0.33333333333333337,
																		"dt": 0.455
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.2833333333333333,
																		"dt": -0.29500000000000004
																	},
																	"nextHandle": {
																		"dv": -0.40250763363430087,
																		"dt": 0.41908147737218393
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "uvShift.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"prevHandle": {
																		"dv": -4.648840347948921,
																		"dt": -0.016645246701604628
																	},
																	"nextHandle": {
																		"dv": 0.6888255777144666,
																		"dt": 0.0018497631910221503
																	}
																},
																{
																	"time": 1,
																	"value": 0.5,
																	"prevHandle": {
																		"dv": 0.006489395378284302,
																		"dt": -0.9710203766739863
																	},
																	"nextHandle": {
																		"dv": -0.003474774353306732,
																		"dt": 0.3333322597043977
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
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 0.75,
														"texture": "Fx/Gradients/vGrad_uneaven.png",
														"uvShift": [
															0.5,
															0.1
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
											"type": "curve",
											"name": "instStretch.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"prevHandle": {
														"dv": -0.7525956070201336,
														"dt": -0.10924774940614855
													},
													"nextHandle": {
														"dv": 0.5166666666666666,
														"dt": 0.075
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.841171875
													},
													"nextHandle": {
														"dv": -1.0751357358769627e-16,
														"dt": 0.33333333333333326
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "FireExplo_floor",
									"props": {
										"warmUpTime": -1.6,
										"emitType": "Burst",
										"instScale": 40,
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
									"z": 0.4036,
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
														"texture": "Fx/Alphas/T_circle5.png"
													},
													"isInstance": true
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
													"enabled": false,
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
													"enabled": false,
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
				},
				{
					"type": "object",
					"name": "DebrisCylinder",
					"z": 10,
					"scaleX": 0.4,
					"scaleY": 0.4,
					"scaleZ": 0.4,
					"rotationZ": -2.6504622345529305e-15,
					"children": [
						{
							"type": "emitter",
							"name": "Debris",
							"props": {
								"lifeTime": 1.5,
								"lifeTimeRand": 0.6,
								"warmUpTime": -5.35,
								"emitType": "Burst",
								"burstParticleCount": 18,
								"emitShape": "Cylinder",
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"animationSpeed": 0,
								"instScale": 33,
								"instSpeed": [
									600,
									0,
									190
								],
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 22,
								"instSpeed_rand": [
									310,
									0,
									110
								],
								"instWorldSpeed": [
									0,
									0,
									-10
								],
								"instWorldSpeed_rand": [
									0,
									0,
									-3
								],
								"seedGroup": 1,
								"useRandomColor": true,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.7098039215686275,
									0.7098039215686275,
									0.7098039215686275,
									1
								],
								"simulationSpace": "World",
								"speedFactor": 1.75,
								"emitOrientation": "Normal",
								"maxCount": 25,
								"emitRad1": 0.48,
								"instAcceleration": [
									25,
									0,
									0
								],
								"instStretch": [
									2,
									1,
									1
								],
								"instStretch_rand": [
									0.75,
									0,
									0
								],
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
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 5,
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
											"wrapRepeat": true,
											"color": [
												0.9568627450980391,
												0.9568627450980391,
												0.9568627450980391,
												1
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
															"time": 0.9491220850480115,
															"value": 0,
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9450980392156862,
													0.9450980392156862,
													0.9450980392156862
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
													"name": "color.s",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
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
													"name": "color.l",
													"keys": [
														{
															"time": 0,
															"value": 0.396078431372549,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.050980392156862744,
															"mode": 2
														}
													]
												}
											]
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
											"prevHandle": {
												"dv": 3.1322290064091,
												"dt": -0.05293908179846354
											},
											"nextHandle": {
												"dv": -1.1833333333333333,
												"dt": 0.020000000000000004
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"prevHandle": {
												"dv": 0.08333333333333331,
												"dt": -0.9203769144228198
											},
											"nextHandle": {
												"dv": -0.05935425160502109,
												"dt": 0.6552709377194234
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instAcceleration.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"prevHandle": {
												"dv": 3.1322290064091,
												"dt": -0.05293908179846354
											},
											"nextHandle": {
												"dv": -1.1833333333333333,
												"dt": 0.020000000000000004
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"prevHandle": {
												"dv": 0.08333333333333331,
												"dt": -0.9203769144228198
											},
											"nextHandle": {
												"dv": -0.05935425160502109,
												"dt": 0.6552709377194234
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
												"dv": 3.1322290064091,
												"dt": -0.05293908179846354
											},
											"nextHandle": {
												"dv": -1.1833333333333333,
												"dt": 0.020000000000000004
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"prevHandle": {
												"dv": 0.08333333333333331,
												"dt": -0.9203769144228198
											},
											"nextHandle": {
												"dv": -0.05935425160502109,
												"dt": 0.6552709377194234
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
											"prevHandle": {
												"dv": -0.08281631008272207,
												"dt": -0.49938234979881435
											},
											"nextHandle": {
												"dv": 0.16666666666666669,
												"dt": 1.005
											}
										},
										{
											"time": 1,
											"value": 1,
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
					"type": "object",
					"name": "LightDecals",
					"enabled": false,
					"children": [
						{
							"type": "advancedDecal",
							"name": "HighExplosionAnticipation",
							"scaleX": 65,
							"scaleY": 65,
							"scaleZ": 40,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 2,
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
										"scale": 0.25
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.6009960556030256,
													"value": -0.01666666666666672
												},
												{
													"time": 1.6109960556030254,
													"value": 2,
													"mode": 2
												},
												{
													"time": 1.8629991579055791,
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
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.532887894138693,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.5428878941386928,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.8925985145568833,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.9025985145568831,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "HighExplosion",
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 50,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
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
										"scale": 2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 3.1049784660339332,
													"value": -0.01666666666666672
												},
												{
													"time": 3.114978466033933,
													"value": 1,
													"mode": 2
												},
												{
													"time": 6.66190443277359,
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
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 2.923353576660157,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.933353576660157,
											"value": 1,
											"mode": 2
										},
										{
											"time": 7.235064096877894,
											"value": 1,
											"mode": 2
										},
										{
											"time": 7.245064096877893,
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
							"x": -7.93468,
							"y": -4.43871,
							"z": 6.04165,
							"scaleX": 22,
							"scaleY": 22,
							"scaleZ": 40,
							"rotationX": 12.3,
							"rotationY": -3.7,
							"rotationZ": -7.2,
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
													"time": 0.46471523228635303,
													"value": -0.01666666666666672
												},
												{
													"time": 0.4747152322863528,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.3311292266845705,
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
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0.3726326861232515,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3826326861232515,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.4156487192958584,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.4325237192958586,
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
							"x": -3.20659,
							"y": 11.74048,
							"z": 1.47536,
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
													"time": 0.8107857900178259,
													"value": -0.01666666666666672
												},
												{
													"time": 0.8207857900178257,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.677199784416043,
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
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0.7174078287929301,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.7274078287929301,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.7546943583339467,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.7646943583339465,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo04",
							"x": 12.27591,
							"y": -0.95631,
							"z": 2.12237,
							"scaleX": 20,
							"scaleY": 20,
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
													"time": 1.520141071224959,
													"value": -0.01666666666666672
												},
												{
													"time": 1.5301410712249588,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.018515625000003,
													"value": 0,
													"prevHandle": {
														"dv": -0.016666666666666663,
														"dt": -0.9326074218750007
													},
													"nextHandle": {
														"dv": 0.006055923122821887,
														"dt": 0.33331271905465326
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
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.426958114132286,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.436958114132286,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.10960593365133,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.11960593365133,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo05",
							"x": 10.66204,
							"y": 6.46263,
							"z": 2.12237,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 25,
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
													"time": 1.758910373593121,
													"value": -0.01666666666666672
												},
												{
													"time": 1.7689103735931209,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.453061294555667,
													"value": 0,
													"prevHandle": {
														"dv": 0.0002777777777778212,
														"dt": -0.4271484375000001
													},
													"nextHandle": {
														"dv": -1.9431447321434067e-16,
														"dt": 0.33332243025631764
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
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.6689810862392183,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.6789810862392183,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.537702495083214,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.5477024950832137,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo06",
							"z": 2.12237,
							"scaleX": 25,
							"scaleY": 25,
							"scaleZ": 25,
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
													"time": 1.6014459074981522,
													"value": -0.01666666666666672
												},
												{
													"time": 1.611445907498152,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.7865782737731966,
													"value": 0,
													"prevHandle": {
														"dv": 0.0002777777777778212,
														"dt": -0.4271484375000001
													},
													"nextHandle": {
														"dv": -1.9431447321434067e-16,
														"dt": 0.33332243025631764
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
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.5023674120754016,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.5123674120754016,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.8605129542201775,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.8705129542201773,
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
					"type": "model",
					"name": "BaseCarthag_mesh",
					"source": "Structure/Base/Carthag/BaseCarthag.fbx",
					"editorOnly": true,
					"locked": true,
					"scaleX": 7.7,
					"scaleY": 7.7,
					"scaleZ": 7.7
				},
				{
					"type": "object",
					"name": "TESTSDECALS",
					"editorOnly": true,
					"locked": true,
					"x": 1.9750966666666658,
					"y": 2.124433333333333,
					"z": 1.4188933333333331,
					"children": [
						{
							"type": "object",
							"name": "Decals",
							"x": 7.571313333333334,
							"y": 8.618826666666667,
							"z": 0.4882366666666669,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"rotationZ": 121.4,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.0573,
									"y": -0.2022,
									"z": -0.19,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 2.5,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 0.9,
									"children": [
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
									"x": 0.04591,
									"y": 0.07799,
									"z": -0.19293,
									"scaleX": 4.619999999999998,
									"scaleY": 4.619999999999998,
									"scaleZ": 2.419999999999999,
									"rotationZ": 55.5,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 1.1,
									"children": [
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
							"name": "Decals",
							"locked": true,
							"x": 0.9049033333333341,
							"y": -12.124433333333332,
							"z": -1.4188933333333331,
							"scaleX": 7.999999999999999,
							"scaleY": 7.999999999999999,
							"scaleZ": 8,
							"rotationZ": 54.55,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.45,
									"y": 0.11077,
									"scaleX": 6,
									"scaleY": 7,
									"scaleZ": 4,
									"rotationZ": 117.27,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.2,
									"children": [
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
									"x": 0.91,
									"y": -0.91,
									"z": 0.75656,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 4,
									"rotationZ": 145.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.2
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"x": -8.476216666666666,
							"y": 3.505606666666667,
							"z": 0.9306566666666667,
							"scaleX": 8.200000000000001,
							"scaleY": 8.200000000000001,
							"scaleZ": 8.2,
							"rotationZ": 177.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": 0.33745,
									"y": -0.36061,
									"z": -0.3,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 1.73,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.2
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": -0.1923,
									"y": 0.28425,
									"z": -0.3,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 1.56,
									"rotationZ": 23.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.75
								}
							]
						}
					]
				},
				{
					"type": "curve",
					"name": "shake",
					"keyMode": 1,
					"keys": [
						{
							"time": 3.22149718040521,
							"value": 0,
							"mode": 2
						},
						{
							"time": 3.23149718040521,
							"value": 0.6,
							"mode": 1,
							"prevHandle": {
								"dv": 0,
								"dt": -0.0033333333333334103
							},
							"nextHandle": {
								"dv": -0.7192381143569948,
								"dt": 0.060588964732227524
							}
						},
						{
							"time": 7.972173117524947,
							"value": 0,
							"prevHandle": {
								"dv": 0.012394726276397566,
								"dt": -3.835783505765723
							},
							"nextHandle": {
								"dv": -0.00025634174510772535,
								"dt": 0.06342803257848675
							}
						}
					]
				},
				{
					"type": "object",
					"name": "DamageDecal",
					"x": 2.7755575615628914e-17,
					"y": 0.47709000000000007,
					"z": -0.77242,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Sanddecal_02",
							"z": 1.1102230246251565e-16,
							"scaleX": 70.00000000000003,
							"scaleY": 70.00000000000003,
							"scaleZ": 20,
							"rotationZ": 120.59999999999998,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"albedoStrength": 3,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_02.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 2.2102078729594368,
													"value": 0,
													"prevHandle": {
														"dv": 5.587040948717635e-17,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 1.0959708460955895
													}
												},
												{
													"time": 3.287912538286765,
													"value": 0.9666666666666667,
													"mode": 2
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.65,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_02.png",
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
							"name": "Sanddecal_02",
							"z": 1.1102230246251565e-16,
							"scaleX": 100.00000000000001,
							"scaleY": 100.00000000000001,
							"scaleZ": 20,
							"rotationZ": 156.1,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"albedoStrength": 2,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_02.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 2.2102078729594368,
													"value": 0,
													"prevHandle": {
														"dv": 5.587040948717635e-17,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 1.0959708460955895
													}
												},
												{
													"time": 3.287912538286765,
													"value": 0.9666666666666667,
													"mode": 2
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.72,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_02.png",
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
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.75
							}
						}
					]
				}
			]
		}
	]
}