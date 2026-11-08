{
	"type": "fx",
	"duration": 8,
	"cullingRadius": 1000,
	"blendFactor": 1,
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
			"z": 1,
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
							"enabled": false,
							"x": 0.18724666666666662,
							"y": 10.497554999999998,
							"z": -9.900830166666665,
							"scaleX": 1.25,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"children": [
								{
									"type": "object",
									"name": "units",
									"enabled": false,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationZ": -93.3,
									"children": [
										{
											"type": "model",
											"name": "RailgunMESH",
											"source": "Vehicle/Vernius/DroneRailGun/DroneRailGun.fbx",
											"x": 29.85512,
											"y": 8.89955,
											"children": [
												{
													"type": "animEvent",
													"name": "animEvent",
													"enabled": false,
													"animation": "Anim/Siren/Anim_Siren_Run.fbx"
												}
											]
										},
										{
											"type": "model",
											"name": "RailgunMESH",
											"source": "Vehicle/Vernius/DroneRailGun/DroneRailGun.fbx",
											"x": 21.24313,
											"y": 21.09565,
											"children": [
												{
													"type": "animEvent",
													"name": "animEvent",
													"enabled": false,
													"animation": "Anim/Siren/Anim_Siren_Run.fbx"
												}
											]
										},
										{
											"type": "model",
											"name": "RailgunMESH",
											"source": "Vehicle/Vernius/DroneRailGun/DroneRailGun.fbx",
											"x": 11.1545,
											"y": 14.01241,
											"children": [
												{
													"type": "animEvent",
													"name": "animEvent",
													"enabled": false,
													"animation": "Anim/Siren/Anim_Siren_Run.fbx"
												}
											]
										},
										{
											"type": "model",
											"name": "RailgunMESH",
											"source": "Vehicle/Vernius/DroneRailGun/DroneRailGun.fbx",
											"x": -14.55058,
											"y": -28.26314,
											"children": [
												{
													"type": "animEvent",
													"name": "animEvent",
													"enabled": false,
													"animation": "Anim/Siren/Anim_Siren_Run.fbx"
												},
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 4.1206807929699565,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.130680792969956,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 4.295497469960838,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.305497469960838,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "object",
											"name": "TESTLIghts",
											"x": 11.928565000000003,
											"y": 6.409482499999998,
											"z": 0.2632599999999996,
											"children": [
												{
													"type": "advancedDecal",
													"name": "advancedDecalLight",
													"x": -26.446625000000004,
													"y": -32.1373025,
													"z": 3.3306690738754696e-16,
													"scaleX": 3.5,
													"scaleY": 5.5,
													"scaleZ": 0.9999999999999999,
													"rotationZ": -4.543649544947881e-16,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"fadePower": 2,
													"fadeStart": 1,
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
																	"emissive": 1
																}
															},
															"refMatLib": ""
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "advancedDecalLight",
													"x": -0.8221450000000043,
													"y": 9.927527500000002,
													"z": 2.220446049250313e-16,
													"scaleX": 3.5,
													"scaleY": 5.5,
													"scaleZ": 0.9999999999999998,
													"rotationZ": -9.087299089895762e-16,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"fadePower": 2,
													"fadeStart": 1,
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
																	"emissive": 1
																}
															},
															"refMatLib": ""
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"enabled": false,
															"props": {
																"alpha": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 2,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.9935192485840106
																			}
																		},
																		{
																			"time": 4.144592034032261,
																			"value": 0.75,
																			"mode": 2
																		},
																		{
																			"time": 4.257048603425411,
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
															"enabled": false,
															"props": {
																"amount": 1,
																"color": [
																	0.6823529411764706,
																	0.4666666666666667,
																	1
																]
															}
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "advancedDecalLight",
													"x": 9.342214999999996,
													"y": 17.1687175,
													"z": 2.220446049250313e-16,
													"scaleX": 3.5,
													"scaleY": 5.5,
													"scaleZ": 0.9999999999999998,
													"rotationZ": -9.087299089895762e-16,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"fadePower": 2,
													"fadeStart": 1,
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
																	"emissive": 1
																}
															},
															"refMatLib": ""
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "advancedDecalLight",
													"x": 17.926554999999993,
													"y": 5.041057500000003,
													"z": 2.220446049250313e-16,
													"scaleX": 3.5,
													"scaleY": 5.5,
													"scaleZ": 0.9999999999999998,
													"rotationZ": -9.087299089895762e-16,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"fadePower": 2,
													"fadeStart": 1,
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
																	"emissive": 1
																}
															},
															"refMatLib": ""
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
																	"time": 1.2093194024077925,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.0012024596774301763,
																		"dt": -0.4999952741690807
																	},
																	"nextHandle": {
																		"dv": 0.0033783783783783994,
																		"dt": 1.4047649623928906
																	}
																},
																{
																	"time": 4.377492768369077,
																	"value": 0.75,
																	"mode": 2
																},
																{
																	"time": 4.4048853236948995,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "advancedDecalLight",
													"enabled": false,
													"x": 17.926554999999993,
													"y": 5.041057500000003,
													"z": 2.220446049250313e-16,
													"scaleX": 3.5,
													"scaleY": 5.5,
													"scaleZ": 0.9999999999999998,
													"rotationZ": -9.087299089895762e-16,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"fadePower": 2,
													"fadeStart": 1,
													"emissive": 10,
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
																	"emissive": 1
																}
															},
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
																"progress": 0.87,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Alphas/T_circle.png",
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
															0.6196078431372549,
															0.38823529411764707,
															0.8588235294117647
														]
													}
												}
											]
										}
									]
								},
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
													"animation": "Anim/FolderRelay/Anim_FolderRelay_Skill.fbx"
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															1,
															0,
															0
														]
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 4.239186294954809,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.249186294954809,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "object",
											"name": "LIGHTS",
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
																			"time": 2.99,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 3,
																			"mode": 2
																		},
																		{
																			"time": 4,
																			"value": 3,
																			"mode": 2
																		},
																		{
																			"time": 4.01,
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
																			"time": 0.33088171333748917,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.33076511478532,
																			"value": 0.970407296131008,
																			"mode": 0,
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
																			"time": 1.33076511478532,
																			"value": 0.970407296131008,
																			"mode": 0,
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
															"keys": [
																{
																	"time": 4.215074536457805,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 4.252044177454332,
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
							"scaleX": 0.4,
							"scaleY": 0.4,
							"scaleZ": 0.4,
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
																			"time": 1.3290827513257968,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.05058585532241985,
																				"dt": -0.4998400301002167
																			},
																			"nextHandle": {
																				"dv": -0.20258151536086189,
																				"dt": 2.221031769008843
																			}
																		},
																		{
																			"time": 5.5536508337611155,
																			"value": 7,
																			"mode": 0,
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
																			"time": 1.3290827513257968,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.05058585532241985,
																				"dt": -0.4998400301002167
																			},
																			"nextHandle": {
																				"dv": -0.20258151536086189,
																				"dt": 2.221031769008843
																			}
																		},
																		{
																			"time": 5.5536508337611155,
																			"value": 8,
																			"mode": 0,
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
																			"time": 1.5373267051096555,
																			"value": 0,
																			"mode": 0,
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
																			"time": 3.3915307467599556,
																			"value": 0.5,
																			"mode": 0,
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
											"type": "model",
											"name": "DiskFlatStraight01_MoreVrtx",
											"source": "Fx/Meshes_Common/Disk_SpiraleUV01.fbx",
											"enabled": false,
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
																"alpha": 5,
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
																			"time": 1.3290827513257968,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.05058585532241985,
																				"dt": -0.4998400301002167
																			},
																			"nextHandle": {
																				"dv": -0.20258151536086189,
																				"dt": 2.221031769008843
																			}
																		},
																		{
																			"time": 5.5536508337611155,
																			"value": 8,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -4.645006201900809,
																				"dt": -0.35362085489957007
																			},
																			"nextHandle": {
																				"dv": 5.285632981690511,
																				"dt": 0.40193481715093615
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
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 1.5373267051096555,
																			"value": 0,
																			"mode": 0,
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
																			"time": 3.3915307467599556,
																			"value": 0.5,
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
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.5,
														"power": 0.8
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
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 4.141657779088773,
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
													"time": 4.347611682113888,
													"value": 0,
													"mode": 0,
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
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.2763979239131433,
															"value": 0,
															"mode": 0,
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
															"drawOrder": "100",
															"emissive": 0.2
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
															"time": 3.6120271241268926,
															"value": 0.004783363236627203,
															"mode": 0,
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
															"time": 4.141657779088773,
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
															"time": 4.347611682113888,
															"value": 0,
															"mode": 0,
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
																	"time": 3.819582372316949,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 4.012558373029264,
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
															"drawOrder": "100",
															"emissive": 1
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
															"time": 0.840839097083335,
															"value": 0.004783363236627203,
															"mode": 0,
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
															"time": 1.3473345822694875,
															"value": 3,
															"mode": 0,
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
															"time": 2.8306939592041367,
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
															"time": 4.34755238870754,
															"value": 0,
															"mode": 0,
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
											"enabled": false,
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
															"drawOrder": "100",
															"emissive": 1
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
													"enabled": false,
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.11,
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
													"enabled": false,
													"props": {
														"noiseTexture": "Fx/Alphas/TS_Dust_01_1024.png",
														"directionalNoise": false,
														"intensity": 0.1,
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
														"intensity": 0.1,
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
															"time": 0.840839097083335,
															"value": 0.004783363236627203,
															"mode": 0,
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
															"time": 1.3473345822694875,
															"value": 3,
															"mode": 0,
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
															"time": 2.8306939592041367,
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
															"time": 4.34755238870754,
															"value": 0,
															"mode": 0,
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
															"drawOrder": "100",
															"emissive": 0.5
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
															"time": 0.840839097083335,
															"value": 0.004783363236627203,
															"mode": 0,
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
															"time": 1.3473345822694875,
															"value": 3,
															"mode": 0,
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
															"time": 2.8306939592041367,
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
															"time": 4.34755238870754,
															"value": 0,
															"mode": 0,
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
											"time": 3.767442429533782,
											"value": 1,
											"mode": 0,
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
											"time": 4.3563471663495905,
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
									"x": 6.30103,
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
																	"time": 0.8563577459547873,
																	"value": 0,
																	"mode": 0,
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
																	"time": 1.0158753652993064,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 4.248206073069827,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 4.7939242445116035,
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
																	"mode": 0,
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
																	"time": 1.0158753652993064,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 4.248206073069827,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 4.7939242445116035,
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
																	"mode": 0,
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
																	"time": 1.0158753652993064,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 4.248206073069827,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 4.7939242445116035,
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
											"time": 4.215074536457805,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.252044177454332,
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
							"z": 25,
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
										"warmUpTime": -4.25,
										"instOffset": [
											0,
											0,
											10
										]
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
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
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
													"value": 1,
													"mode": 0
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
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
													"value": 1,
													"mode": 0
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
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
										"warmUpTime": -4.2,
										"instOffset": [
											0,
											0,
											10
										]
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
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
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
													"mode": 0,
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
													"value": 1,
													"mode": 0
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
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
													"value": 1,
													"mode": 0
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
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
													"value": 1,
													"mode": 0
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
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
													"value": 1,
													"mode": 0
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
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
					"enabled": false,
					"keyMode": 0,
					"keys": [
						{
							"time": 0.9110708605533624,
							"value": 0,
							"mode": 2
						},
						{
							"time": 0.9709407554489351,
							"value": 0.15,
							"mode": 2
						},
						{
							"time": 1.3107129254216665,
							"value": 0,
							"mode": 0,
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
							"time": 4.41754542519591,
							"value": 0,
							"mode": 2
						},
						{
							"time": 4.448908194385923,
							"value": 0.6,
							"mode": 2
						},
						{
							"time": 4.946482421122196,
							"value": 0,
							"mode": 0,
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
					"enabled": false,
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
								"warmUpTime": -4.25,
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
								"lifeTime": 0.6
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
															"mode": 0,
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
															"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
					"enabled": false,
					"time": 4.21929,
					"children": [
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 4.324241981330155,
									"value": 1,
									"mode": 2
								},
								{
									"time": 4.354909126236898,
									"value": 0,
									"mode": 0,
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
									"time": 4.393646572434889,
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
					"enabled": false,
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
															"time": 4.350711536678784,
															"value": 0.4,
															"mode": 2
														},
														{
															"time": 5.99685022716398,
															"value": 0,
															"mode": 0,
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
													"time": 4.48196920629161,
													"value": 0,
													"mode": 0,
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
													"time": 4.840806072713978,
													"value": 1,
													"mode": 0,
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
															"time": 3.4465703927782037,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.628664840244634,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.7622999423333465,
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
															"time": 3.4465703927782037,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.628664840244634,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.7622999423333465,
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
															"time": 3.408144337722074,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.587173776535693,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.720808878624406,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.8572342128919197,
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
															"time": 1.9819674082622178,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.1418956141162298,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.250418325231452,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.3343848927070723,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.4955933415483753,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.6292284436370887,
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
															"time": 2.4640906637628053,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.6205408646366344,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.737878515292006,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.731337290840822,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.911255021845725,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.036415182544784,
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
											"time": 0.8558137842125675,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9332796870938773,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 1.0033678849388716,
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
					"enabled": false,
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
								"emitSurface": true
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
															"value": 1,
															"mode": 0
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
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
											"time": 0.09951929391975955,
											"value": 0,
											"mode": 0,
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
											"time": 0.4876445402068206,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7862024219660981,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9553852216296886,
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
								"emitSurface": true
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
															"value": 1,
															"mode": 0
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
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
											"time": 2.4,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3808502378075977,
											"value": 1.5,
											"mode": 2
										},
										{
											"time": 3.4191899117402165,
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
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
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
															"time": 0.9873220214987155,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.053732189788927,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 4.174459052941717,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 4.29206307015836,
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
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
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
															"time": 0.9873220214987155,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.053732189788927,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 4.174459052941717,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 4.29206307015836,
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
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
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
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9252885606735115,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3894674567538519,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.449481275444196,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.515891443734407,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 5.610284100833064,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 5.674774691392225,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.850716523642044,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.993784967428039,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 8.929091844729907,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 8.939091844729907,
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
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
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
															"time": 0.9873220214987155,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.053732189788927,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 4.174459052941717,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 4.29206307015836,
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
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
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
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9252885606735115,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3894674567538519,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.449481275444196,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.515891443734407,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 5.610284100833064,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 5.674774691392225,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.850716523642044,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.993784967428039,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 8.929091844729907,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 8.939091844729907,
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
													"time": 0.9873220214987155,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.053732189788927,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 3.2544447057394157,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 3.372048722956058,
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
													"emissive": 5,
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
															"time": 1.4743936131491153,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.195267656244331,
															"value": 1,
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
											"enabled": false,
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
												"texture": "Fx/Alphas/T_UI_Round_128.png"
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"enabled": false,
									"keyMode": 1,
									"keys": [
										{
											"time": 0.6723438891288815,
											"value": 0,
											"mode": 0,
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
											"time": 0.9503853017541724,
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
											"time": 1.2898296739843964,
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
											"time": 4.242524318762215,
											"value": 3,
											"mode": 1,
											"prevHandle": {
												"dv": 0.02214560941106214,
												"dt": -2.410030729710213
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.03106428135193055
											}
										},
										{
											"time": 4.376949400943577,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.2131326970824892
											},
											"nextHandle": {
												"dv": 0,
												"dt": -0.5
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.6723438891288815,
											"value": 0,
											"mode": 0,
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
											"time": 0.9503853017541724,
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
											"time": 1.2898296739843964,
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
											"time": 4.146415144029644,
											"value": 2.998333088374619,
											"mode": 1,
											"prevHandle": {
												"dv": 0.015050829936706478,
												"dt": -2.3142926361982497
											},
											"nextHandle": {
												"dv": 1.0821136124510464,
												"dt": 0.042576782291535054
											}
										},
										{
											"time": 4.242524318762215,
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
											"time": 4.376949400943577,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.2131326970824892
											},
											"nextHandle": {
												"dv": 0,
												"dt": -0.5
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
					"enabled": false,
					"z": 13.61021,
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
											"emissive": 4,
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
											},
											"children": [
												{
													"type": "curve",
													"name": "uvShift.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3290827513257968,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.05058585532241985,
																"dt": -0.4998400301002167
															},
															"nextHandle": {
																"dv": -0.20258151536086189,
																"dt": 2.221031769008843
															}
														},
														{
															"time": 5.5536508337611155,
															"value": 7,
															"mode": 0,
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
															"time": 1.3630795856161768,
															"value": 0,
															"mode": 0,
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
															"time": 3.2172836272664767,
															"value": 0.5,
															"mode": 0,
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
															"time": 4.565998553717479,
															"value": 0,
															"mode": 0,
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
											"emissive": 7,
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
											},
											"children": [
												{
													"type": "curve",
													"name": "uvShift.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3290827513257968,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.05058585532241985,
																"dt": -0.4998400301002167
															},
															"nextHandle": {
																"dv": -0.20258151536086189,
																"dt": 2.221031769008843
															}
														},
														{
															"time": 5.5536508337611155,
															"value": 7,
															"mode": 0,
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
											},
											"children": [
												{
													"type": "curve",
													"name": "uvShift.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3290827513257968,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.05058585532241985,
																"dt": -0.4998400301002167
															},
															"nextHandle": {
																"dv": -0.20258151536086189,
																"dt": 2.221031769008843
															}
														},
														{
															"time": 5.5536508337611155,
															"value": 8,
															"mode": 0,
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
															"time": 1.3630795856161768,
															"value": 0,
															"mode": 0,
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
															"time": 3.2172836272664767,
															"value": 0.5,
															"mode": 0,
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
															"time": 4.565998553717479,
															"value": 0,
															"mode": 0,
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
									"keyMode": 0,
									"keys": [
										{
											"time": 1.2763979239131433,
											"value": 0,
											"mode": 0,
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
					"type": "polygon",
					"name": "polygon",
					"enabled": false,
					"x": -13.40225,
					"z": 17.72541,
					"scaleX": 10,
					"scaleY": 5,
					"scaleZ": 10,
					"rotationY": 90,
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
									"colorMask": 255
								}
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