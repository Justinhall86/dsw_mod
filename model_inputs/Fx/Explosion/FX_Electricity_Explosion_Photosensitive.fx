{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 15,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 50,
			"scaleY": 50,
			"scaleZ": 50,
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
			"scaleX": 0.75,
			"scaleY": 0.75,
			"scaleZ": 0.75,
			"children": [
				{
					"type": "object",
					"name": "ExplosionSize",
					"scaleX": 1.75,
					"scaleY": 1.75,
					"scaleZ": 1.75,
					"children": [
						{
							"type": "object",
							"name": "Anticipation",
							"enabled": false,
							"z": 1.6399999999999997,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"children": [
								{
									"type": "emitter",
									"name": "LensFlare",
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
											360
										],
										"instScale": 12,
										"emitType": "Burst",
										"burstDelay": 0.12,
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"warmUpTime": -0.1,
										"instOffset": [
											0,
											1,
											0
										],
										"lifeTime": 0.04,
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
									"y": 5.551115123125783e-17,
									"scaleX": 0.09999999999999999,
									"scaleY": 0.09999999999999998,
									"scaleZ": 0.09999999999999998,
									"rotationX": 70,
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
															"culling": "Back",
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": true,
															"parallax": 0,
															"textureWrap": true,
															"emissive": 12
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6941176470588235,
															0.4156862745098039,
															0.2588235294117647
														]
													},
													"isInstance": true
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
														"texture": "Fx/Alphas/T_Flare02.png",
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
																		"dv": 0.03352751080665441,
																		"dt": -0.5098493884736074
																	},
																	"nextHandle": {
																		"dv": -0.032222222222222374,
																		"dt": 0.49000000000000005
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
														"range": 1,
														"power": 1
													},
													"isInstance": true
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
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.8,
													"prevHandle": {
														"dv": -0.2031330657866298,
														"dt": -0.011491216884901312
													},
													"nextHandle": {
														"dv": 0.1776762318069669,
														"dt": 0.009999999999999995
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": -0.004036962159623458,
														"dt": -0.8049999999999999
													},
													"nextHandle": {
														"dv": 0.0016825760508064648,
														"dt": 0.3333076171372348
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "LensFlare_blue",
									"props": {
										"alignMode": "Screen",
										"instScale_rand": 1,
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
											360
										],
										"instScale": 6.5,
										"emitType": "Burst",
										"burstDelay": 0.12,
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											1,
											0.2,
											0
										],
										"warmUpTime": -0.1,
										"instOffset": [
											0,
											1,
											0
										],
										"lifeTime": 0.08,
										"seedGroup": 2,
										"burstParticleCount": 2,
										"instStretch": [
											2,
											1,
											1
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
									"y": 5.551115123125783e-17,
									"scaleX": 0.09999999999999999,
									"scaleY": 0.09999999999999998,
									"scaleZ": 0.09999999999999998,
									"rotationX": 70,
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
															"culling": "Back",
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": true,
															"parallax": 0,
															"textureWrap": true,
															"emissive": 8
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.34901960784313724,
															0.18823529411764706,
															0.47058823529411764
														]
													},
													"isInstance": true
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
														"alpha": 0.2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare04.png",
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
																		"dv": 0.03352751080665441,
																		"dt": -0.5098493884736074
																	},
																	"nextHandle": {
																		"dv": -0.032222222222222374,
																		"dt": 0.49000000000000005
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
														"range": 1,
														"power": 1
													},
													"isInstance": true
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
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.8,
													"prevHandle": {
														"dv": -0.2031330657866298,
														"dt": -0.011491216884901312
													},
													"nextHandle": {
														"dv": 0.1776762318069669,
														"dt": 0.009999999999999995
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": -0.004036962159623458,
														"dt": -0.8049999999999999
													},
													"nextHandle": {
														"dv": 0.0016825760508064648,
														"dt": 0.3333076171372348
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_flaremult",
									"props": {
										"lifeTime": 0.1,
										"lifeTimeRand": 0.01,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"emitType": "Burst",
										"burstDelay": 0.08,
										"instScale": 4,
										"instStretch": [
											9,
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
									"scaleX": 0.125,
									"scaleY": 0.125,
									"scaleZ": 0.125,
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
															"emissive": 15
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
														"alpha": 0.4,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare06_512.png"
													}
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
															1,
															0.4588235294117647,
															0.12156862745098039
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.6,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
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
						},
						{
							"type": "object",
							"name": "TestElec1",
							"enabled": false,
							"rotationZ": 35.2,
							"children": [
								{
									"type": "object",
									"name": "ElecSides",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
									"children": [
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": 1.42627,
											"y": 0.03562,
											"scaleX": 0.25,
											"scaleY": 0.2,
											"scaleZ": 0.15,
											"rotationZ": 77.7,
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
															"emissive": 3
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": false,
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
																	"time": 0.4401433636261846,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.614990515656095,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8264703681371023,
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.25,
														"uvScaleY": 0.25,
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
																	"time": 0.40366933658957743,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.44606529275012885,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5005762371035392,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6020709560522163,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8281951084301863,
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
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": -0.71954,
											"y": 0.02499,
											"scaleX": 0.5,
											"scaleY": 0.2,
											"scaleZ": 0.2,
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
															"culling": "Back",
															"colorMask": 255,
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": false,
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
																	"time": 0.34014336362618497,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5149905156560938,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7264703681370986,
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.25,
														"uvScaleY": 0.25,
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
																	"time": 0.3154567106997393,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.3578526668602903,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.41236361121370085,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5138583301623777,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7399824825403478,
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
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": 0.84533,
											"y": 0.40411,
											"z": 0.04946,
											"scaleX": 0.2,
											"scaleY": 0.1,
											"scaleZ": 0.08,
											"rotationX": 8,
											"rotationZ": 133.1,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": false,
														"startFrame": 1,
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
																	"time": 0.34014336362618497,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5149905156560938,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7264703681370986,
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.25,
														"uvScaleY": 0.25,
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
																	"time": 0.3154567106997393,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.3578526668602903,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.41236361121370085,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5138583301623777,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7399824825403478,
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
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": 0.84556,
											"y": -0.49266,
											"z": 0.13601,
											"scaleX": 0.3,
											"scaleY": 0.15,
											"scaleZ": 0.12,
											"rotationX": -0.2,
											"rotationY": 8,
											"rotationZ": 41.9,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": false,
														"startFrame": 1,
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
																	"time": 0.34014336362618497,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5149905156560938,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7264703681370986,
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.25,
														"uvScaleY": 0.25,
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
																	"time": 0.3154567106997393,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.3578526668602903,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.41236361121370085,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5138583301623777,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7399824825403478,
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
								}
							]
						},
						{
							"type": "object",
							"name": "decalsLIGHTS",
							"enabled": false,
							"scaleX": 4.5,
							"scaleY": 4.5,
							"scaleZ": 4.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Light_advancedDecal",
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 3.58,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
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
													"emissive": 6,
													"depthTest": "LessEqual"
												}
											}
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
												"alpha": 0.15,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.03361875557521733,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12825925726854404,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.13825925726854404,
															"value": 0.8,
															"mode": 2
														},
														{
															"time": 0.16361875557521738,
															"value": 0.8,
															"mode": 2
														},
														{
															"time": 0.1786187555752174,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2085503944018744,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2792470573263584,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.34391574833442046,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7818628265819935,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1863074193327504
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1863074193327504
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
													0.6627450980392157,
													0.5647058823529412,
													0.9921568627450981
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.79,
												"ATTENUATE": true,
												"emissiveMap": "Fx/Gradients/z_FillOrange.png"
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Light_advancedDecal",
									"scaleX": 8.999999999999998,
									"scaleY": 8.999999999999998,
									"scaleZ": 6.43,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
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
													"emissive": 6,
													"depthTest": "LessEqual"
												}
											}
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
												"alpha": 0.15,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 0.03361875557521733,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12825925726854404,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.13825925726854404,
															"value": 0.8,
															"mode": 2
														},
														{
															"time": 0.16361875557521738,
															"value": 0.8,
															"mode": 2
														},
														{
															"time": 0.1786187555752174,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2085503944018744,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2792470573263584,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.34391574833442046,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7818628265819935,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.1863074193327504
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1863074193327504
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.03361875557521733,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12825925726854404,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.13825925726854404,
															"value": 0.8,
															"mode": 2
														},
														{
															"time": 0.16361875557521738,
															"value": 0.8,
															"mode": 2
														},
														{
															"time": 0.1786187555752174,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2085503944018744,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2792470573263584,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.34391574833442046,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4789741186425882,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 0.5111004314783716,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5519884659966413,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 0.5884956396736678,
															"value": 0.9,
															"mode": 2
														},
														{
															"time": 0.6308439611390186,
															"value": 0.1,
															"mode": 2
														},
														{
															"time": 0.6731922826043694,
															"value": 0.7,
															"mode": 2
														},
														{
															"time": 0.711159743228477,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7432860560642603,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.7818628265819935,
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
													0.6627450980392157,
													0.5647058823529412,
													0.9921568627450981
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.79,
												"ATTENUATE": true,
												"emissiveMap": "Fx/Gradients/z_FillOrange.png"
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
										"alpha": 0.7
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Spikes",
							"enabled": false,
							"scaleX": 1.4,
							"scaleY": 1.4,
							"scaleZ": 1.4,
							"children": [
								{
									"type": "emitter",
									"name": "SPIKES",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 4,
										"frameDivisionY": 2,
										"animationSpeed": 0,
										"instSpeed": [
											0,
											0,
											6
										],
										"instStretch": [
											1.7,
											1.7,
											0.9
										],
										"lifeTime": 0.5,
										"lifeTimeRand": 0.1,
										"emitType": "Burst",
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"seedGroup": 1,
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
											1
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
											360
										],
										"frameDivisionX": 2,
										"warmUpTime": -0.2,
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
									"scaleX": 0.1225,
									"scaleY": 0.1225,
									"scaleZ": 0.09799999999999999,
									"children": [
										{
											"type": "model",
											"name": "CylinderCone_StraightUV",
											"source": "Fx/Meshes_Common/CylinderCone_StraightUV.fbx",
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": 90,
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
															"emissive": 18,
															"drawOrder": "100"
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 2,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_SpikesExplo.png",
														"onDecal": false
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
													}
												},
												{
													"type": "shader",
													"name": "DissolveMapNoise",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 10,
														"uvScaleY": 1,
														"texture": "Fx/noise/clouds_Dissolve.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.2
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
																	"value": 0.8,
																	"prevHandle": {
																		"dv": 1.4807997904821406,
																		"dt": -0.4951636786304198
																	},
																	"nextHandle": {
																		"dv": -0.8169921875000001,
																		"dt": 0.27309197069853475
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
											"type": "curve",
											"name": "instStretch.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.6,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
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
													"value": 0.6,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.6,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
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
														"dv": 3.0890297805850073,
														"dt": -0.11575828486016804
													},
													"nextHandle": {
														"dv": -0.9363636363636363,
														"dt": 0.03508928571428571
													}
												},
												{
													"time": 0.6549999999999999,
													"value": 0,
													"prevHandle": {
														"dv": -0.009090909090909038,
														"dt": -0.6245892857142856
													},
													"nextHandle": {
														"dv": 0.008774267419493307,
														"dt": 0.6028344762228577
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "SPIKESBIG",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 4,
										"frameDivisionY": 2,
										"animationSpeed": 0,
										"instSpeed": [
											0,
											0,
											6.5
										],
										"instStretch": [
											1,
											1,
											1.5
										],
										"lifeTime": 0.5,
										"lifeTimeRand": 0.1,
										"emitType": "Burst",
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0.25,
										"seedGroup": 2,
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
											1
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
											360
										],
										"frameDivisionX": 2,
										"warmUpTime": -0.2,
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
									"scaleX": 0.1225,
									"scaleY": 0.1225,
									"scaleZ": 0.09799999999999999,
									"children": [
										{
											"type": "model",
											"name": "CylinderCone_StraightUV",
											"source": "Fx/Meshes_Common/CylinderCone_StraightUV.fbx",
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": 90,
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
															"emissive": 9,
															"drawOrder": "100"
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1.2,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_SpikesExplo2.png",
														"onDecal": false
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
													"name": "DissolveMapNoise",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 10,
														"uvScaleY": 1,
														"texture": "Fx/noise/clouds_Dissolve.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.2
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
																	"value": 0.8,
																	"prevHandle": {
																		"dv": 1.4807997904821406,
																		"dt": -0.4951636786304198
																	},
																	"nextHandle": {
																		"dv": -0.8169921875000001,
																		"dt": 0.27309197069853475
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
													"value": 0.6,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
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
														"dv": 3.0890297805850073,
														"dt": -0.11575828486016804
													},
													"nextHandle": {
														"dv": -0.9363636363636363,
														"dt": 0.03508928571428571
													}
												},
												{
													"time": 0.6549999999999999,
													"value": 0,
													"prevHandle": {
														"dv": -0.009090909090909038,
														"dt": -0.6245892857142856
													},
													"nextHandle": {
														"dv": 0.008774267419493307,
														"dt": 0.6028344762228577
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "shake",
									"keys": [
										{
											"time": 0.23977783300642097,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.2874532778372225,
											"value": 0.1,
											"mode": 2
										},
										{
											"time": 0.7305516964038681,
											"value": 0,
											"mode": 2
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
							"type": "object",
							"name": "ElecBall",
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"children": [
								{
									"type": "emitter",
									"name": "Fireball",
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
											0.9215686274509803,
											0.9215686274509803,
											0.9215686274509803,
											0.8509803921568627
										],
										"emitRate": 1,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 32,
										"frameDivisionX": 8,
										"frameDivisionY": 8,
										"instScale": 8,
										"emitType": "Burst",
										"burstDelay": 0.15,
										"instStretch_rand": [
											0,
											0,
											0
										],
										"emitShape": "Cylinder",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.2,
										"lifeTime": 0.8,
										"warmUpTime": -0.1,
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
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.01,
									"rotationZ": 43.6,
									"children": [
										{
											"type": "model",
											"name": "Sphere",
											"source": "Fx/Meshes_Common/Sphere.fbx",
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
															"emissive": 2,
															"drawOrder": "100"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.3686274509803922,
															0.5019607843137255,
															0.984313725490196
														]
													}
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": false,
														"bias": 0,
														"scale": 0.8,
														"power": 1,
														"color": [
															0,
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
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_ElecNoise04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.1,
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
																	"value": 0.4,
																	"prevHandle": {
																		"dv": 8.202246436850491e-17,
																		"dt": -0.500881567620076
																	},
																	"nextHandle": {
																		"dv": -0.0015302978953423696,
																		"dt": 0.8591645079416971
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
																	"value": 0
																},
																{
																	"time": 0.2,
																	"value": 0.4,
																	"prevHandle": {
																		"dv": -0.00102462976511953,
																		"dt": -0.17557097179173967
																	},
																	"nextHandle": {
																		"dv": 0.005779539233576769,
																		"dt": 0.7108904626407695
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26666666666666666
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
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"enabled": false,
													"props": {
														"minAlpha": 0.25,
														"maxAlpha": 1,
														"frequency": 10
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
																		"color": -9609477
																	},
																	{
																		"position": 0.859375,
																		"color": -2884609
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
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.012707392165911546,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.05166666666666666
													}
												},
												{
													"time": 0.05499999999999999,
													"value": 0.5,
													"prevHandle": {
														"dv": -0.6178478332448459,
														"dt": -0.024810868515554432
													},
													"nextHandle": {
														"dv": 0.8715807006116155,
														"dt": 0.03500000000000003
													}
												},
												{
													"time": 0.1632489938086334,
													"value": 0.377995077377486,
													"prevHandle": {
														"dv": -0.8420405797302535,
														"dt": -0.047357858541927186
													},
													"nextHandle": {
														"dv": 1.0387026126594483,
														"dt": 0.058402580568012785
													}
												},
												{
													"time": 1,
													"value": 1.5,
													"prevHandle": {
														"dv": -0.002554229203557634,
														"dt": -0.7890001093779907
													},
													"nextHandle": {
														"dv": -1.9722789542853837e-16,
														"dt": 0.2655544337943571
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "FireballUNI",
									"enabled": false,
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
											0.9215686274509803,
											0.9215686274509803,
											0.9215686274509803,
											0.8509803921568627
										],
										"emitRate": 1,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 32,
										"frameDivisionX": 8,
										"frameDivisionY": 8,
										"instScale": 8,
										"emitType": "Burst",
										"burstDelay": 0.15,
										"instStretch_rand": [
											0,
											0,
											0
										],
										"emitShape": "Cylinder",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.2,
										"lifeTime": 0.8,
										"warmUpTime": -0.1,
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
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.01,
									"rotationZ": 43.6,
									"children": [
										{
											"type": "model",
											"name": "Sphere",
											"source": "Fx/Meshes_Common/Sphere.fbx",
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
															"emissive": 16,
															"drawOrder": "100"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.3686274509803922,
															0.5019607843137255,
															0.984313725490196
														]
													}
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": true,
														"bias": 0.35,
														"scale": 0.8,
														"power": 1,
														"color": [
															0,
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
														"alpha": 0.5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.35,
																	"mode": 2
																},
																{
																	"time": 0.05472450543279493,
																	"value": 0.35,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16579802372328897
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.11828134200396279
																	}
																},
																{
																	"time": 0.39880648073859687,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.024955249327346968,
																		"dt": -0.18220283645664254
																	},
																	"nextHandle": {
																		"dv": -0.06998440664266449,
																		"dt": 0.4986246691916147
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
													"value": 0.012707392165911546,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.05166666666666666
													}
												},
												{
													"time": 0.05499999999999999,
													"value": 0.5,
													"prevHandle": {
														"dv": -0.6178478332448459,
														"dt": -0.024810868515554432
													},
													"nextHandle": {
														"dv": 0.8715807006116155,
														"dt": 0.03500000000000003
													}
												},
												{
													"time": 0.1632489938086334,
													"value": 0.377995077377486,
													"prevHandle": {
														"dv": -0.8420405797302535,
														"dt": -0.047357858541927186
													},
													"nextHandle": {
														"dv": 1.0387026126594483,
														"dt": 0.058402580568012785
													}
												},
												{
													"time": 1,
													"value": 1.5,
													"prevHandle": {
														"dv": -0.002554229203557634,
														"dt": -0.7890001093779907
													},
													"nextHandle": {
														"dv": -1.9722789542853837e-16,
														"dt": 0.2655544337943571
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "FireballElec",
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
											0.9215686274509803,
											0.9215686274509803,
											0.9215686274509803,
											0.8509803921568627
										],
										"emitRate": 1,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 32,
										"frameDivisionX": 8,
										"frameDivisionY": 8,
										"instScale": 8.1,
										"emitType": "Burst",
										"burstDelay": 0.15,
										"instStretch_rand": [
											0,
											0,
											0
										],
										"emitShape": "Cylinder",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.2,
										"lifeTime": 0.8,
										"warmUpTime": -0.1,
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
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.01,
									"rotationZ": 43.6,
									"children": [
										{
											"type": "model",
											"name": "Sphere",
											"source": "Fx/Meshes_Common/Sphere.fbx",
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
															"emissive": 2,
															"drawOrder": "100"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6666666666666666,
															0.7372549019607844,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": false,
														"bias": 0,
														"scale": 0.8,
														"power": 1,
														"color": [
															0,
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
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 0.8,
														"uvScaleX": 4,
														"uvScaleY": 4,
														"texture": "Fx/noise/clouds_Dissolve.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keys": [
																{
																	"time": 0.45941968237085323,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 0.4963373354185111,
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
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.33,
														"saturation": 1,
														"width": 0.8,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_ElecNoise03.png",
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
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"enabled": false,
													"props": {
														"minAlpha": 0.25,
														"maxAlpha": 1,
														"frequency": 10
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
																		"position": 0.26171875,
																		"color": -9609477
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
													"name": "WorldUV",
													"source": "shaders/WorldUV.hx",
													"props": {
														"useNormalMap": false,
														"onDecal": false,
														"scale": 0.025,
														"rotation": 0
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
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.05166666666666666
													}
												},
												{
													"time": 0.05499999999999999,
													"value": 0.5,
													"prevHandle": {
														"dv": -0.6178478332448459,
														"dt": -0.024810868515554432
													},
													"nextHandle": {
														"dv": 0.8715807006116155,
														"dt": 0.03500000000000003
													}
												},
												{
													"time": 0.1632489938086334,
													"value": 0.377995077377486,
													"prevHandle": {
														"dv": -0.8420405797302535,
														"dt": -0.047357858541927186
													},
													"nextHandle": {
														"dv": 1.0387026126594483,
														"dt": 0.058402580568012785
													}
												},
												{
													"time": 1,
													"value": 1.5,
													"prevHandle": {
														"dv": -0.002554229203557634,
														"dt": -0.7890001093779907
													},
													"nextHandle": {
														"dv": -1.9722789542853837e-16,
														"dt": 0.2655544337943571
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_ElecticiteFin",
									"enabled": false,
									"props": {
										"alignMode": "Screen",
										"lifeTime": 0.25,
										"lifeTimeRand": 0.05,
										"maxCount": 40,
										"frameCount": 4,
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"animationLoop": false,
										"instScale": 1.7,
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
										"emitRate": 20,
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"emitAngle": 360,
										"emitSurface": true,
										"seedGroup": 1,
										"warmUpTime": -0.3,
										"emitType": "Burst",
										"burstParticleCount": 3,
										"burstCount": 4,
										"burstDelay": 0.1,
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
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
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
															"emissive": 5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
									}
								},
								{
									"type": "model",
									"name": "Sphere",
									"source": "Fx/Meshes_Common/Sphere.fbx",
									"enabled": false,
									"scaleX": 5.7,
									"scaleY": 5.7,
									"scaleZ": 5.7,
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
													"drawOrder": "110",
													"emissive": 2
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0,
												"scale": 1,
												"power": 2.5,
												"color": [
													0,
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
															"time": 0.14751742227891762,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15320269351377439,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.177939885875319,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.18706662495423942,
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
													0.13725490196078433,
													0.10588235294117647,
													0.1843137254901961
												]
											},
											"isInstance": true
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