{
	"type": "fx",
	"duration": 25,
	"cullingRadius": 15,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Altar",
					"source": "Vehicle/Fremen/Altar/Altar.fbx",
					"editorOnly": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Altar/Anim_Altar_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "All_Fabric_01",
					"children": [
						{
							"type": "model",
							"name": "Altar_Braise",
							"source": "Vehicle/Fremen/Altar/Altar_Balloon.fbx",
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
											"emissive": 5
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/noise/T_Embers04.png",
									"normalMap": "Fx/DistortionMaps/psfixnormal.jpg",
									"specularMap": "Fx/Gradients/z_FillGrey50.jpg"
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": false,
										"bias": 0.15,
										"scale": 0.76,
										"power": 1,
										"color": [
											1,
											0.5176470588235293,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "Level",
									"source": "shaders/Level.hx",
									"props": {
										"levelMin": 0.15,
										"levelMax": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "levelMin",
											"loop": true,
											"keys": [
												{
													"time": -0.010000000000000002,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.11000000000000004,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 0.21500000000000005,
													"value": 0.3746893466403401,
													"mode": 2
												},
												{
													"time": 0.3600000000000001,
													"value": 0.8423825583950751,
													"mode": 2
												},
												{
													"time": 0.4900000000000001,
													"value": 0.6962284297217205,
													"mode": 2
												},
												{
													"time": 0.5900000000000002,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 0.7300000000000002,
													"value": 0.21391980509964992,
													"mode": 2
												},
												{
													"time": 0.8800000000000002,
													"value": 0.9008442098644169,
													"mode": 2
												},
												{
													"time": 0.9950000000000003,
													"value": 0.5354588881810303,
													"mode": 2
												},
												{
													"time": 1.0900000000000003,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 1.1800000000000004,
													"value": -0.034542213645053055,
													"mode": 2
												},
												{
													"time": 1.2800000000000002,
													"value": 0.5500743010483657,
													"mode": 2
												},
												{
													"time": 1.4100000000000004,
													"value": 0.12622732789563712,
													"mode": 2
												},
												{
													"time": 1.5350000000000004,
													"value": 0.710843842589056,
													"mode": 2
												},
												{
													"time": 1.6050000000000004,
													"value": 0.25776604370165634,
													"mode": 2
												},
												{
													"time": 1.7950000000000004,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 1.8800000000000006,
													"value": -0.04915762651238853,
													"mode": 2
												},
												{
													"time": 2.085000000000001,
													"value": 0.5939205396503722,
													"mode": 2
												},
												{
													"time": 2.290000000000001,
													"value": 0.12622732789563712,
													"mode": 2
												},
												{
													"time": 2.540000000000001,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 2.615000000000001,
													"value": 0.2285352179669854,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "levelMax",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": -0.025000000000000005,
													"value": 0.85,
													"mode": 2
												},
												{
													"time": 0.11000000000000004,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 0.20000000000000004,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 0.3600000000000001,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4900000000000001,
													"value": 0.87,
													"mode": 2
												},
												{
													"time": 0.5900000000000002,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 0.7150000000000002,
													"value": 0.98,
													"mode": 2
												},
												{
													"time": 0.8800000000000002,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9950000000000003,
													"value": 0.86,
													"mode": 2
												},
												{
													"time": 1.0900000000000003,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 1.1650000000000007,
													"value": 0.95,
													"mode": 2
												},
												{
													"time": 1.2800000000000002,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3950000000000007,
													"value": 0.91,
													"mode": 2
												},
												{
													"time": 1.5350000000000004,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5900000000000007,
													"value": 0.87,
													"mode": 2
												},
												{
													"time": 1.7950000000000004,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 1.8650000000000009,
													"value": 0.865,
													"mode": 2
												},
												{
													"time": 2.085000000000001,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.2750000000000012,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 2.540000000000001,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 2.6000000000000014,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "levelMax",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": -0.025000000000000005,
													"value": 0.85,
													"mode": 2
												},
												{
													"time": 0.02500000000000001,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 0.08000000000000002,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 0.23500000000000007,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4900000000000001,
													"value": 0.87,
													"mode": 2
												},
												{
													"time": 0.5900000000000002,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 0.7150000000000002,
													"value": 0.98,
													"mode": 2
												},
												{
													"time": 0.8800000000000002,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9950000000000003,
													"value": 0.86,
													"mode": 2
												},
												{
													"time": 1.0900000000000003,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 1.1650000000000007,
													"value": 0.95,
													"mode": 2
												},
												{
													"time": 1.3900000000000003,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4550000000000003,
													"value": 0.91,
													"mode": 2
												},
												{
													"time": 1.5900000000000005,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.6550000000000005,
													"value": 0.87,
													"mode": 2
												},
												{
													"time": 1.7950000000000004,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 1.9950000000000003,
													"value": 0.865,
													"mode": 2
												},
												{
													"time": 2.190000000000001,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.3450000000000006,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 2.540000000000001,
													"value": 0.9885366870684298,
													"mode": 2
												},
												{
													"time": 2.6000000000000014,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "levelMax",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.44000000000000017,
													"value": 0.87,
													"mode": 2
												},
												{
													"time": 0.7850000000000001,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1650000000000007,
													"value": 0.95,
													"mode": 2
												},
												{
													"time": 2.190000000000001,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.3450000000000006,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 2.615,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Altar/Anim_Altar_Death.fbx"
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
										"uvScaleY": 2,
										"texture": "Fx/Alphas/TS_AltarDisolveHole.png",
										"uvShift": [
											0,
											0.3
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
													"time": 2.0581463623046856,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.043082260191442,
													"value": 1.562627247572891,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.18500000000000005
													},
													"nextHandle": {
														"dv": 0.06003813632869936,
														"dt": 0.3332116566242845
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "saturation",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 2.0581463623046856,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.989880847930909,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0.005592128208705582,
														"dt": -0.7653840637207034
													},
													"nextHandle": {
														"dv": -0.0021131959066992513,
														"dt": 0.33910202522701227
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
										"uvScaleX": 6,
										"uvScaleY": 5,
										"texture": "Fx/noise/clouds_Dissolve.png",
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
													"time": 2.0026276111602788,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0012118578694698603,
														"dt": -0.49998607765881653
													},
													"nextHandle": {
														"dv": 0.004166666666666652,
														"dt": 1.7190756243467331
													}
												},
												{
													"time": 4.581241047680379,
													"value": 1.25,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.18500000000000005
													},
													"nextHandle": {
														"dv": 0.06003813632869936,
														"dt": 0.3332116566242845
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
													"time": 2.0026276111602788,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0012118578694698603,
														"dt": -0.49998607765881653
													},
													"nextHandle": {
														"dv": 0.004166666666666652,
														"dt": 1.7190756243467331
													}
												},
												{
													"time": 4.581241047680379,
													"value": 1.25,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.18500000000000005
													},
													"nextHandle": {
														"dv": 0.06003813632869936,
														"dt": 0.3332116566242845
													}
												},
												{
													"time": 6.9343568478688935,
													"value": 1.25,
													"mode": 0
												},
												{
													"time": 12.446000186338528,
													"value": 2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.4096244551483741
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.4096244551483741
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
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -12710654
													},
													{
														"position": 0.265625,
														"color": -7198190
													},
													{
														"position": 0.5859375,
														"color": -45568
													}
												],
												"resolution": 64,
												"isVertical": false
											}
										}
									}
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 1,
										"useRGB": false
									},
									"children": [
										{
											"type": "curve",
											"name": "threshold",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.85,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.8333333333333334
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.8333333333333334
													}
												},
												{
													"time": 5,
													"value": 0.95,
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
											0.12156862745098039,
											0.12156862745098039,
											0.12156862745098039
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keyMode": 0,
											"keys": [
												{
													"time": 2.8733143979994717,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 1.8628159746033175
													}
												},
												{
													"time": 5.477355577156989,
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
							"name": "Fabric",
							"children": [
								{
									"type": "model",
									"name": "Altar_Fabric",
									"source": "Vehicle/Fremen/Altar/Altar_Balloon.fbx",
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Altar/Anim_Altar_Death.fbx"
										},
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "PBR",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"children": [
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
														"uvScaleY": 2,
														"texture": "Fx/Alphas/TS_AltarDisolveHole.png",
														"uvShift": [
															0,
															0.3
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
																	"time": 2.0581463623046856,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 5.043082260191442,
																	"value": 1.562627247572891,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.18500000000000005
																	},
																	"nextHandle": {
																		"dv": 0.06003813632869936,
																		"dt": 0.3332116566242845
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "saturation",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 2.0581463623046856,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 5.989880847930909,
																	"value": 0.8,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.005592128208705582,
																		"dt": -0.7653840637207034
																	},
																	"nextHandle": {
																		"dv": -0.0021131959066992513,
																		"dt": 0.33910202522701227
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
														"uvScaleX": 6,
														"uvScaleY": 5,
														"texture": "Fx/noise/clouds_Dissolve.png",
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
																	"time": 2.0026276111602788,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.0012118578694698603,
																		"dt": -0.49998607765881653
																	},
																	"nextHandle": {
																		"dv": 0.004166666666666652,
																		"dt": 1.7190756243467331
																	}
																},
																{
																	"time": 4.581241047680379,
																	"value": 1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.18500000000000005
																	},
																	"nextHandle": {
																		"dv": 0.06003813632869936,
																		"dt": 0.3332116566242845
																	}
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
														"threshold": 1,
														"useRGB": false
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Altar_FabricStrips",
									"source": "Vehicle/Fremen/Altar/Altar_FabricStrips.fbx",
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Altar/Anim_Altar_Death.fbx"
										},
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "PBR",
													"blend": "Alpha",
													"shadows": true,
													"culling": "None",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"children": [
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
														"uvScaleX": 1,
														"uvScaleY": 4,
														"texture": "Fx/Gradients/uGrad_uneaven_dots.png",
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
																	"time": 2.6097900328040113,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 5.154019642397765,
																	"value": 0.55,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.025000000000000022,
																		"dt": -0.5773015156388288
																	},
																	"nextHandle": {
																		"dv": -0.015356776838571378,
																		"dt": 0.35461962176937706
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
														"progress": 0.58,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Embers.png",
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
																	"time": 3.576770071499049,
																	"value": 0.865,
																	"mode": 2
																},
																{
																	"time": 4.519007772915067,
																	"value": 1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.18500000000000005
																	},
																	"nextHandle": {
																		"dv": 0.06003813632869936,
																		"dt": 0.3332116566242845
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "saturation",
															"keyMode": 0,
															"keys": [
																{
																	"time": 3.576770071499049,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 4.519007772915067,
																	"value": 0.8,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.005592128208705582,
																		"dt": -0.7653840637207034
																	},
																	"nextHandle": {
																		"dv": -0.0021131959066992513,
																		"dt": 0.33910202522701227
																	}
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
														"threshold": 1,
														"useRGB": false
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Altar_FabricStrips_Braise",
									"source": "Vehicle/Fremen/Altar/Altar_FabricStrips.fbx",
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Altar/Anim_Altar_Death.fbx"
										},
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": true,
													"culling": "None",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/noise/T_Embers04.png",
											"children": [
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
														"uvScaleX": 1,
														"uvScaleY": 4,
														"texture": "Fx/Gradients/uGrad_uneaven_dots.png",
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
																	"time": 2.6097900328040113,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 5.154019642397765,
																	"value": 0.55,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.025000000000000022,
																		"dt": -0.5773015156388288
																	},
																	"nextHandle": {
																		"dv": -0.015356776838571378,
																		"dt": 0.35461962176937706
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
														"progress": 0.58,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Embers.png",
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
																	"time": 3.576770071499049,
																	"value": 0.865,
																	"mode": 2
																},
																{
																	"time": 4.519007772915067,
																	"value": 1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.18500000000000005
																	},
																	"nextHandle": {
																		"dv": 0.06003813632869936,
																		"dt": 0.3332116566242845
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "saturation",
															"keyMode": 0,
															"keys": [
																{
																	"time": 3.576770071499049,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 4.519007772915067,
																	"value": 0.8,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.005592128208705582,
																		"dt": -0.7653840637207034
																	},
																	"nextHandle": {
																		"dv": -0.0021131959066992513,
																		"dt": 0.33910202522701227
																	}
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
														"threshold": 1,
														"useRGB": false
													},
													"children": [
														{
															"type": "curve",
															"name": "threshold",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.01443253789097021,
																	"value": 0.85,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.8333333333333334
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.8333333333333334
																	}
																},
																{
																	"time": 5.01443253789097,
																	"value": 0.95,
																	"mode": 2
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
														"USE_ALPHA": false,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -10940159
																	},
																	{
																		"position": 0.265625,
																		"color": -7198190
																	},
																	{
																		"position": 0.5859375,
																		"color": -45568
																	}
																],
																"resolution": 64,
																"isVertical": false
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 2,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													}
												},
												{
													"type": "shader",
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"props": {
														"amount": 1,
														"color": [
															0.12156862745098039,
															0.12156862745098039,
															0.12156862745098039
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keyMode": 0,
															"keys": [
																{
																	"time": 3.606528238067078,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 1.8628159746033175
																	}
																},
																{
																	"time": 6.210569417224595,
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
							]
						}
					]
				}
			]
		}
	]
}