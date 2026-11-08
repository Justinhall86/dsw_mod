{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"enabled": false,
			"editorOnly": true,
			"locked": true,
			"x": 15,
			"scaleX": 200,
			"scaleY": 200,
			"scaleZ": 140,
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
			"children": [
				{
					"type": "model",
					"name": "VerniusBase",
					"source": "Structure/Base/Vernius/VerniusBase.fbx",
					"editorOnly": true,
					"locked": true
				},
				{
					"type": "object",
					"name": "EXPLOSION",
					"x": -0.94887,
					"y": 4.25839,
					"z": 0.38636,
					"rotationZ": -30,
					"children": [
						{
							"type": "object",
							"name": "LensFlare",
							"x": -1.0473412500000001,
							"y": 0.28297107142857136,
							"z": -6.676287678571429,
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 10,
							"children": [
								{
									"type": "emitter",
									"name": "LensFlare_color_big2",
									"props": {
										"alignMode": "Screen",
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
											0.9215686274509803,
											0.9215686274509803,
											0.9215686274509803,
											0.8509803921568627
										],
										"emitAngle": 0,
										"emitRate": 1,
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instScale": 8,
										"emitType": "Burst",
										"burstDelay": 0.1,
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"warmUpTime": -1.4,
										"instRotation": [
											20,
											0,
											0
										],
										"lifeTime": 3,
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
									"z": 1.49983,
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
															"culling": "Back",
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": true,
															"parallax": 0,
															"textureWrap": true,
															"emissive": 4
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Gradients/T_circleGradient_color04.png",
													"color": [
														0.9411764705882353,
														0.807843137254902,
														0.7058823529411764,
														1
													]
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
														"alpha": 0.3,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_LensFlare_Double.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.0049999999999999975,
																	"value": 1,
																	"prevHandle": {
																		"dv": 1.2619278819653144,
																		"dt": -0.3266166282733753
																	},
																	"nextHandle": {
																		"dv": -0.85,
																		"dt": 0.22000000000000003
																	}
																},
																{
																	"time": 1,
																	"value": 0.033333333333333326,
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
														"range": 24.24,
														"power": 0.8
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.8,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.5,
														"color": [
															1,
															0.596078431372549,
															0.2980392156862745
														]
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keys": [
												{
													"time": 0,
													"value": 1.0666666666666667,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1.1,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_SandShockwave",
							"source": "Fx/Explosion/BasesExplosions/FX_SandShockwave.fx",
							"x": 0.46317875000000003,
							"y": 0.7872710714285713,
							"z": -0.35105767857142844,
							"scaleX": 0.75,
							"scaleY": 0.75,
							"scaleZ": 0.75,
							"rotationZ": -180,
							"time": 2.41023,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.35
									}
								}
							]
						},
						{
							"type": "object",
							"name": "LightDecals",
							"enabled": false,
							"x": 0.46317875000000003,
							"y": 0.7872710714285713,
							"z": -0.35105767857142844,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"x": -13.95182,
									"y": -17.83587,
									"z": 2.75093,
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
															"time": 0.523456779509672,
															"value": -0.01666666666666672,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.0033333333333332624
															}
														},
														{
															"time": 0.5966395926641239,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.453053587062341,
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
													"time": 0.4313742333465707,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5045570465010227,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4812652665191774,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5544480796736293,
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
									"x": 3.60207,
									"y": 15.82819,
									"z": 2.75093,
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
															"time": 0.8180292377875176,
															"value": -0.01666666666666672,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.0033333333333332624
															}
														},
														{
															"time": 0.8912120509419695,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.7476260453401857,
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
													"time": 0.7259466916244166,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7991295047788683,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.775837724797022,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.849020537951474,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ExploT01",
									"x": -0.9898,
									"y": -6.14065,
									"z": 2.75093,
									"scaleX": 11,
									"scaleY": 11,
									"scaleZ": 11,
									"rotationX": 18,
									"rotationY": -6.2,
									"rotationZ": 18.5,
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
															"time": 1.2180659095228639,
															"value": -0.01666666666666672,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.0033333333333332624
															}
														},
														{
															"time": 1.2912487226773157,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.1476627170755314,
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
													"time": 1.125983363359763,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.1991661765142148,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.1758743965323677,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.2490572096868195,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ExploT02",
									"x": -0.12138,
									"y": 5.76469,
									"z": 6.22476,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationX": -24.2,
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
															"time": 1.297805467564922,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3709882807193738,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.2274022751175915,
															"value": 0,
															"prevHandle": {
																"dv": -0.010435974090682587,
																"dt": -1.9008610871910798
															},
															"nextHandle": {
																"dv": 0.0016255087851255881,
																"dt": 0.333375796936216
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
													"time": 1.205722921401821,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.2789057345562729,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.255613954574428,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.3287967677288797,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ExploT03",
									"x": -4.0522,
									"y": -2.89603,
									"z": 9.24025,
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 7,
									"rotationX": 71.1,
									"rotationZ": -43.3,
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
															"time": 1.335400409502141,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4085832226565929,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.264997217054812,
															"value": 0,
															"prevHandle": {
																"dv": -0.010435974090682587,
																"dt": -1.9008610871910798
															},
															"nextHandle": {
																"dv": 0.0016255087851255881,
																"dt": 0.333375796936216
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
													"time": 1.24331786333904,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.316500676493492,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.2932088965116484,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.3663917096661002,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ExploT03",
									"x": -2.8701,
									"y": -2.67564,
									"z": 21.2944,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
									"rotationZ": -24.1,
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
															"time": 1.335400409502141,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4085832226565929,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.264997217054812,
															"value": 0,
															"prevHandle": {
																"dv": -0.010435974090682587,
																"dt": -1.9008610871910798
															},
															"nextHandle": {
																"dv": 0.0016255087851255881,
																"dt": 0.333375796936216
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
													"time": 1.24331786333904,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.316500676493492,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.2932088965116484,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.3663917096661002,
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
								}
							]
						},
						{
							"type": "object",
							"name": "SparkesAfterMath",
							"x": -0.8215112500000001,
							"y": -2.6703189285714286,
							"z": 5.221552321428572,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"children": [
								{
									"type": "emitter",
									"name": "Sparkles01",
									"props": {
										"burstParticleCount": 10,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 70,
										"instSpeed": [
											30,
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
										"burstDelay": 1.25,
										"emitDuration": 50,
										"emitRate": 10,
										"instScale": 1.2,
										"maxCount": 10,
										"warmUpTime": -11.5,
										"emitType": "Burst",
										"burstCount": 2,
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
									"x": -2.220446049250313e-16,
									"scaleX": 4.999999999999999,
									"scaleY": 5,
									"scaleZ": 4.999999999999999,
									"rotationX": 91.89999999999998,
									"rotationY": -37.800000000000004,
									"rotationZ": -77.99999999999999,
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
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sparkles02",
									"props": {
										"burstParticleCount": 10,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 70,
										"instSpeed": [
											30,
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
										"burstDelay": 1.5,
										"emitDuration": 50,
										"emitRate": 10,
										"instScale": 1.2,
										"maxCount": 10,
										"warmUpTime": -11.75,
										"emitType": "Burst",
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
									"x": 0.41397,
									"y": 6.59166,
									"z": 9.52968,
									"scaleX": 4.999999999999999,
									"scaleY": 5,
									"scaleZ": 4.999999999999999,
									"rotationX": -80.6,
									"rotationY": -32.4,
									"rotationZ": 60.5,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "DamageDecal",
							"locked": true,
							"x": -1.6382012499999998,
							"y": 1.2643610714285713,
							"z": -0.35105767857142844,
							"scaleX": 0.97,
							"scaleY": 0.97,
							"scaleZ": 0.97,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Sanddecal_02",
									"enabled": false,
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
									"scaleX": 90,
									"scaleY": 90,
									"scaleZ": 18,
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
									"type": "advancedDecal",
									"name": "TowerDecal",
									"z": 12.7456,
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 26.67,
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
												"alpha": 0.8,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/Destruction_Decal_Alpha.png"
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
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_VerniusBase_FinalExplosion",
							"source": "Fx/Structure/Vernius/FX_VerniusBase_FinalExplosion_Photosensitive.fx",
							"x": 0.46317875000000003,
							"y": 0.7872710714285713,
							"z": -0.35105767857142844,
							"scaleX": 0.6666666666666666,
							"scaleY": 0.6666666666666666,
							"scaleZ": 0.6666666666666666,
							"time": 1.38,
							"children": [
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
							"type": "object",
							"name": "BaseLights",
							"enabled": false,
							"x": -1.10241,
							"y": 1.15096,
							"z": -0.21138,
							"scaleX": 0.55,
							"scaleY": 0.55,
							"scaleZ": 0.55,
							"rotationZ": -149.8,
							"children": [
								{
									"type": "object",
									"name": "Lights",
									"x": 0.07334,
									"y": 0.33092666666666615,
									"z": 14.290090000000001,
									"rotationZ": 9.93923337957349e-17,
									"children": [
										{
											"type": "model",
											"name": "ViernusBaseLights",
											"source": "Fx/Meshes_Common/ViernusLightsTower.fbx",
											"x": -0.05289988523369493,
											"y": -0.1201515578380179,
											"z": -14.019017272727275,
											"scaleX": 1.9090909090909094,
											"scaleY": 1.9090909090909094,
											"scaleZ": 1.8181818181818183,
											"rotationZ": -90.5,
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
															"emissive": 20
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
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
																		"position": 0.42578125,
																		"color": -1
																	},
																	{
																		"position": 0.63671875,
																		"color": -1
																	},
																	{
																		"position": 1,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": true,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.15,
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.8381562745571141,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.015960427820990455,
																		"dt": -0.49990576705532597
																	},
																	"nextHandle": {
																		"dv": -0.033333333333333326,
																		"dt": 1.0440525627136237
																	}
																},
																{
																	"time": 3.0666384780406952,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.9666666666666667,
																		"dt": -0.038011622428894
																	},
																	"nextHandle": {
																		"dv": -0.7333333333333334,
																		"dt": 0.011669411659240847
																	}
																},
																{
																	"time": 3.078307889699936,
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
											"name": "ViernusBaseLights",
											"source": "Fx/Meshes_Common/ViernusBaseLights.fbx",
											"x": 0.02416999999999997,
											"y": -0.08202666666666669,
											"z": -12.055380000000005,
											"scaleX": 1.8300000000000003,
											"scaleY": 1.8300000000000003,
											"scaleZ": 1.8300000000000003,
											"rotationZ": -90.5,
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
															"emissive": 20
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"progress": 0.25,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
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
																		"position": 0.42578125,
																		"color": -1
																	},
																	{
																		"position": 0.63671875,
																		"color": -1
																	},
																	{
																		"position": 1,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": true,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.15,
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.8381562745571141,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.015960427820990455,
																		"dt": -0.49990576705532597
																	},
																	"nextHandle": {
																		"dv": -0.033333333333333326,
																		"dt": 1.0440525627136237
																	}
																},
																{
																	"time": 3.0666384780406952,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.9666666666666667,
																		"dt": -0.038011622428894
																	},
																	"nextHandle": {
																		"dv": -0.7333333333333334,
																		"dt": 0.011669411659240847
																	}
																},
																{
																	"time": 3.078307889699936,
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
											"name": "Triangle",
											"x": -0.04833999999999991,
											"y": 0.16405333333333294,
											"z": 24.110760000000006,
											"scaleX": 2.5000000000000004,
											"scaleY": 2.5000000000000004,
											"scaleZ": 2.5,
											"rotationX": 0.9999999999999996,
											"rotationY": 2.2069531490250796e-32,
											"rotationZ": -1.2722218725854065e-14,
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
															"emissive": 40
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
														"texture": "Fx/Alphas/T_Triangle_128.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.8381562745571141,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.015960427820990455,
																		"dt": -0.49990576705532597
																	},
																	"nextHandle": {
																		"dv": -0.033333333333333326,
																		"dt": 1.0440525627136237
																	}
																},
																{
																	"time": 3.0666384780406952,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.9666666666666667,
																		"dt": -0.038011622428894
																	},
																	"nextHandle": {
																		"dv": -0.7333333333333334,
																		"dt": 0.011669411659240847
																	}
																},
																{
																	"time": 3.078307889699936,
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
									"type": "object",
									"name": "PatternLights",
									"children": [
										{
											"type": "polygon",
											"name": "Purple",
											"x": 0.39351,
											"y": -0.35845,
											"z": 3.6,
											"scaleX": 77,
											"scaleY": 77,
											"scaleZ": 77,
											"rotationZ": 8.155268414009016e-17,
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.3,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_CircuitPattern_VerniusBase04.png",
														"uvShift": [
															0,
															0.05
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
															0.33725490196078434,
															0.27058823529411763,
															0.984313725490196
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
												},
												{
													"type": "shader",
													"name": "AlphaKill",
													"source": "shaders/AlphaKill.hx",
													"props": {
														"threshold": 0.001,
														"useRGB": false
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
														"progress": 0.35,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 1,
														"texture": "Fx/noise/DissolveCircuit.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.01,
															-0.04
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "Light",
											"x": 0.39351,
											"y": -0.35845,
											"z": 3.6,
											"scaleX": 77,
											"scaleY": 77,
											"scaleZ": 77,
											"rotationZ": 8.155268414009016e-17,
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
															"emissive": 40
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_CircuitPattern_VerniusBase03.png",
														"uvShift": [
															0,
															0.05
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
														"progress": 0.31,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/circGrad3.jpg",
														"uvShift": [
															0,
															0.05
														],
														"uvShiftSpeed": [
															0,
															0
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
																		"position": 0.30859375,
																		"color": -12444212
																	},
																	{
																		"position": 1,
																		"color": -4033215
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
													"name": "AlphaKill",
													"source": "shaders/AlphaKill.hx",
													"props": {
														"threshold": 0.001,
														"useRGB": false
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.6
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.8381562745571141,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.015960427820990455,
																		"dt": -0.49990576705532597
																	},
																	"nextHandle": {
																		"dv": -0.033333333333333326,
																		"dt": 1.0440525627136237
																	}
																},
																{
																	"time": 3.0666384780406952,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.9666666666666667,
																		"dt": -0.038011622428894
																	},
																	"nextHandle": {
																		"dv": -0.7333333333333334,
																		"dt": 0.011669411659240847
																	}
																},
																{
																	"time": 3.078307889699936,
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
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.7,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "SmallExplosions",
							"x": 2.82631875,
							"y": -2.0158674999999997,
							"z": 3.01002375,
							"children": [
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
									"x": -15.13156,
									"y": -13.44463,
									"z": 0.88386,
									"scaleX": 1.4,
									"scaleY": 1.4,
									"scaleZ": 1.4,
									"rotationX": 38.8,
									"rotationY": -44.9,
									"rotationZ": 34.5,
									"time": 0.13177
								},
								{
									"type": "subFX",
									"name": "06 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
									"x": 2.01831,
									"y": 18.39659,
									"z": 0.34068,
									"rotationX": -21.4,
									"time": 0.32437
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
									"name": "FX_VerniusBase_TowerExplosions",
									"source": "Fx/Structure/Vernius/FX_VerniusBase_TowerExplosions_Photosensitive.fx",
									"x": -2.36314,
									"y": 2.803138571428571,
									"z": -1.6610814285714288,
									"scaleX": 0.6666666666666666,
									"scaleY": 0.6666666666666666,
									"scaleZ": 0.6666666666666666,
									"time": 0.655
								}
							]
						}
					]
				}
			]
		}
	]
}