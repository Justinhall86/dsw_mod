{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "polygon",
					"editorOnly": true,
					"z": 0.44000000000000017,
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
					"type": "subFX",
					"name": "Ability_Consolidation",
					"source": "Fx/Abilities/Ability_Consolidation.fx",
					"enabled": false,
					"y": -117.93124
				},
				{
					"type": "object",
					"name": "Grid",
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Grid",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"alpha": 0.45,
										"uScale": 3.5,
										"vScale": 3.5,
										"uOffset": 0.62,
										"vOffset": -0.67,
										"texture": "Fx/Alphas/T_Grid10_Thick.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_circle2.png",
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 1.748527617808038e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.8142004103964309
													}
												},
												{
													"time": 1.5,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666663,
														"dt": -0.4377457011315382
													},
													"nextHandle": {
														"dv": 0.019035390068585345,
														"dt": 0.4999555614806037
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
										"progress": 0.76,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.5,
								"sandColorSet": false,
								"envBlend": 1,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "object",
							"name": "Scan",
							"children": [
								{
									"type": "object",
									"name": "ScanHorizontal",
									"x": -2.220446049250313e-16,
									"children": [
										{
											"type": "advancedDecal",
											"name": "highlight",
											"scaleX": 150.00000000000003,
											"scaleY": 150.00000000000003,
											"scaleZ": 50,
											"rotationZ": 89.99999999999999,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
											"blendMode": 2,
											"children": [
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.32,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.08,
														"saturation": 1,
														"width": 0.5,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/Cyl15u_A.png",
														"uvShift": [
															0,
															0.5
														],
														"uvShiftSpeed": [
															0,
															-0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.2
													}
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "Hextilescan",
											"scaleX": 150.00000000000003,
											"scaleY": 150.00000000000003,
											"scaleZ": 50,
											"rotationZ": 89.99999999999999,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"emissive": 3,
											"renderMode": "BeforeTonemapping",
											"children": [
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
														"uScale": 3.5,
														"vScale": 3.5,
														"uOffset": 0.62,
														"vOffset": -0.67,
														"texture": "Fx/Alphas/T_Grid06_Thick.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.32,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.15,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
														"uvShift": [
															0,
															0.5
														],
														"uvShiftSpeed": [
															0,
															-0.2
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"enabled": false,
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.8261910692508928e-16,
																		"dt": -0.5002988948488519
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.5591687990283616
																	}
																},
																{
																	"time": 2.0014282829907484,
																	"value": -0.5,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.7638888888888888,
																		"dt": -0.4916725256141721
																	},
																	"nextHandle": {
																		"dv": -0.01388888888888884,
																		"dt": 0.1467118532765408
																	}
																},
																{
																	"time": 4,
																	"value": -0.5,
																	"mode": 0
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
														"progress": 0.86,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.075,
															0.05
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "ScanHorizontal",
									"x": -1.45865,
									"y": 2.21555,
									"rotationZ": 90,
									"children": [
										{
											"type": "advancedDecal",
											"name": "highlight",
											"scaleX": 150.00000000000003,
											"scaleY": 150.00000000000003,
											"scaleZ": 50,
											"rotationZ": 89.99999999999999,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
											"blendMode": 2,
											"children": [
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.32,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.08,
														"saturation": 1,
														"width": 0.06,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/Cyl15u_A.png",
														"uvShift": [
															0,
															0.5
														],
														"uvShiftSpeed": [
															0,
															0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.08,
														"saturation": 1,
														"width": 0.5,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/Cyl15u_A.png",
														"uvShift": [
															0,
															0.5
														],
														"uvShiftSpeed": [
															0,
															0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.15
													}
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "Hextilescan",
											"scaleX": 150.00000000000003,
											"scaleY": 150.00000000000003,
											"scaleZ": 50,
											"rotationZ": 89.99999999999999,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"emissive": 3,
											"renderMode": "BeforeTonemapping",
											"children": [
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
														"uScale": 3.5,
														"vScale": 3.5,
														"uOffset": 0.62,
														"vOffset": -0.67,
														"texture": "Fx/Alphas/T_Grid06_Thick.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.32,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.15,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
														"uvShift": [
															0,
															0.5
														],
														"uvShiftSpeed": [
															0,
															0.2
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"enabled": false,
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.8261910692508928e-16,
																		"dt": -0.5002988948488519
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.5591687990283616
																	}
																},
																{
																	"time": 2.0014282829907484,
																	"value": -0.5,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.7638888888888888,
																		"dt": -0.4916725256141721
																	},
																	"nextHandle": {
																		"dv": -0.01388888888888884,
																		"dt": 0.1467118532765408
																	}
																},
																{
																	"time": 4,
																	"value": -0.5,
																	"mode": 0
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
														"progress": 0.86,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.075,
															0.05
														]
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
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 1,
										"envColorSet": false
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
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 1.748527617808038e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.8142004103964309
													}
												},
												{
													"time": 1.5,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666663,
														"dt": -0.4377457011315382
													},
													"nextHandle": {
														"dv": 0.019035390068585345,
														"dt": 0.4999555614806037
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
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_circle2.png",
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 1.748527617808038e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.8142004103964309
													}
												},
												{
													"time": 1.5,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666663,
														"dt": -0.4377457011315382
													},
													"nextHandle": {
														"dv": 0.019035390068585345,
														"dt": 0.4999555614806037
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
					"name": "logo",
					"enabled": false,
					"x": -1.5407439555097887e-33,
					"y": 0.19439333333333336,
					"z": -0.19131166666666666,
					"scaleX": 1.4,
					"scaleY": 1.4,
					"scaleZ": 1.4,
					"children": [
						{
							"type": "advancedDecal",
							"name": "growingcircle",
							"enabled": false,
							"x": -6.018531076210111e-33,
							"y": -0.19439333333333333,
							"z": 0.19131166666666669,
							"scaleX": 44,
							"scaleY": 44,
							"scaleZ": 70.17809825027207,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.477641410275758,
														"dt": -0.23128300334750976
													},
													"nextHandle": {
														"dv": -1.15,
														"dt": 0.18
													}
												},
												{
													"time": 2,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4,
													"value": 0,
													"mode": 0
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.46,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9949999999999999,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9999999999999998,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.15333333333333335
													}
												},
												{
													"time": 0.9949999999999999,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.2649999999999999
													},
													"nextHandle": {
														"dv": -2.735044518095755e-16,
														"dt": 0.335
													}
												},
												{
													"time": 1.9999999999999998,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499999999999996
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666674
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
									"loop": true,
									"keys": [
										{
											"time": 0.187037037037037,
											"value": 0.25,
											"mode": 0,
											"prevHandle": {
												"dv": -1.2324051059924013,
												"dt": -1.832211209568279
											},
											"nextHandle": {
												"dv": 0.4201235451904888,
												"dt": 0.6255555555555555
											}
										},
										{
											"time": 1.2928395061728395,
											"value": 0.9,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0037229339507492965,
												"dt": -0.22876543209876554
											},
											"nextHandle": {
												"dv": -0.0027194816775288912,
												"dt": 0.18997176610430994
											}
										},
										{
											"time": 4,
											"value": 0.9,
											"mode": 0
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "logo",
							"scaleX": 25,
							"scaleY": 25,
							"scaleZ": 30,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_LogoShield05.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 0.46,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9949999999999999,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9999999999999998,
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 0.25,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.15333333333333335
													}
												},
												{
													"time": 2,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 4,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499999999999996
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666674
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "outsidecircle",
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 50,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_Target1.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.15333333333333335
													}
												},
												{
													"time": 0.9949999999999999,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.2649999999999999
													},
													"nextHandle": {
														"dv": -2.735044518095755e-16,
														"dt": 0.335
													}
												},
												{
													"time": 1.9999999999999998,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499999999999996
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666674
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.15333333333333335
													}
												},
												{
													"time": 2,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 4,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499999999999996
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666674
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4949999999999999,
											"value": 0.99,
											"mode": 0,
											"prevHandle": {
												"dv": -0.125,
												"dt": -1.085
											},
											"nextHandle": {
												"dv": 0.0191555190995555,
												"dt": 0.1662699057841416
											}
										},
										{
											"time": 1.9999999999999998,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4,
											"value": 1,
											"mode": 0
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"enabled": false,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.0160535573959348,
											"value": 0.99,
											"mode": 0,
											"prevHandle": {
												"dv": -0.056477272727272654,
												"dt": -0.5160535573959348
											},
											"nextHandle": {
												"dv": 0.018433924306061934,
												"dt": 0.16634856728808406
											}
										},
										{
											"time": 1.5210535573959347,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.021053557395935,
											"value": 1,
											"mode": 0
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
								"sandBlend": 0.5,
								"sandColorSet": false,
								"envBlend": 1,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"enabled": false,
							"props": {
								"alpha": 0.7
							}
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.04114912760556359,
												"dt": -0.49996190040761035
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.405
											}
										},
										{
											"time": 0.9940525627136232,
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