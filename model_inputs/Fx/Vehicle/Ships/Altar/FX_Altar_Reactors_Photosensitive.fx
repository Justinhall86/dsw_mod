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
					"name": "Altar_Fabric",
					"source": "Vehicle/Fremen/Altar/Altar_Balloon.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6
				},
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 2,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 3,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 2,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 3,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 2,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 3,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 2,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 3,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 2,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 3,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 2,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 3,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 2,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 3,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 2,
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
														"spriteSheet": "Fx/Alphas/T_Wings_3x3_04.png",
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
														"animationSpeed": 3,
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
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Reactor",
					"target": "FXAnimation.FXRoot.Altar.root.B_RootJ.B_MainJ"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Lights",
					"target": "FXAnimation.FXRoot.Altar.root.B_RootJ.B_MainJ"
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