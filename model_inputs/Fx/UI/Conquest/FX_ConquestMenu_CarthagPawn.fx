{
	"type": "fx",
	"markers": [
		{
			"t": 8.80576
		}
	],
	"cullingRadius": 500,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"locked": true,
					"z": -0.05,
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
					"type": "model",
					"name": "Pawn_Mainbase_Arrakeen",
					"source": "UI/ConquestMenu/Assets/Harkonnen/Pawn_Mainbase_Harkonnen.fbx",
					"editorOnly": true,
					"rotationZ": 25.5
				},
				{
					"type": "object",
					"name": "Lights",
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"x": -0.44302,
							"y": -0.213,
							"z": 0.22891,
							"scaleZ": 0.08,
							"rotationZ": 24.2,
							"kind": 2,
							"points": [
								{
									"x": 0.04461831348899997,
									"y": -0.03444877351384757
								},
								{
									"x": 0.04426927918766643,
									"y": 0.04190439504900966
								},
								{
									"x": -0.04917445455397862,
									"y": 0.015525905301997956
								},
								{
									"x": -0.04926275413418457,
									"y": -0.014533412644922894
								}
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
											"culling": "Back",
											"colorMask": 255,
											"emissive": 1
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
											1,
											0.49019607843137253,
											0.49019607843137253
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"z": 0.09358,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.18,
							"rotationZ": 111,
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
											"culling": "Back",
											"colorMask": 255,
											"emissive": 1
										}
									},
									"diffuseMap": "Fx/Alphas/T_UI_Round_256.png"
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
											1,
											0.49019607843137253,
											0.49019607843137253
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
								"alpha": 1
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.13096779527132657,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3249103777204801,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4284390603183386,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01666666666666672,
												"dt": -0.9567683341453281
											},
											"nextHandle": {
												"dv": 0.006535301955241471,
												"dt": 0.375400531221125
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
					"name": "White",
					"z": 0.042,
					"scaleX": 0.125,
					"scaleY": 0.125,
					"scaleZ": 0.083,
					"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
					"fadePower": 3,
					"emissive": 0.5,
					"renderMode": "BeforeTonemapping",
					"children": [
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
									"keyMode": 0,
									"keys": [
										{
											"time": 0.06480336332613806,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.25874594577529153,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.36227462837315,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01666666666666672,
												"dt": -0.9567683341453281
											},
											"nextHandle": {
												"dv": 0.006535301955241471,
												"dt": 0.375400531221125
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
						}
					]
				},
				{
					"type": "object",
					"name": "FloorGlitch",
					"children": [
						{
							"type": "emitter",
							"name": "FlareGround",
							"props": {
								"emitType": "Burst",
								"instScale": 0.2,
								"warmUpTime": 0.25,
								"lifeTime": 1.2
							},
							"z": 0.004518,
							"scaleX": 0.006999999999999998,
							"scaleY": 0.006999999999999998,
							"scaleZ": 0.006999999999999998,
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
													"emissive": 0.2
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"alpha": 0.3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
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
															"mode": 2
														},
														{
															"time": 0.3153236153651962,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -1.4,
																"dt": -0.040379546604235594
															},
															"nextHandle": {
																"dv": 0.614600230694067,
																"dt": 0.01603771273438879
															}
														},
														{
															"time": 1.0041889953613283,
															"value": 0,
															"mode": 0
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
																"color": -151198802
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
													0.5450980392156862,
													0.6941176470588235,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04511187146993318,
																"dt": -0.49965741688338355
															},
															"nextHandle": {
																"dv": -0.01666666666666705,
																"dt": 0.18767603882889183
															}
														},
														{
															"time": 0.2708756768212688,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2708756768212688,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2708756768212688,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2708756768212688,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2708756768212688,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.45762187905928653,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 0.45762187905928653,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 0.45762187905928653,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 0.45762187905928653,
															"value": -2.7755575615628914e-16,
															"mode": 0
														},
														{
															"time": 0.45762187905928653,
															"value": -2.7755575615628914e-16,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.10334430583115584
															},
															"nextHandle": {
																"dv": 0.010028697519592782,
																"dt": 0.06218452701317666
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
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 1,
										"ATTENUATE": false,
										"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"z": 0.001,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.25,
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
											"emissive": 1
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.0003149212270795237,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.194257503676233,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.2977861862740911,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01666666666666672,
														"dt": -0.9567683341453281
													},
													"nextHandle": {
														"dv": 0.006535301955241471,
														"dt": 0.375400531221125
													}
												}
											],
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 2.636545797810169,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.830488380259323,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.9340170628571833,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.9567683341453281
															},
															"nextHandle": {
																"dv": 0.006535301955241471,
																"dt": 0.375400531221125
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
									"name": "WorldUV",
									"source": "shaders/WorldUV.hx",
									"props": {
										"useNormalMap": false,
										"onDecal": false,
										"scale": 14,
										"rotation": 0
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
										"progress": 0.23,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.8,
										"uvScaleY": 0.8,
										"texture": "Fx/Alphas/T_Grid10_Thick.png",
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.9490196078431372,
											0.8549019607843137
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
										"intensity": 0.5,
										"scrollSpeed": [
											0,
											1
										],
										"scale": [
											1.5,
											1.5
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"keys": [
												{
													"time": 0.01375327589095725,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.2593571431819569,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.2593571431819569,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.2593571431819569,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.2593571431819569,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.2593571431819569,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3636657587851452,
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
											0.5450980392156862,
											0.6941176470588235,
											1
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.04511187146993318,
														"dt": -0.49965741688338355
													},
													"nextHandle": {
														"dv": -0.01666666666666705,
														"dt": 0.18767603882889183
													}
												},
												{
													"time": 0.19043498746037493,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.19043498746037493,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.19043498746037493,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.19043498746037493,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.19043498746037493,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3771811896983923,
													"value": -2.7755575615628914e-16,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.06224873407933925
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.01022846544150798
													}
												},
												{
													"time": 0.3771811896983923,
													"value": -2.7755575615628914e-16,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.01022846544150798
													}
												},
												{
													"time": 0.3771811896983923,
													"value": -2.7755575615628914e-16,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.01022846544150798
													}
												},
												{
													"time": 0.3771811896983923,
													"value": -2.7755575615628914e-16,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.01022846544150798
													}
												},
												{
													"time": 0.3771811896983923,
													"value": -2.7755575615628914e-16,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01666666666666672,
														"dt": -0.10334430583115584
													},
													"nextHandle": {
														"dv": 0.010028697519592782,
														"dt": 0.06218452701317666
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
	]
}