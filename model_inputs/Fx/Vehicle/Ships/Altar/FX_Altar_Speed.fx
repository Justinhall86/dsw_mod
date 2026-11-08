{
	"type": "fx",
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
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent"
						}
					]
				},
				{
					"type": "object",
					"name": "Lights",
					"y": -0.83473,
					"z": 1.87566,
					"children": [
						{
							"type": "model",
							"name": "CrossPlanes",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": 0.98814,
							"y": 0.41257,
							"z": -0.94236,
							"scaleX": 0.6500000000000001,
							"scaleY": 0.6500000000000001,
							"scaleZ": 0.65,
							"rotationY": 71.3,
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
											"parallax": 0,
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.125,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare07_glow.png",
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
											0.6941176470588235,
											0.4784313725490196
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 3
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CrossPlanes",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": -0.99234,
							"y": 0.41257,
							"z": -0.9682,
							"scaleX": 0.6500000000000001,
							"scaleY": 0.6500000000000001,
							"scaleZ": 0.65,
							"rotationY": -71.3,
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
											"parallax": 0,
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.125,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare07_glow.png",
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
											0.6941176470588235,
											0.4784313725490196
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 3
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CrossPlanes",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": 0.57831,
							"y": 1.71588,
							"z": -4.50234,
							"scaleX": 0.6500000000000001,
							"scaleY": 0.6500000000000001,
							"scaleZ": 0.65,
							"rotationY": 164.2,
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
											"parallax": 0,
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.125,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare07_glow.png",
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
											0.6941176470588235,
											0.4784313725490196
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 3
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CrossPlanes",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": -0.52933,
							"y": 1.71588,
							"z": -4.43003,
							"scaleX": 0.6500000000000001,
							"scaleY": 0.6500000000000001,
							"scaleZ": 0.65,
							"rotationY": -163.7,
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
											"parallax": 0,
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.125,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare07_glow.png",
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
											0.6941176470588235,
											0.4784313725490196
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 3
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CrossPlanes",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": 0.37341,
							"y": 0.27461,
							"z": 1.49323,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
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
											"parallax": 0,
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.125,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare07_glow.png",
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
											0.6941176470588235,
											0.4784313725490196
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 3
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CrossPlanes",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": -0.35604,
							"y": 0.27461,
							"z": 1.49323,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
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
											"parallax": 0,
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.125,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare07_glow.png",
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
											0.6941176470588235,
											0.4784313725490196
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 3
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CrossPlanes",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": -0.00229,
							"y": 0.41694,
							"z": 1.24642,
							"scaleX": 0.65,
							"scaleY": 0.65,
							"scaleZ": 0.65,
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
											"parallax": 0,
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.125,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare07_glow.png",
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
											0.6941176470588235,
											0.4784313725490196
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 3
									}
								}
							]
						},
						{
							"type": "trails",
							"name": "trails_Light",
							"x": 0.59846,
							"y": 1.73847,
							"z": -5.0541,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
							"startWidth": 0.5,
							"lifetime": 1.5,
							"minSpeed": 1,
							"uvRepeat": "EClamp",
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
											"emissive": 1
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/uGrad_inv.png"
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.6431372549019607,
											0.2196078431372549
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.25
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.01,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "trails",
							"name": "trails_Light",
							"x": -0.64919,
							"y": 1.73847,
							"z": -5.0541,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
							"startWidth": 0.5,
							"lifetime": 1.5,
							"minSpeed": 1,
							"uvRepeat": "EClamp",
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
											"emissive": 1
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/uGrad_inv.png"
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.6431372549019607,
											0.2196078431372549
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.25
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.01,
											"value": 1,
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
									0.996078431372549,
									0.5294117647058824,
									0.20392156862745098
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "Reactor",
					"scaleX": 1.5,
					"scaleY": 1.5,
					"scaleZ": 1.5,
					"rotationY": -90,
					"rotationZ": 90,
					"children": [
						{
							"type": "object",
							"name": "WingsEmitters",
							"props": {
								"tag": "Used by code"
							},
							"z": 1.8944,
							"rotationX": 90,
							"rotationY": 90,
							"children": [
								{
									"type": "object",
									"name": "WingsLeft",
									"x": 1.7801974999999999,
									"y": -0.48334,
									"z": -1.019315,
									"children": [
										{
											"type": "object",
											"name": "Wing4",
											"x": 0.07298,
											"y": -0.71451,
											"z": 0.13621,
											"scaleX": 1.4999999999999993,
											"scaleY": 1.5000000000000002,
											"scaleZ": 1.4999999999999993,
											"rotationX": 55.6,
											"rotationY": 132.4,
											"rotationZ": 63.4,
											"children": [
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000004,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.010000000000000004,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000002,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.01,
													"rotationX": 90,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Wing3",
											"x": 0.011932500000000346,
											"y": -0.22020999999999996,
											"z": -0.13739499999999993,
											"scaleX": 1.5000000000000002,
											"scaleY": 1.5000000000000002,
											"scaleZ": 1.5000000000000002,
											"rotationX": 40.60000000000002,
											"rotationY": 120.10000000000001,
											"rotationZ": 44.9,
											"children": [
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000004,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.010000000000000004,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000002,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.01,
													"rotationX": 90,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Wing2",
											"x": -0.05458749999999957,
											"y": 0.2649800000000001,
											"z": -0.10875499999999994,
											"scaleX": 1.5000000000000002,
											"scaleY": 1.5,
											"scaleZ": 1.5000000000000002,
											"rotationX": 1.6301505568943632e-17,
											"rotationY": 112.4,
											"rotationZ": 0.1,
											"children": [
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000004,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.010000000000000004,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000002,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.01,
													"rotationX": 90,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Wing1",
											"x": -0.03032749999999984,
											"y": 0.6697400000000001,
											"z": 0.109935,
											"scaleX": 1.5000000000000002,
											"scaleY": 1.5000000000000002,
											"scaleZ": 1.5000000000000002,
											"rotationX": -48.69999999999999,
											"rotationY": 125.1,
											"rotationZ": -54.29999999999998,
											"children": [
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000004,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.010000000000000004,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000002,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.01,
													"rotationX": 90,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
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
								},
								{
									"type": "object",
									"name": "WingsRight",
									"x": 1.7802,
									"y": -0.46328,
									"z": 1.33592,
									"children": [
										{
											"type": "object",
											"name": "Wing4",
											"x": 0.0615,
											"y": -0.73743,
											"z": -0.44799,
											"scaleX": 1.4999999999999993,
											"scaleY": 1.5000000000000002,
											"scaleZ": 1.4999999999999993,
											"rotationY": -139.6,
											"rotationZ": 63.4,
											"children": [
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000004,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.010000000000000004,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 3,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4
													},
													"scaleX": 0.010000000000000002,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.01,
													"rotationX": 90,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Wing3",
											"x": 0.011932500000000346,
											"y": -0.22020999999999996,
											"z": -0.13739499999999993,
											"scaleX": 1.5000000000000002,
											"scaleY": 1.5000000000000002,
											"scaleZ": 1.5000000000000002,
											"rotationX": 40.60000000000002,
											"rotationY": -120.10000000000001,
											"rotationZ": 44.9,
											"children": [
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000004,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.010000000000000004,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000002,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.01,
													"rotationX": 90,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Wing2",
											"x": -0.04448,
											"y": 0.265,
											"z": -0.13329,
											"scaleX": 1.5000000000000002,
											"scaleY": 1.5,
											"scaleZ": 1.5000000000000002,
											"rotationY": -112.4,
											"rotationZ": 0.1,
											"children": [
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000004,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.010000000000000004,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000002,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.01,
													"rotationX": 90,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Wing1",
											"x": -0.08884,
											"y": 0.74788,
											"z": -0.2322,
											"scaleX": 1.5000000000000002,
											"scaleY": 1.5000000000000002,
											"scaleZ": 1.5000000000000002,
											"rotationX": -48.7,
											"rotationY": -125.1,
											"rotationZ": -54.3,
											"children": [
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 2,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4,
														"maxCount": 2
													},
													"scaleX": 0.010000000000000004,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.010000000000000004,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
																		]
																	},
																	"isInstance": true
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "emitter",
													"props": {
														"lifeTimeRand": 0.5,
														"emitRate": 3,
														"enableSort": false,
														"frameCount": 9,
														"frameDivisionX": 3,
														"frameDivisionY": 3,
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_01.png",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"useRandomColor": true,
														"randomColor1": [
															0.6588235294117647,
															0.6588235294117647,
															0.6588235294117647,
															1
														],
														"animationSpeed": 4
													},
													"scaleX": 0.010000000000000002,
													"scaleY": 0.010000000000000002,
													"scaleZ": 0.01,
													"rotationX": 90,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.75,
															"scaleY": 0.75,
															"scaleZ": 0.75,
															"rotationY": 90,
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
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"props": {
																		"scale": 0.6
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaKill",
																	"source": "shaders/AlphaKill.hx",
																	"props": {
																		"threshold": 0.1,
																		"useRGB": false
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
																			0.1411764705882353,
																			0.1411764705882353,
																			0.1411764705882353
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
						},
						{
							"type": "object",
							"name": "wind",
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.25,
							"rotationZ": 180,
							"children": [
								{
									"type": "model",
									"name": "CurvedPlan",
									"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
									"x": 7.68238,
									"y": 0.30015,
									"z": 1.20759,
									"scaleX": 24,
									"scaleY": 24,
									"scaleZ": 14,
									"rotationX": -90,
									"rotationY": 90,
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
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad01.png",
												"onDecal": false
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
												"progress": 0.35,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Noise_DirectionalWind.png",
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
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.45,
												"sandColorSet": false,
												"envBlend": 0.4,
												"envColorSet": false
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
												"power": 1
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "CurvedPlan",
									"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
									"x": 7.36674,
									"y": 0.30015,
									"z": 1.20759,
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 13,
									"rotationX": -90,
									"rotationY": 90,
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
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad01.png",
												"onDecal": false
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
												"progress": 0.38,
												"saturation": 0,
												"width": 0.28,
												"uvScaleX": 1,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.24
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
												"progress": 0.7,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 0.08,
												"texture": "Fx/noise/perlin06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.15
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.45,
												"sandColorSet": false,
												"envBlend": 0.4,
												"envColorSet": false
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
												"power": 1
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
										"alpha": 1.2
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
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
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
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Reactor",
					"target": "FXAnimation.FXRoot.Altar.root.B_RootJ.B_MainStructureJ"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Lights",
					"target": "FXAnimation.FXRoot.Altar.root.B_RootJ.B_MainStructureJ"
				},
				{
					"type": "light",
					"name": "light_0",
					"editorOnly": true,
					"y": 2.98887,
					"z": -4.03598,
					"power": 2.42,
					"range": 20,
					"size": 2.05,
					"zNear": 0.02
				}
			]
		}
	]
}