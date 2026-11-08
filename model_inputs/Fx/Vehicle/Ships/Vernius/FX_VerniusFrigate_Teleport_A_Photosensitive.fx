{
	"type": "fx",
	"duration": 4,
	"cullingRadius": 1000,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 500,
			"scaleY": 500,
			"scaleZ": 500,
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
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png",
					"refMatLib": ""
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"z": -0.15,
			"scaleX": 0.5,
			"scaleY": 0.5,
			"scaleZ": 0.5,
			"children": [
				{
					"type": "object",
					"name": "Teleport",
					"x": -0.18724666666666662,
					"y": -10.497554999999998,
					"z": 10.593928166666666,
					"children": [
						{
							"type": "object",
							"name": "MESH",
							"x": 0.18724666666666662,
							"y": 10.497554999999998,
							"z": -9.900830166666665,
							"scaleX": 1.25,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"children": [
								{
									"type": "object",
									"name": "Fregate+lights",
									"z": 2.772392,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"children": [
										{
											"type": "model",
											"name": "FolderRelay",
											"source": "Vehicle/Vernius/FolderRelay/FolderRelay.fbx",
											"z": -0.5,
											"rotationZ": -90,
											"children": [
												{
													"type": "animEvent",
													"name": "animEvent",
													"enabled": false,
													"animation": "Anim/FolderRelay/Anim_FolderRelay_Skill.fbx"
												},
												{
													"type": "animEvent",
													"name": "animEvent",
													"animation": "Anim/FolderRelay/Anim_FolderRelay_Skill.fbx"
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 2.8054308339656666,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.8485036654186593,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "object",
											"name": "LIGHTS",
											"enabled": false,
											"rotationX": -90,
											"children": [
												{
													"type": "model",
													"name": "VerniusFregate_LightsPole",
													"source": "Fx/Meshes_Common/VerniusFregate_Lights.fbx",
													"z": -4.02,
													"rotationZ": -60,
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
																	"colorMask": 255,
																	"emissive": 15,
																	"alphaKill": true,
																	"drawOrder": "100"
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
															"refMatLib": ""
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															}
														},
														{
															"type": "shader",
															"name": "AlphaCycle",
															"source": "shaders/AlphaCycle.hx",
															"props": {
																"minAlpha": 0,
																"maxAlpha": 1,
																"frequency": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "frequency",
																	"keys": [
																		{
																			"time": 1.6874964001200787,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.041755697635363,
																			"value": 3,
																			"mode": 2
																		},
																		{
																			"time": 2.9275772620037275,
																			"value": 3,
																			"mode": 2
																		},
																		{
																			"time": 2.9375772620037273,
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
																"amount": 0.7,
																"ATTENUATE": true,
																"emissiveMap": null
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.27058823529411763,
																	0.1764705882352941,
																	0.996078431372549
																]
															}
														}
													]
												},
												{
													"type": "model",
													"name": "VerniusFregate_LightsPole",
													"source": "Fx/Meshes_Common/VerniusFregate_LightsPole.fbx",
													"z": -4.02,
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
																	"colorMask": 255,
																	"emissive": 8,
																	"drawOrder": "100"
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
															"refMatLib": ""
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
																"saturation": 0.5,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/vGrad.png",
																"uvShift": [
																	0.98,
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
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.0438646189795828,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.0437480204274117,
																			"value": 0.970407296131008,
																			"prevHandle": {
																				"dv": -0.019215986062000145,
																				"dt": -0.5503945329070634
																			},
																			"nextHandle": {
																				"dv": 0.012597404361133015,
																				"dt": 0.3608215819274848
																			}
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
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.0437480204274117,
																			"value": 0.970407296131008,
																			"prevHandle": {
																				"dv": -0.019215986062000145,
																				"dt": -0.5503945329070634
																			},
																			"nextHandle": {
																				"dv": 0.012597404361133015,
																				"dt": 0.3608215819274848
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
																	0.33725490196078434,
																	0.27058823529411763,
																	0.984313725490196
																]
															}
														},
														{
															"type": "shader",
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															}
														},
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keys": [
																{
																	"time": 3.9280574420999033,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3.965027083096431,
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
							"type": "object",
							"name": "Area",
							"x": 0.18725,
							"y": 10.49755,
							"scaleX": 0.45,
							"scaleY": 0.45,
							"scaleZ": 0.45,
							"children": [
								{
									"type": "object",
									"name": "SandFloor",
									"z": -0.2941299999999991,
									"children": [
										{
											"type": "model",
											"name": "DiskFlatStraight01_MoreVrtx",
											"source": "Fx/Meshes_Common/Disk_SpiraleUV01.fbx",
											"scaleX": 10,
											"scaleY": 10,
											"scaleZ": 10,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"refMatLib": "",
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
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
																"progress": 0.35,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Fire.png",
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
																	"name": "uvShift.y",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.11018696077397747,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.08882454550502085,
																				"dt": -0.4996995787287194
																			},
																			"nextHandle": {
																				"dv": -0.2941276645666329,
																				"dt": 1.6527630105659534
																			}
																		},
																		{
																			"time": 4.183901937530191,
																			"value": 7,
																			"prevHandle": {
																				"dv": -3.8262763764462857,
																				"dt": -0.3254069086990432
																			},
																			"nextHandle": {
																				"dv": 5.202121880256428,
																				"dt": 0.43712750552235147
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
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.35,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/Cyl04v_A.jpg",
																"uvShift": [
																	0.5,
																	0.5
																],
																"uvShiftSpeed": [
																	0,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.11018696077397747,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.08990422122354563,
																				"dt": -0.4996944938706737
																			},
																			"nextHandle": {
																				"dv": -0.31370119888499026,
																				"dt": 1.7417017946458953
																			}
																		},
																		{
																			"time": 4.183901937530191,
																			"value": 8,
																			"prevHandle": {
																				"dv": -4.645006201900809,
																				"dt": -0.3622159457737215
																			},
																			"nextHandle": {
																				"dv": 5.26663179246641,
																				"dt": 0.4102579584025016
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 1,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/vGrad_inv.jpg",
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
																			"time": 0.09667114157210421,
																			"value": 0,
																			"prevHandle": {
																				"dv": -0.003508648383247387,
																				"dt": -0.4999936232216757
																			},
																			"nextHandle": {
																				"dv": 0.008383268754121598,
																				"dt": 1.1965899333409389
																			}
																		},
																		{
																			"time": 2.482921951957202,
																			"value": 0.5,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6878212649401064
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.5667957511610338
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
														"range": 1.5,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "AlphaKill",
													"source": "shaders/AlphaKill.hx",
													"props": {
														"threshold": 0.02,
														"useRGB": false
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 2.6785522804225077,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.00009664841664580592,
														"dt": -0.41190780605022725
													},
													"nextHandle": {
														"dv": -0.01575369191325171,
														"dt": 0.15255844668527008
													}
												},
												{
													"time": 2.872224821468365,
													"value": 0,
													"prevHandle": {
														"dv": 0.9514495773694902,
														"dt": -0.08401907364776218
													},
													"nextHandle": {
														"dv": -1.2221043655024693,
														"dt": 0.10794370008828
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.40087070382828216,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.8257989381153953
															}
														},
														{
															"time": 1.6024081885013834,
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
									"name": "IRIDESCENT",
									"z": 0.2941299999999991,
									"scaleX": 4.2,
									"scaleY": 4.2,
									"scaleZ": 4.2,
									"children": [
										{
											"type": "polygon",
											"name": "CLOSING",
											"scaleX": 22,
											"scaleY": 22,
											"scaleZ": 22,
											"rotationZ": 180,
											"kind": 1,
											"args": [
												24,
												360,
												0,
												4
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
															"drawOrder": "100"
														}
													},
													"diffuseMap": "Fx/Gradients/T_Irridescent05.png",
													"refMatLib": ""
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.31,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/GradientBorder.png",
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.4,
														"saturation": 0.25,
														"width": 1,
														"uvScaleX": 10,
														"uvScaleY": 0.75,
														"texture": "Fx/noise/T_ElecNoise04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.36,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -16777216
																	},
																	{
																		"position": 0.03515625,
																		"color": -1
																	},
																	{
																		"position": 0.93359375,
																		"color": -1
																	},
																	{
																		"position": 0.98046875,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															-0.05
														],
														"scale": [
															3,
															0.25
														]
													}
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/Alphas/TS_Dust_01_1024.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															-0.5
														],
														"scale": [
															2,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															0
														],
														"scale": [
															2,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -11387726
																	},
																	{
																		"position": 0.359375,
																		"color": -5726984
																	},
																	{
																		"position": 1,
																		"color": -1516554
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "MaskColorAlpha",
													"source": "hrt.shader.MaskColorAlpha",
													"props": {
														"UVScale": [
															1,
															1
														],
														"alpha": 1,
														"MULTIPLY": false,
														"color": [
															0.8980392156862745,
															0.788235294117647,
															1,
															1
														],
														"mask": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0.08984375,
																		"color": -16777216
																	},
																	{
																		"position": 0.11328125,
																		"color": -1
																	},
																	{
																		"position": 0.12109375,
																		"color": -16777216
																	}
																],
																"resolution": 512,
																"isVertical": true,
																"interpolation": "Cubic",
																"colorMode": 0
															}
														},
														"UVOffset": [
															0,
															0.21
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 2.2080176460529097,
															"value": 0.004783363236627203,
															"prevHandle": {
																"dv": -0.7758151872155292,
																"dt": -0.09255428087998094
															},
															"nextHandle": {
																"dv": 2.995216636763373,
																"dt": 0.3571880184986924
															}
														},
														{
															"time": 2.7376483010147905,
															"value": 3,
															"mode": 1,
															"prevHandle": {
																"dv": -0.00009664841664580592,
																"dt": -0.41190780605022725
															},
															"nextHandle": {
																"dv": -0.01575369191325171,
																"dt": 0.15255844668527008
															}
														},
														{
															"time": 2.943602204039905,
															"value": 0,
															"prevHandle": {
																"dv": 2.5776822744889603,
																"dt": -0.1226954740229802
															},
															"nextHandle": {
																"dv": -1.243252084413553,
																"dt": 0.05935141200897378
															}
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
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 2.415572894242966,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.608548894955281,
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
											"type": "polygon",
											"name": "TestBobineIridescentPurpleOK",
											"scaleX": 25,
											"scaleY": 25,
											"scaleZ": 25,
											"kind": 1,
											"args": [
												24,
												360,
												0,
												4
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
															"drawOrder": "100"
														}
													},
													"diffuseMap": "Fx/Gradients/T_Irridescent05.png",
													"refMatLib": ""
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.31,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/GradientBorder.png",
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.4,
														"saturation": 0.25,
														"width": 1,
														"uvScaleX": 10,
														"uvScaleY": 0.75,
														"texture": "Fx/noise/T_ElecNoise04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.36,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -16777216
																	},
																	{
																		"position": 0.03515625,
																		"color": -1
																	},
																	{
																		"position": 0.93359375,
																		"color": -1
																	},
																	{
																		"position": 0.98046875,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.32,
														"scrollSpeed": [
															0,
															-0.05
														],
														"scale": [
															3,
															0.25
														]
													}
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/Alphas/TS_Dust_01_1024.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															-0.5
														],
														"scale": [
															2,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															0
														],
														"scale": [
															2,
															1
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.6120540685675593,
															"value": 0.004783363236627203,
															"prevHandle": {
																"dv": -0.7858060700381525,
																"dt": -0.08074978007894783
															},
															"nextHandle": {
																"dv": 2.967195628554196,
																"dt": 0.3036709244144016
															}
														},
														{
															"time": 1.1185495537537118,
															"value": 3,
															"prevHandle": {
																"dv": 0.0064309020734008016,
																"dt": -0.39116165291694815
															},
															"nextHandle": {
																"dv": -1.594567953166881e-16,
																"dt": 0.261785888613747
															}
														},
														{
															"time": 1.4540033699764876,
															"value": 3,
															"mode": 1,
															"prevHandle": {
																"dv": -0.0007350052426389198,
																"dt": -0.6238317412634897
															},
															"nextHandle": {
																"dv": -0.0007350052426389198,
																"dt": 1.65720187755492
															}
														},
														{
															"time": 2.9435429106335573,
															"value": 0,
															"prevHandle": {
																"dv": 2.982275278784223,
																"dt": -0.08749748776511446
															},
															"nextHandle": {
																"dv": -1.2433789340742332,
																"dt": 0.038382536493231575
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
										},
										{
											"type": "polygon",
											"name": "TestBobineIridescentPurpleOK",
											"scaleX": 27,
											"scaleY": 27,
											"scaleZ": 27,
											"rotationZ": 45,
											"kind": 1,
											"args": [
												24,
												360,
												0,
												4
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
															"drawOrder": "100"
														}
													},
													"diffuseMap": "Fx/Gradients/T_Irridescent05.png",
													"refMatLib": ""
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.31,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/GradientBorder.png",
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.4,
														"saturation": 0.25,
														"width": 1,
														"uvScaleX": 10,
														"uvScaleY": 0.75,
														"texture": "Fx/noise/T_ElecNoise04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.36,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -16777216
																	},
																	{
																		"position": 0.03515625,
																		"color": -1
																	},
																	{
																		"position": 0.93359375,
																		"color": -1
																	},
																	{
																		"position": 0.98046875,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.32,
														"scrollSpeed": [
															0,
															-0.05
														],
														"scale": [
															3,
															0.25
														]
													}
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/Alphas/TS_Dust_01_1024.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															-0.5
														],
														"scale": [
															2,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															0
														],
														"scale": [
															2,
															1
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.6120540685675593,
															"value": 0.004783363236627203,
															"prevHandle": {
																"dv": -0.7858060700381525,
																"dt": -0.08074978007894783
															},
															"nextHandle": {
																"dv": 2.967195628554196,
																"dt": 0.3036709244144016
															}
														},
														{
															"time": 1.1185495537537118,
															"value": 3,
															"prevHandle": {
																"dv": 0.0064309020734008016,
																"dt": -0.39116165291694815
															},
															"nextHandle": {
																"dv": -1.594567953166881e-16,
																"dt": 0.261785888613747
															}
														},
														{
															"time": 1.4540033699764876,
															"value": 3,
															"mode": 1,
															"prevHandle": {
																"dv": -0.0007350052426389198,
																"dt": -0.6238317412634897
															},
															"nextHandle": {
																"dv": -0.0007350052426389198,
																"dt": 1.65720187755492
															}
														},
														{
															"time": 2.9435429106335573,
															"value": 0,
															"prevHandle": {
																"dv": 2.982275278784223,
																"dt": -0.08749748776511446
															},
															"nextHandle": {
																"dv": -1.2433789340742332,
																"dt": 0.038382536493231575
															}
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
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.001,
												"useRGB": false
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.y",
									"keyMode": 1,
									"keys": [
										{
											"time": 2.366759799997632,
											"value": 1,
											"prevHandle": {
												"dv": -0.23546337178162635,
												"dt": -0.38226003768184064
											},
											"nextHandle": {
												"dv": 0.31340622058197787,
												"dt": 0.5072663782977305
											}
										},
										{
											"time": 2.955664536813441,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 1.064723911078553,
												"dt": -0.10166138813049308
											},
											"nextHandle": {
												"dv": -0.31233769495109115,
												"dt": -0.2592781295281784
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.49019607843137253,
											0.1764705882352941,
											0.7529411764705882
										]
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Poteau_lights",
							"enabled": false,
							"x": -5.94508,
							"y": 10.49755,
							"z": 10.73716,
							"scaleX": 1.75,
							"scaleY": 1.75,
							"scaleZ": 1.75,
							"rotationY": -89.99999999999999,
							"children": [
								{
									"type": "object",
									"name": "MagneticFieldTest",
									"x": 6.22648,
									"y": -0.01191,
									"z": -3.51628,
									"scaleX": 0.06,
									"scaleY": 0.06,
									"scaleZ": 0.06,
									"rotationY": 89.99999999999999,
									"children": [
										{
											"type": "polygon",
											"name": "lighttrou",
											"scaleX": 45,
											"scaleY": 45,
											"scaleZ": 45,
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
															"emissive": 15,
															"drawOrder": "120"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"refMatLib": ""
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_circle2.png",
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
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.5693406515968814,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.17417503586800573
																	}
																},
																{
																	"time": 0.7288582709414004,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3.9611889787119265,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 4.506907150153704,
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
											"type": "polygon",
											"name": "TestBobine",
											"scaleX": 20,
											"scaleY": 20,
											"scaleZ": 20,
											"kind": 1,
											"args": [
												24,
												360,
												0,
												4
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
															"emissive": 15
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"refMatLib": ""
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.36,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl16u_A01.png",
														"uvShift": [
															0,
															0.05
														],
														"uvShiftSpeed": [
															1,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.33725490196078434,
															0.27058823529411763,
															0.984313725490196
														]
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -13754522
																	},
																	{
																		"position": 0.5390625,
																		"color": -12444212
																	},
																	{
																		"position": 1,
																		"color": -5276929
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/Water_03.png",
														"directionalNoise": false,
														"intensity": 0.1,
														"scrollSpeed": [
															1,
															0
														],
														"scale": [
															1,
															0.25
														]
													}
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_ElecNoise01.png",
														"directionalNoise": false,
														"intensity": 0.14,
														"scrollSpeed": [
															1,
															0
														],
														"scale": [
															1,
															0.25
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.005529415846088007,
																		"dt": -0.4999173758566614
																	},
																	"nextHandle": {
																		"dv": 0.004184100418410053,
																		"dt": 0.3782867050905856
																	}
																},
																{
																	"time": 0.7288582709414004,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3.9611889787119265,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 4.506907150153704,
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
											"type": "polygon",
											"name": "TestBobine",
											"scaleX": 19.999999999999996,
											"scaleY": 19.999999999999996,
											"scaleZ": 20,
											"rotationZ": -117.2951722981503,
											"kind": 1,
											"args": [
												24,
												360,
												0,
												4
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
															"emissive": 16
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"refMatLib": ""
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl16u_A01.png",
														"uvShift": [
															0,
															0.05
														],
														"uvShiftSpeed": [
															1,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.33725490196078434,
															0.27058823529411763,
															0.984313725490196
														]
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -13754522
																	},
																	{
																		"position": 0.5390625,
																		"color": -12444212
																	},
																	{
																		"position": 1,
																		"color": -5276929
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/Alphas/TS_Dust_01_1024.png",
														"directionalNoise": false,
														"intensity": 0.64,
														"scrollSpeed": [
															0,
															0
														],
														"scale": [
															2,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.005529415846088007,
																		"dt": -0.4999173758566614
																	},
																	"nextHandle": {
																		"dv": 0.004184100418410053,
																		"dt": 0.3782867050905856
																	}
																},
																{
																	"time": 0.7288582709414004,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3.9611889787119265,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 4.506907150153704,
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
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.8
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
											0.27058823529411763,
											0.984313725490196
										]
									}
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.9,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keys": [
										{
											"time": 2.814391906921655,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.851361547918182,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "flare",
							"enabled": false,
							"x": 0.18725,
							"y": 10.49755,
							"z": 26.12737,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_flareRound",
									"props": {
										"lifeTime": 0.1,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"emitType": "Burst",
										"burstDelay": 0.15,
										"instScale": 65,
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 1.5,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"emitAngle": 109.09,
										"warmUpTime": -2.85,
										"instOffset": [
											0,
											0,
											10
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
									"scaleX": 0.15625,
									"scaleY": 0.15625,
									"scaleZ": 0.15625,
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
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 5,
															"drawOrder": "120"
														}
													},
													"diffuseMap": "Fx/Gradients/T_circleGradient_color.png",
													"refMatLib": ""
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
														"alpha": 0.75,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_LensFlare_Double.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3333333333333333
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "GradientMapLife",
													"source": "hrt.shader.GradientMapLife",
													"enabled": false,
													"props": {
														"destAlpha": true,
														"sourceAlpha": false,
														"colorMult": false,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -100698849
																	},
																	{
																		"position": 1,
																		"color": -9088810
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.5,
														"color": [
															0.4588235294117647,
															0.3137254901960784,
															0.8392156862745098
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0,
															0,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.49,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5,
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
											"type": "curve",
											"name": "instScale",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.49516908212560384,
													"value": 1
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.x",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.49516908212560384,
													"value": 1
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_flare",
									"props": {
										"lifeTime": 0.15,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"emitType": "Burst",
										"burstDelay": 0.15,
										"instScale": 20,
										"instStretch": [
											30,
											1,
											2
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											2,
											0,
											0
										],
										"instScale_rand": 1.5,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"emitAngle": 109.09,
										"warmUpTime": -2.8,
										"instOffset": [
											0,
											0,
											10
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
									"scaleX": 0.15625,
									"scaleY": 0.15625,
									"scaleZ": 0.15625,
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
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"refMatLib": ""
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
														"texture": "Fx/Alphas/T_Flare06_512.png"
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
																	"time": 0.49516908212560384,
																	"value": 1
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3333333333333333
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "GradientMapLife",
													"source": "hrt.shader.GradientMapLife",
													"props": {
														"destAlpha": true,
														"sourceAlpha": false,
														"colorMult": false,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -100698849
																	},
																	{
																		"position": 1,
																		"color": -9088810
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.4588235294117647,
															0.3137254901960784,
															0.8392156862745098
														]
													}
												},
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
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.49,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5,
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
											"type": "curve",
											"name": "instStretch.x",
											"enabled": false,
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
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
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
													"mode": 2
												},
												{
													"time": 0.49516908212560384,
													"value": 1
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": -0.00038720845481055033,
														"dt": -0.9565399330463891
													},
													"nextHandle": {
														"dv": -1.244283992719687e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.x",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": -0.00038720845481055033,
														"dt": -0.9565399330463891
													},
													"nextHandle": {
														"dv": -1.244283992719687e-16,
														"dt": 0.3333333333333333
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
													"time": 0.49516908212560384,
													"value": 1
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
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
							"time": 0.6932066601149726,
							"value": 0,
							"mode": 2
						},
						{
							"time": 0.7530765550105453,
							"value": 0.15,
							"mode": 2
						},
						{
							"time": 1.0928487249832746,
							"value": 0,
							"prevHandle": {
								"dv": 0.0006031266494891385,
								"dt": -0.2863580167912272
							},
							"nextHandle": {
								"dv": -6.104422670336903e-17,
								"dt": 0.9537055144886902
							}
						},
						{
							"time": 2.990930191350537,
							"value": 0,
							"mode": 2
						},
						{
							"time": 3.0222929605405495,
							"value": 0.6,
							"mode": 2
						},
						{
							"time": 3.5198671872768266,
							"value": 0,
							"prevHandle": {
								"dv": -0.001444700628152773,
								"dt": -0.49008878203386885
							},
							"nextHandle": {
								"dv": -1.2320442111068783e-16,
								"dt": 0.7156584198232756
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Screenshake",
					"z": 2.9605947323337505e-15,
					"scaleX": 1.25,
					"scaleY": 1.25,
					"scaleZ": 1.25,
					"children": [
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
								"warmUpTime": -2.85,
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instOffset": [
									0,
									0,
									25
								],
								"lifeTime": 0.6,
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
							"z": 14.644566666666666,
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
											"diffuseMap": "Fx/noise/causticTexture_03-2.png",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/water-normal.png",
												"intensity": 0.02
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
																"dv": 0.0029108934340905668,
																"dt": -0.40272583723073996
															},
															"nextHandle": {
																"dv": -0.0027506460569236874,
																"dt": 0.2385143412393262
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
															"time": 0.25,
															"value": 0.9422222222222223,
															"prevHandle": {
																"dv": 0.09102052419023271,
																"dt": -0.01829386827310659
															},
															"nextHandle": {
																"dv": -0.5400335200143969,
																"dt": 0.10884414720290858
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0.0003032919645534968,
																"dt": -0.2601608323100526
															},
															"nextHandle": {
																"dv": -3.0079485124649254e-16,
																"dt": 0.43320966494492386
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
											"time": 0,
											"value": 0,
											"prevHandle": {
												"dv": -1.1362799378458945,
												"dt": -0.1723985202406926
											},
											"nextHandle": {
												"dv": 0.467752112597416,
												"dt": 0.07096736106040265
											}
										},
										{
											"time": 1,
											"value": 1,
											"prevHandle": {
												"dv": 0.01291915774627067,
												"dt": -0.903686980055574
											},
											"nextHandle": {
												"dv": -0.005277483683615265,
												"dt": 0.33474125450695746
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "subFX",
					"name": "VerniusFregate_Teleport_Top",
					"source": "Fx/Vehicle/Ships/Vernius/FX_VerniusFrigate_Teleport_Top.fx",
					"time": 2.8072650847011933,
					"children": [
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 2.9254025645250676,
									"value": 1,
									"mode": 2
								},
								{
									"time": 2.9560697094318114,
									"value": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.010222381635581238
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.012912482065996933
									}
								},
								{
									"time": 2.9948071556298026,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Flash_in",
					"z": 2,
					"scaleX": 5,
					"scaleY": 5,
					"scaleZ": 5,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"z": 12,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon-flareish",
									"scaleX": 4,
									"scaleY": 17,
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
													"emissive": 15
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
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
												"texture": "Fx/Alphas/DustMask.png"
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
												"progress": 0.17,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/NoisyWave_01.png",
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
											"name": "DissolveMap_Dust",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 0.95,
												"uvScaleX": 3,
												"uvScaleY": 3.5,
												"texture": "Fx/Alphas/Dust06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 2.9606312651739555,
															"value": 0.4,
															"mode": 2
														},
														{
															"time": 4.6067699556591455,
															"value": 0,
															"prevHandle": {
																"dv": -0.00015938801925508006,
																"dt": -1.4030847960428652
															},
															"nextHandle": {
																"dv": -7.170406910383684e-17,
																"dt": 0.5588339966484892
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 3.0918889347867817,
													"value": 0,
													"prevHandle": {
														"dv": -1.9310971472661906,
														"dt": -0.17120587028031628
													},
													"nextHandle": {
														"dv": 0.794995631561622,
														"dt": 0.07238914098793658
													}
												},
												{
													"time": 3.45072580120915,
													"value": 1,
													"prevHandle": {
														"dv": 0.0683347894794597,
														"dt": -0.4378116347358676
													},
													"nextHandle": {
														"dv": -0.05190948879585082,
														"dt": 0.3333275426476711
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
													0.3333333333333333,
													0.2196078431372549,
													0.8274509803921568
												]
											}
										},
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
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "TestElec1",
					"enabled": false,
					"z": 2.23765,
					"scaleX": 20,
					"scaleY": 20,
					"scaleZ": 20,
					"children": [
						{
							"type": "object",
							"name": "ElecSides",
							"z": 0.37996,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"rotationZ": -12.6,
							"children": [
								{
									"type": "model",
									"name": "Electricity_single",
									"source": "Fx/Meshes_Common/Electricity_single.fbx",
									"x": 0.25114,
									"y": -0.07108,
									"z": 1.10808,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.06,
									"rotationX": 84.7,
									"rotationZ": 75.3,
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
													"emissive": 5,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": true,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
												"speed": 10,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 2.2036156225484955,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.385710070014926,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.5193451721036375,
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
									"name": "Electricity_single",
									"source": "Fx/Meshes_Common/Electricity_single.fbx",
									"x": 0.09774,
									"y": 0.16233,
									"z": 1.20401,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": 71.5,
									"rotationY": -3,
									"rotationZ": 145,
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
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": true,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
												"speed": 10,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 2.2036156225484955,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.385710070014926,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.5193451721036375,
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
									"name": "Electricity_single",
									"source": "Fx/Meshes_Common/Electricity_single.fbx",
									"x": -0.1237,
									"y": -0.1488,
									"z": 1.32101,
									"scaleX": 0.1,
									"scaleY": 0.08,
									"scaleZ": 0.08,
									"rotationX": 72.8,
									"rotationZ": -17.3,
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
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": true,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
												"speed": 15,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 2.1651895674923662,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.344219006305985,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.4778541083946974,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.6142794426622107,
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
									"name": "Electricity_single",
									"source": "Fx/Meshes_Common/Electricity_single.fbx",
									"x": -0.07511,
									"y": 0.01658,
									"z": 0.90006,
									"scaleX": 0.15,
									"scaleY": 0.15,
									"scaleZ": 0.15,
									"rotationX": 69.9,
									"rotationY": -1.5,
									"rotationZ": -118.6,
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
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": true,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
												"speed": 15,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 1.2999293511252927,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4872084516083217,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5957311627235438,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.091430122477364,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.252638571318667,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3862736734073806,
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
									"name": "Electricity_single",
									"source": "Fx/Meshes_Common/Electricity_single.fbx",
									"x": 0.10041,
									"y": -0.1832,
									"z": 1.288,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": 73.2,
									"rotationY": -2.1,
									"rotationZ": 15,
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
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": true,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
												"speed": 15,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 1.673300511980488,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.829750712854317,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9470883635096894,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.326677135794217,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.506594866799119,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.6317550274981776,
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
					"type": "advancedDecal",
					"name": "advancedDecalLight",
					"enabled": false,
					"z": 18.02059,
					"scaleX": 25,
					"scaleY": 25,
					"scaleZ": 38,
					"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
					"fadeStart": 0.5,
					"emissive": 5,
					"renderMode": "BeforeTonemapping",
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
									"emissive": 4
								}
							},
							"refMatLib": ""
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0.673842234779676,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.7513081376609858,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 0.8213963355059802,
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
									0.6823529411764706,
									0.4666666666666667,
									1
								]
							}
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.85,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				},
				{
					"type": "object",
					"name": "BlackHole",
					"x": -0.08568,
					"y": 0.0782,
					"z": 37.46829,
					"scaleX": 0.75,
					"scaleY": 0.75,
					"scaleZ": 0.75,
					"children": [
						{
							"type": "emitter",
							"name": "emitter_Anticipation",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"lifeTime": 0.45,
								"lifeTimeRand": 0.05,
								"maxCount": 10,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationLoop": false,
								"instScale": 4,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_03.png",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 1,
								"animationBlendBetweenFrames": false,
								"emitRate": 6,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitAngle": 360,
								"emitSurface": true,
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
							"x": 0.08567749999999999,
							"y": -0.07819999999999996,
							"z": 0.09918499999999852,
							"scaleX": 5.75,
							"scaleY": 5.75,
							"scaleZ": 5.75,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
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
													"emissive": 4,
													"drawOrder": "120"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
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
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
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
													"keys": [
														{
															"time": 0.24726183384056316,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3176167024895698,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3845396263264298,
															"value": 1
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
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
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -18584
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0029516808402804268,
											"value": 0,
											"prevHandle": {
												"dv": 4.50028009560539e-17,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": -0.0010217117936646147,
												"dt": 0.3284136699352055
											}
										},
										{
											"time": 0.309665009285228,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.5310323319053161,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7002151315689066,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter_SlideVertical",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"lifeTime": 0.4,
								"lifeTimeRand": 0.05,
								"maxCount": 40,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationLoop": false,
								"instScale": 4.75,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_03.png",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 1,
								"animationBlendBetweenFrames": false,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitShape": "Cylinder",
								"emitAngle": 360,
								"emitSurface": true,
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
							"x": 0.08567749999999999,
							"y": -0.07819999999999996,
							"z": 0.25,
							"scaleX": 7.5,
							"scaleY": 7.5,
							"scaleZ": 3.5,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
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
													"emissive": 5,
													"drawOrder": "120"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
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
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
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
													"keys": [
														{
															"time": 0.24726183384056316,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3176167024895698,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3845396263264298,
															"value": 1
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
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
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -18584
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 1.5277517229373696,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.49591529273405,
											"value": 1.5,
											"mode": 2
										},
										{
											"time": 2.5469416346775775,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "TestELECtop",
							"enabled": false,
							"x": -0.2570325,
							"y": 0.2345999999999999,
							"z": -0.4274950000000004,
							"children": [
								{
									"type": "polygon",
									"name": "TestAnimelecfil",
									"x": -1.76677,
									"y": -4.20393,
									"z": 0.64051,
									"scaleX": 7.000000000000001,
									"scaleY": 7.000000000000001,
									"scaleZ": 7.000000000000002,
									"rotationX": -90,
									"rotationY": -50,
									"rotationZ": 52,
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
													"emissive": 4,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": false,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_4x2_05.png",
												"speed": 15,
												"frameDivision": [
													4,
													2
												],
												"totalFrames": 6,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0.18359375,
																"color": -9741057
															},
															{
																"position": 0.44140625,
																"color": -16735241
															},
															{
																"position": 0.8203125,
																"color": 4278232055
															},
															{
																"position": 0.90234375,
																"color": -15400929
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -18584
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "TestAnimelecfil",
									"x": -2.74545,
									"y": 4.56893,
									"z": 2.20326,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
									"rotationX": -90,
									"rotationY": 49.3,
									"rotationZ": 128.8,
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
													"emissive": 4,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": false,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_4x2_05.png",
												"speed": 15,
												"frameDivision": [
													4,
													2
												],
												"totalFrames": 6,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0.18359375,
																"color": -9741057
															},
															{
																"position": 0.44140625,
																"color": -16735241
															},
															{
																"position": 0.8203125,
																"color": 4278232055
															},
															{
																"position": 0.90234375,
																"color": -15400929
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -18584
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "TestAnimelecfil",
									"x": 5.60962,
									"y": -0.31408,
									"z": 0.46875,
									"scaleX": 6.000000000000001,
									"scaleY": 4.000000000000001,
									"scaleZ": 6.000000000000002,
									"rotationX": -90,
									"rotationY": 54.2,
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
													"emissive": 4,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": false,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_4x2_05.png",
												"speed": 15,
												"frameDivision": [
													4,
													2
												],
												"totalFrames": 6,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0.18359375,
																"color": -9741057
															},
															{
																"position": 0.44140625,
																"color": -16735241
															},
															{
																"position": 0.8203125,
																"color": 4278232055
															},
															{
																"position": 0.90234375,
																"color": -15400929
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -18584
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
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
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl05v_A.png",
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
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7321519314379334,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7985620997281447,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.9804956448403526,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 2.0980996620569945,
													"value": 1,
													"mode": 2
												},
												{
													"time": 15,
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
							"type": "lookAt",
							"name": "lookAt",
							"x": 0.08567749999999999,
							"y": -0.07819999999999996,
							"z": -0.09878499999999946,
							"scaleX": 2.085284008783248,
							"scaleY": 2.085284008783248,
							"scaleZ": 2.085284008783249,
							"rotationX": -1.1399998289276966e-16,
							"rotationY": -29.324175005386568,
							"rotationZ": -178.03659692883085,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"x": -0.5,
									"scaleX": 4,
									"scaleY": 4,
									"scaleZ": 4,
									"rotationX": -90,
									"rotationZ": -90,
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
													"emissive": 1,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
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
												"texture": "Fx/Alphas/T_circle.png"
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -12844844
															},
															{
																"position": 1,
																"color": -3689985
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.5,
												"maxAlpha": 1,
												"frequency": 2
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "Sphere",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"rotationX": -90,
									"rotationZ": -90,
									"kind": 0,
									"args": [
										8
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
													"emissive": 1,
													"drawOrder": "110"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
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
												"texture": "Fx/Alphas/T_UI_Round_128.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.050980392156862744,
													0.027450980392156862,
													0.10196078431372549
												]
											}
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													0.75,
													0.75
												],
												"alpha": 2,
												"MULTIPLY": false,
												"color": [
													0.4235294117647059,
													0.19607843137254902,
													1,
													1
												],
												"mask": "Fx/Alphas/glow (129).png",
												"UVOffset": [
													0.165,
													0.165
												]
											}
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 0.23,
												"scrollSpeed": [
													0,
													2
												],
												"scale": [
													1,
													0.75
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keys": [
														{
															"time": 1.3407799242764677,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.7781039360771653,
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
									"type": "curve",
									"name": "scale",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.41717379906809954,
											"value": 0,
											"prevHandle": {
												"dv": -0.03467354713704517,
												"dt": -0.4999305700197999
											},
											"nextHandle": {
												"dv": 0.009002752680527859,
												"dt": 0.2596072020860385
											}
										},
										{
											"time": 0.6952152116933903,
											"value": 0.9732427100774028,
											"mode": 1,
											"prevHandle": {
												"dv": -0.19578934715290008,
												"dt": -0.04207741029837353
											},
											"nextHandle": {
												"dv": 1.4296492847548923,
												"dt": 0.008121495161251935
											}
										},
										{
											"time": 1.034659583923614,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": 0.00022767763793574147,
												"dt": -0.2565051722404734
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.723751679693135
											}
										},
										{
											"time": 2.729251423862477,
											"value": 2.998333088374619,
											"mode": 1,
											"prevHandle": {
												"dv": 0.0063993466564054025,
												"dt": -1.095633183250581
											},
											"nextHandle": {
												"dv": 1.0821136124510464,
												"dt": 0.042576782291535054
											}
										},
										{
											"time": 2.825360598595051,
											"value": 3,
											"mode": 1,
											"prevHandle": {
												"dv": 1.2795378435758282,
												"dt": -0.03831143837279338
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.03106428135193055
											}
										},
										{
											"time": 2.9540805215778456,
											"value": 0,
											"prevHandle": {
												"dv": -0.008522390998625617,
												"dt": -0.1323299765843977
											},
											"nextHandle": {
												"dv": -3.9214043145503276e-16,
												"dt": 0.5
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
					"name": "EnergyIN",
					"z": 13.61021,
					"scaleX": 0.87,
					"scaleY": 0.87,
					"scaleZ": 0.87,
					"children": [
						{
							"type": "model",
							"name": "Disk_Tunnel_StraightUV",
							"source": "Fx/Meshes_Common/Disk_Tunnel_StraightUV.fbx",
							"scaleX": 2.01,
							"scaleY": 2.01,
							"scaleZ": 2.01,
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
											"colorMask": 255,
											"emissive": 1,
											"drawOrder": "110"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"refMatLib": "",
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
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
												"progress": 0.35,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.75,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													2
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
												"progress": 0.35,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl04v_A.jpg",
												"uvShift": [
													0.5,
													0.5
												],
												"uvShiftSpeed": [
													0,
													2
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/vGrad_inv.jpg",
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
															"time": 0.10235468707844532,
															"value": 0,
															"prevHandle": {
																"dv": -0.003508648383247387,
																"dt": -0.4999936232216757
															},
															"nextHandle": {
																"dv": 0.008383268754121598,
																"dt": 1.1965899333409389
															}
														},
														{
															"time": 1.9565587287287476,
															"value": 0.5,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6878212649401064
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.5667957511610338
															}
														},
														{
															"time": 3.3052736551797586,
															"value": 0,
															"prevHandle": {
																"dv": 0.03802499094424355,
																"dt": -0.6460112745905331
															},
															"nextHandle": {
																"dv": -0.03366262765780344,
																"dt": 0.4999723014707706
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
															"time": 0.09667114157210421,
															"value": 0,
															"prevHandle": {
																"dv": -0.003508648383247387,
																"dt": -0.4999936232216757
															},
															"nextHandle": {
																"dv": 0.008383268754121598,
																"dt": 1.1965899333409389
															}
														},
														{
															"time": 2.482921951957202,
															"value": 0.5,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6878212649401064
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.5667957511610338
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
													0.37254901960784315,
													0.7686274509803921,
													0.4156862745098039
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Disk_Tunnel_StraightUV_PURPLE",
							"source": "Fx/Meshes_Common/Disk_Tunnel_StraightUV.fbx",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
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
											"colorMask": 255,
											"emissive": 2,
											"drawOrder": "110"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"refMatLib": "",
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
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
												"progress": 0.35,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.75,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													2
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
												"progress": 0.35,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl04v_A.jpg",
												"uvShift": [
													0.5,
													0.5
												],
												"uvShiftSpeed": [
													0,
													2
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/vGrad_inv.jpg",
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
															"time": 0.10235468707844532,
															"value": 0,
															"prevHandle": {
																"dv": -0.003508648383247387,
																"dt": -0.4999936232216757
															},
															"nextHandle": {
																"dv": 0.008383268754121598,
																"dt": 1.1965899333409389
															}
														},
														{
															"time": 1.9565587287287476,
															"value": 0.5,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6878212649401064
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.5667957511610338
															}
														},
														{
															"time": 3.3052736551797586,
															"value": 0,
															"prevHandle": {
																"dv": 0.03802499094424355,
																"dt": -0.6460112745905331
															},
															"nextHandle": {
																"dv": -0.03366262765780344,
																"dt": 0.4999723014707706
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
															"time": 0.09667114157210421,
															"value": 0,
															"prevHandle": {
																"dv": -0.003508648383247387,
																"dt": -0.4999936232216757
															},
															"nextHandle": {
																"dv": 0.008383268754121598,
																"dt": 1.1965899333409389
															}
														},
														{
															"time": 2.482921951957202,
															"value": 0.5,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6878212649401064
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.5667957511610338
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
													0.2196078431372549,
													0.12941176470588234,
													0.2980392156862745
												]
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
								"alpha": 0.8
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 1.2763979239131433,
											"value": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.8257989381153953
											}
										},
										{
											"time": 3.753794738259329,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.40087070382828216,
											"value": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.8257989381153953
											}
										},
										{
											"time": 1.6024081885013834,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaKill",
							"source": "shaders/AlphaKill.hx",
							"props": {
								"threshold": 0.001,
								"useRGB": false
							}
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Teleport.MESH.Fregate+lights.LIGHTS",
					"target": "FXAnimation.FXRoot.Teleport.MESH.Fregate+lights.FolderRelay.root.JNT_Root"
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"enabled": false,
					"scaleX": 209,
					"scaleY": 209,
					"scaleZ": 209,
					"rotationZ": -52.27095572260782,
					"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
					"emissive": 0.5,
					"renderMode": "BeforeTonemapping"
				}
			]
		}
	]
}