{
	"type": "fx",
	"duration": 5,
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
													"emissive": 10,
													"renderMode": "BeforeTonemapping",
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
																	"emissive": 2
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
																	"blend": "Add",
																	"shadows": false,
																	"culling": "Back",
																	"colorMask": 255,
																	"emissive": 2
																}
															},
															"refMatLib": ""
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
																	"blend": "Add",
																	"shadows": false,
																	"culling": "Back",
																	"colorMask": 255,
																	"emissive": 2
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
																	"blend": "Add",
																	"shadows": false,
																	"culling": "Back",
																	"colorMask": 255,
																	"emissive": 2
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
														"alpha": 2
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.2626750515771328,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.2864394328296088,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7997434902385065,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.003954335105800066,
																		"dt": -0.47936687087130886
																	},
																	"nextHandle": {
																		"dv": -0.004264020316916277,
																		"dt": 0.499978567907575
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
																	"time": 0.2626750515771328,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.2864394328296088,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7997434902385065,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.048924924419795734,
																		"dt": -0.5237526922482818
																	},
																	"nextHandle": {
																		"dv": -0.046593646788494564,
																		"dt": 0.4974344186453122
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
															0.6196078431372549,
															0.38823529411764707,
															0.8588235294117647
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
													"time": 0.26589462136333697,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.275894621363337,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "object",
											"name": "TESTcircle",
											"x": 11.911715000000004,
											"y": 6.122162500000003,
											"z": 0.5000000000000002,
											"children": [
												{
													"type": "polygon",
													"name": "TestBobineIridescentPurpleOK",
													"x": 17.87293499999999,
													"y": 5.153637499999998,
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
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
																	"drawOrder": "100",
																	"emissive": 2
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
																"progress": 0.31,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Alphas/glow (129).png",
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
																			"time": 0.3988522238163558,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.0563113558750326,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.0026192752475185377,
																				"dt": -1.2622530545170965
																			},
																			"nextHandle": {
																				"dv": -0.0002133911585406001,
																				"dt": 0.09693640999815065
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
																	"time": 0.1526843373220377,
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
																	"time": 0.6591798225081901,
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
																	"time": 2.1425391994428433,
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
																}
															]
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.25
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0.3988522238163558,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.5971723026634657,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.0026192752475185377,
																				"dt": -1.2622530545170965
																			},
																			"nextHandle": {
																				"dv": -0.0002133911585406001,
																				"dt": 0.09693640999815065
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
																	0.6196078431372549,
																	0.38823529411764707,
																	0.8588235294117647
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "TestBobineIridescentPurpleOK",
													"x": 9.230314999999989,
													"y": 17.032027499999998,
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
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
																	"drawOrder": "100",
																	"emissive": 2
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
																"progress": 0.31,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Alphas/glow (129).png",
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
																			"time": 0.3988522238163558,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.0563113558750326,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.0026192752475185377,
																				"dt": -1.2622530545170965
																			},
																			"nextHandle": {
																				"dv": -0.0002133911585406001,
																				"dt": 0.09693640999815065
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
																	"time": 0.1526843373220377,
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
																	"time": 0.6591798225081901,
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
																	"time": 2.1425391994428433,
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
																}
															]
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.25
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0.3988522238163558,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.5971723026634657,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.0026192752475185377,
																				"dt": -1.2622530545170965
																			},
																			"nextHandle": {
																				"dv": -0.0002133911585406001,
																				"dt": 0.09693640999815065
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
																	0.6196078431372549,
																	0.38823529411764707,
																	0.8588235294117647
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "TestBobineIridescentPurpleOK",
													"x": -0.7450050000000079,
													"y": 9.969877499999996,
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
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
																	"drawOrder": "100",
																	"emissive": 2
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
																"progress": 0.31,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Alphas/glow (129).png",
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
																			"time": 0.3988522238163558,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.0563113558750326,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.0026192752475185377,
																				"dt": -1.2622530545170965
																			},
																			"nextHandle": {
																				"dv": -0.0002133911585406001,
																				"dt": 0.09693640999815065
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
																	"time": 0.1526843373220377,
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
																	"time": 0.6591798225081901,
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
																	"time": 2.1425391994428433,
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
																}
															]
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.25
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0.3988522238163558,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.5971723026634657,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.0026192752475185377,
																				"dt": -1.2622530545170965
																			},
																			"nextHandle": {
																				"dv": -0.0002133911585406001,
																				"dt": 0.09693640999815065
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
																	0.6196078431372549,
																	0.38823529411764707,
																	0.8588235294117647
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "TestBobineIridescentPurpleOK",
													"x": -26.358245000000004,
													"y": -32.1555425,
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
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
																	"drawOrder": "100",
																	"emissive": 2
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
																"progress": 0.31,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Alphas/glow (129).png",
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
																			"time": 0.3988522238163558,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.0563113558750326,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.0026192752475185377,
																				"dt": -1.2622530545170965
																			},
																			"nextHandle": {
																				"dv": -0.0002133911585406001,
																				"dt": 0.09693640999815065
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
																	"time": 0.1526843373220377,
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
																	"time": 0.6591798225081901,
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
																	"time": 2.1425391994428433,
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
																}
															]
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.25
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0.3988522238163558,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.5971723026634657,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.0026192752475185377,
																				"dt": -1.2622530545170965
																			},
																			"nextHandle": {
																				"dv": -0.0002133911585406001,
																				"dt": 0.09693640999815065
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
																	0.6196078431372549,
																	0.38823529411764707,
																	0.8588235294117647
																]
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
							"type": "object",
							"name": "Area",
							"x": 0.18724666666666662,
							"y": 10.497554999999998,
							"z": 3.700201833333333,
							"scaleX": 0.45,
							"scaleY": 0.45,
							"scaleZ": 0.45,
							"children": [
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
											"enabled": false,
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
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
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
															"keys": [
																{
																	"time": 0.3988522238163558,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.0211547020070622,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.0012861924606340502,
																		"dt": -0.580586810265389
																	},
																	"nextHandle": {
																		"dv": -1.0511636903983809e-16,
																		"dt": 0.09693683677040633
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keys": [
																{
																	"time": 0.3988522238163558,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.0563113558750326,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.0026192752475185377,
																		"dt": -1.2622530545170965
																	},
																	"nextHandle": {
																		"dv": -0.0002133911585406001,
																		"dt": 0.09693640999815065
																	}
																}
															]
														}
													]
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
															"time": 0.1526843373220377,
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
															"time": 0.6591798225081901,
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
															"time": 2.1425391994428433,
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
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap_Dust",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 0.95,
														"uvScaleX": 32,
														"uvScaleY": 4,
														"texture": "Fx/Alphas/Dust06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.5
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keys": [
																{
																	"time": 0.40568125648179326,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 2.0518199469669893,
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
													"type": "shader",
													"name": "DissolveMap_Dust",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 0.95,
														"uvScaleX": 8,
														"uvScaleY": 1,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-1
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keys": [
																{
																	"time": 0.40568125648179326,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.6893104375007715,
																	"value": 1,
																	"prevHandle": {
																		"dv": -0.0016883487488373872,
																		"dt": -1.1703203417749015
																	},
																	"nextHandle": {
																		"dv": -1.015413788143061e-16,
																		"dt": 0.5588339966484892
																	}
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
											"scaleX": 22,
											"scaleY": 22,
											"scaleZ": 22,
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
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
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
																	"time": 0.3988522238163558,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3.0826983379044024,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.0026192752475185377,
																		"dt": -1.2622530545170965
																	},
																	"nextHandle": {
																		"dv": -0.0002133911585406001,
																		"dt": 0.09693640999815065
																	}
																}
															]
														}
													]
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
															"time": 0.1526843373220377,
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
															"time": 0.6591798225081901,
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
															"time": 3.168926181472213,
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
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap_Dust",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 0.95,
														"uvScaleX": 32,
														"uvScaleY": 4,
														"texture": "Fx/Alphas/Dust06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.5
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keys": [
																{
																	"time": 0.40568125648179326,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 3.078206928996359,
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
									"keyMode": 0,
									"keys": [
										{
											"time": 0.1526843373220377,
											"value": 0.004783363236627203,
											"prevHandle": {
												"dv": -0.7542866255588183,
												"dt": -0.087314465452155
											},
											"nextHandle": {
												"dv": 1.1949323338289695,
												"dt": 0.13754845742813285
											}
										},
										{
											"time": 0.6591798225081901,
											"value": 1.05,
											"prevHandle": {
												"dv": -0.04229885223798502,
												"dt": -0.4796113307922572
											},
											"nextHandle": {
												"dv": 0.020978164760408206,
												"dt": 0.26176870983060063
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "flare",
							"x": 0.18725,
							"y": 10.49755,
							"z": 5,
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
										"instScale": 75,
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
										"warmUpTime": -0.05,
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
								"warmUpTime": -0.2,
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
					"name": "VerniusFregate_Teleport_Bottom",
					"source": "Fx/Vehicle/Ships/Vernius/FX_VerniusFrigate_Teleport_Bottom.fx",
					"scaleX": 1.33,
					"scaleY": 1.33,
					"scaleZ": 1.33,
					"time": -0.026546842887164954,
					"children": [
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
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 1.3891263819271509,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1.3955724440242607,
									"value": 0,
									"mode": 2
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
							"time": 0.26581550974874646,
							"value": 0,
							"mode": 2
						},
						{
							"time": 0.322713106437962,
							"value": 0.6,
							"mode": 2
						},
						{
							"time": 0.8202873331742394,
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
					"name": "VerticalDust",
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
												"alpha": 4,
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
															"time": 0.041390773318290094,
															"value": 0.4,
															"mode": 2
														},
														{
															"time": 1.6875294638034841,
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
													"time": 0.17264844293111603,
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
													"time": 0.531485309353483,
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
					"z": 2.23765,
					"scaleX": 20,
					"scaleY": 20,
					"scaleZ": 20,
					"children": [
						{
							"type": "object",
							"name": "ElecSides",
							"z": 0.05,
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
															"time": 0.4946567585340591,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6767512060004893,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8103863080892018,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.317051472510199,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5149451239679073,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.6551197937504505,
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
															"time": 0.4946567585340591,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6767512060004893,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8103863080892018,
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
															"time": 1.460271734617636,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.6103264138732647,
															"value": 1.0033346036585367,
															"mode": 2
														},
														{
															"time": 1.726552606182905,
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
									"x": -0.27618,
									"y": 0.13086,
									"z": 1.05607,
									"scaleX": 0.12,
									"scaleY": 0.12,
									"scaleZ": 0.12,
									"rotationX": 82,
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
															"time": 0.3591227500092841,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5203311988505874,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6539663009393007,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5548517837072613,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.7307572516696685,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.854542580976548,
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
							"name": "emitter_FregateElec",
							"props": {
								"alignMode": "Screen",
								"lifeTime": 0.4,
								"lifeTimeRand": 0.05,
								"maxCount": 40,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationLoop": false,
								"instScale": 6,
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
								"emitRate": 11,
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
							"x": 0.08568,
							"y": -0.0782,
							"z": -26.52601,
							"scaleX": 17,
							"scaleY": 17,
							"scaleZ": 35,
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
											"time": 0.17648042353060178,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.41075971021831004,
											"value": 1.5,
											"mode": 2
										},
										{
											"time": 1.5141194859170637,
											"value": 0,
											"prevHandle": {
												"dv": -0.006957110650009146,
												"dt": -0.3344097655966156
											},
											"nextHandle": {
												"dv": 0.013520352727614635,
												"dt": 0.49994431761216657
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
					"name": "EnergyOUT",
					"z": 13.61021,
					"scaleX": 0.75,
					"scaleY": 0.75,
					"scaleZ": 0.75,
					"children": [
						{
							"type": "model",
							"name": "Disk_Tunnel_StraightUV",
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
												"progress": 0.3,
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
													-1
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
												"progress": 0.3,
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
													-1
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
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
															"time": 0.1928273263019493,
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
															"time": 2.0470313679522505,
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
															"time": 3.395746294403247,
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
												"progress": 0.85,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/vGrad.png",
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
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.1045974990207738e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": -0.00042520394624223634,
																"dt": 0.16263399032357118
															}
														},
														{
															"time": 0.22714662728347923,
															"value": 0.5,
															"prevHandle": {
																"dv": 0.10640259250587768,
																"dt": -0.04747435722294645
															},
															"nextHandle": {
																"dv": -0.31894501284413257,
																"dt": 0.14192780131179794
															}
														},
														{
															"time": 0.8,
															"value": 0,
															"prevHandle": {
																"dv": 0.0026099103345263996,
																"dt": -0.43008424639938747
															},
															"nextHandle": {
																"dv": -2.2091949980415477e-16,
																"dt": 0.5
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
															"value": 1,
															"prevHandle": {
																"dv": 0.8010947382467242,
																"dt": -0.28373645541197395
															},
															"nextHandle": {
																"dv": -0.3718592964824121,
																"dt": 0.13271162123385938
															}
														},
														{
															"time": 0.8,
															"value": 0,
															"prevHandle": {
																"dv": 0.010050251256281173,
																"dt": -0.49426111908177917
															},
															"nextHandle": {
																"dv": -0.010187087144130004,
																"dt": 0.4999725907246807
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
													-1
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
													-1
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
												"texture": "Fx/Gradients/vGrad.png",
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
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.1045974990207738e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": -0.00042520394624223634,
																"dt": 0.16263399032357118
															}
														},
														{
															"time": 0.22714662728347923,
															"value": 0.5,
															"prevHandle": {
																"dv": 0.10640259250587768,
																"dt": -0.04747435722294645
															},
															"nextHandle": {
																"dv": -0.31894501284413257,
																"dt": 0.14192780131179794
															}
														},
														{
															"time": 0.8,
															"value": 0,
															"prevHandle": {
																"dv": 0.0026099103345263996,
																"dt": -0.43008424639938747
															},
															"nextHandle": {
																"dv": -2.2091949980415477e-16,
																"dt": 0.5
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
															"value": 1,
															"prevHandle": {
																"dv": 0.8010947382467242,
																"dt": -0.28373645541197395
															},
															"nextHandle": {
																"dv": -0.3718592964824121,
																"dt": 0.13271162123385938
															}
														},
														{
															"time": 0.8,
															"value": 0,
															"prevHandle": {
																"dv": 0.010050251256281173,
																"dt": -0.49426111908177917
															},
															"nextHandle": {
																"dv": -0.010187087144130004,
																"dt": 0.4999725907246807
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
											"time": 0.04493830690527438,
											"value": 0,
											"prevHandle": {
												"dv": 1.609555556401062e-16,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": -0.0006249999999999867,
												"dt": 0.20403347484929812
											}
										},
										{
											"time": 0.29591034392660565,
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