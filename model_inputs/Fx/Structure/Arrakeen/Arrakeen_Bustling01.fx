{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "model",
			"name": "BaseArrakeen",
			"source": "Structure/Base/Arrakeen/BaseArrakeen.fbx",
			"locked": true,
			"lockAnimation": true,
			"children": [
				{
					"type": "model",
					"name": "RIG_BaseArrakeen_Ships",
					"source": "Structure/Base/Arrakeen/RIG_BaseArrakeen_Ships.fbx",
					"locked": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Structure/Base/Arrakeen/Anim_BaseArrakeen_Ships.fbx"
						}
					]
				},
				{
					"type": "model",
					"name": "RIG_BaseArrakeen_Doors",
					"source": "Structure/Base/Arrakeen/RIG_BaseArrakeen_Doors.fbx",
					"locked": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Structure/Base/Arrakeen/Anim_BaseArrakeen_Doors.fbx"
						}
					]
				}
			]
		},
		{
			"type": "model",
			"name": "Arrakeen_TubeSpotlight",
			"source": "Fx/Test/Arrakeen_TubeSpotlight.fbx",
			"x": -19.33,
			"y": 9.51,
			"z": 2.49,
			"scaleX": 0.02,
			"scaleY": 0.02,
			"scaleZ": 0.06,
			"children": [
				{
					"type": "material",
					"name": "material",
					"props": {
						"PBR": {
							"mode": "BeforeTonemapping",
							"blend": "Add",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false,
							"emissive": 1
						}
					},
					"diffuseMap": "Fx/Gradients/vGrad.png",
					"color": [
						0.47058823529411764,
						0.22745098039215686,
						0.14509803921568626,
						1
					]
				},
				{
					"type": "shader",
					"name": "AlphaMap",
					"source": "shaders/AlphaMap.hx",
					"props": {
						"useSourceUVs": false,
						"wrap": false,
						"invert": false,
						"replace": false,
						"alpha": 1,
						"uScale": 1,
						"vScale": 0.36,
						"uOffset": 1,
						"vOffset": 0.21,
						"texture": "Fx/Gradients/vGrad.png"
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
									"mode": 2
								},
								{
									"time": 0.924196307640523,
									"value": 1,
									"mode": 0
								},
								{
									"time": 1.5,
									"value": 0,
									"mode": 0
								},
								{
									"time": 2,
									"value": 0,
									"mode": 0
								},
								{
									"time": 2.48291039986536,
									"value": 1,
									"mode": 0
								},
								{
									"time": 3.02,
									"value": 0.55,
									"mode": 0
								},
								{
									"time": 3.440870102378541,
									"value": 1,
									"mode": 0
								},
								{
									"time": 3.9442048613261447,
									"value": 0,
									"mode": 0
								},
								{
									"time": 4.4150664100190635,
									"value": 0,
									"mode": 0
								},
								{
									"time": 5,
									"value": 1,
									"mode": 0
								}
							]
						}
					],
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
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.105,
									"value": 1.067795138888889,
									"mode": 2
								},
								{
									"time": 0.265,
									"value": 0.9711631944444445,
									"mode": 2
								},
								{
									"time": 0.335,
									"value": 1.0362847222222222,
									"mode": 2
								},
								{
									"time": 0.41500000000000004,
									"value": 0.9312500000000001,
									"mode": 2
								},
								{
									"time": 0.6849999999999999,
									"value": 1.029982638888889,
									"mode": 2
								},
								{
									"time": 0.855,
									"value": 0.9102430555555556,
									"mode": 2
								},
								{
									"time": 1.0799999999999998,
									"value": 1.067795138888889,
									"mode": 2
								},
								{
									"time": 1.295,
									"value": 0.9480555555555557,
									"mode": 2
								},
								{
									"time": 1.435,
									"value": 1.0341840277777778,
									"mode": 2
								},
								{
									"time": 1.53,
									"value": 0.9564583333333334,
									"mode": 2
								},
								{
									"time": 1.635,
									"value": 1.0698958333333335,
									"mode": 2
								},
								{
									"time": 1.895,
									"value": 0.935451388888889,
									"mode": 2
								},
								{
									"time": 2,
									"value": 1,
									"mode": 2
								}
							]
						}
					],
					"isInstance": true
				}
			],
			"enabled": false
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "emitter",
					"props": {
						"emitShape": "Cylinder",
						"emitAngle": 10,
						"emitRate": 12,
						"instSpeed": [
							0,
							0,
							1
						],
						"maxCount": 100,
						"useRandomColor": true,
						"randomColor1": [
							0.8823529411764706,
							0.5686274509803921,
							0.47058823529411764,
							0.2
						],
						"randomColor2": [
							0.8745098039215686,
							0.7568627450980392,
							0.7215686274509804,
							0.2196078431372549
						],
						"instScale_rand": 0.5,
						"instSpeed_rand": [
							0.1,
							0.1,
							0.25
						],
						"frameCount": 4,
						"frameDivisionX": 2,
						"animationSpeed": 0,
						"animationLoop": false,
						"spriteSheet": "Fx/Test/TXT_SmokeSand_2x2.png",
						"frameDivisionY": 2,
						"lifeTime": 7,
						"alignMode": "Screen",
						"emitRad1": 0.8,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"instScale": 1.5
					},
					"x": -0.04,
					"y": 3.3,
					"z": 11.72,
					"rotationX": 20.8,
					"rotationY": 90,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.16499999999999998,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": -0.005913209396695318,
														"dt": -0.05499284738926684
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.31000000000000005
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 2
												}
											]
										}
									],
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
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -1.603302107923385,
										"dt": -1.0847738468291155
									},
									"nextHandle": {
										"dv": 0.4909090909090909,
										"dt": 0.33214285714285713
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.23913043478260865,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0.15225221562610708,
										"dt": 0.3183455417636787
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instAcceleration.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.036090312121565805,
										"dt": -0.5000208057696871
									},
									"nextHandle": {
										"dv": -0.0465545654296875,
										"dt": 0.6449999999999999
									}
								},
								{
									"time": 0.505,
									"value": -0.2047576904296875,
									"mode": 0,
									"prevHandle": {
										"dv": 0.14081571482888833,
										"dt": -0.1272279795141078
									},
									"nextHandle": {
										"dv": -0.14081571482888833,
										"dt": 0.1272279795141078
									}
								},
								{
									"time": 0.88,
									"value": -1.1803436279296875,
									"mode": 0,
									"prevHandle": {
										"dv": -0.2551236795769372,
										"dt": -0.11525828170225964
									},
									"nextHandle": {
										"dv": 0.2551236795769372,
										"dt": 0.11525828170225964
									}
								},
								{
									"time": 0.97,
									"value": -0.0465545654296875,
									"mode": 0,
									"prevHandle": {
										"dv": -0.685546875,
										"dt": -0.15000000000000002
									},
									"nextHandle": {
										"dv": 1.2109272505903252,
										"dt": 0.26736516506531743
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instAcceleration.x",
							"keyMode": 1,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.4,
									"value": -0.0661892361111111,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.16666666666666666
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.16666666666666666
									}
								},
								{
									"time": 0.875,
									"value": -0.455078125,
									"mode": 1,
									"prevHandle": {
										"dv": -0.009368927878953099,
										"dt": -0.1582974054427935
									},
									"nextHandle": {
										"dv": 0.20833333333333337,
										"dt": 0.05999999999999994
									}
								},
								{
									"time": 1,
									"value": 0.0032552083333333335,
									"mode": 0,
									"prevHandle": {
										"dv": -0.1111111111111111,
										"dt": -0.09500000000000008
									},
									"nextHandle": {
										"dv": 0.1111111111111111,
										"dt": 0.09500000000000008
									}
								}
							]
						}
					],
					"enabled": false
				},
				{
					"type": "emitter",
					"name": "emitter",
					"props": {
						"emitShape": "Cylinder",
						"emitAngle": 10,
						"emitRate": 10,
						"instSpeed": [
							0,
							0,
							1.5
						],
						"instRotation_rand": [
							180,
							180,
							180
						],
						"maxCount": 70,
						"useRandomColor": true,
						"randomColor1": [
							0.7372549019607844,
							0.5176470588235293,
							0.43529411764705883,
							1
						],
						"randomColor2": [
							0.796078431372549,
							0.7019607843137254,
							0.6627450980392157,
							1
						],
						"instScale_rand": 0.5,
						"instStretch_rand": [
							0.25,
							0.25,
							0.25
						],
						"instStretch": [
							0.75,
							0.75,
							0.75
						],
						"instSpeed_rand": [
							0.1,
							0.1,
							0.25
						],
						"lifeTime": 5,
						"emitRad1": 0.8,
						"instScale": 1.5
					},
					"x": -0.37,
					"y": 3.02,
					"z": 11.73,
					"scaleZ": 1.0000000000000002,
					"rotationX": -19.9,
					"rotationY": 86.3,
					"rotationZ": -61.5,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"emissive": 1
										}
									},
									"diffuseMap": "Fx/Test/GrainSand.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.16499999999999998,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": -0.005913209396695318,
														"dt": -0.05499284738926684
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.31000000000000005
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 2
												}
											]
										}
									],
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
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -2.9823966317318744,
										"dt": -0.4479860486740105
									},
									"nextHandle": {
										"dv": 0.9272727272727272,
										"dt": 0.1392857142857143
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.11818181818181817,
										"dt": -0.5535714285714286
									},
									"nextHandle": {
										"dv": 0.06891077811632206,
										"dt": 0.32278262826464166
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instAcceleration.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.036090312121565805,
										"dt": -0.5000208057696871
									},
									"nextHandle": {
										"dv": -0.0465545654296875,
										"dt": 0.6449999999999999
									}
								},
								{
									"time": 0.505,
									"value": -0.2047576904296875,
									"mode": 0,
									"prevHandle": {
										"dv": 0.14081571482888833,
										"dt": -0.1272279795141078
									},
									"nextHandle": {
										"dv": -0.14081571482888833,
										"dt": 0.1272279795141078
									}
								},
								{
									"time": 0.88,
									"value": -1.1803436279296875,
									"mode": 0,
									"prevHandle": {
										"dv": -0.2551236795769372,
										"dt": -0.11525828170225964
									},
									"nextHandle": {
										"dv": 0.2551236795769372,
										"dt": 0.11525828170225964
									}
								},
								{
									"time": 0.97,
									"value": -0.0465545654296875,
									"mode": 0,
									"prevHandle": {
										"dv": -0.685546875,
										"dt": -0.15000000000000002
									},
									"nextHandle": {
										"dv": 1.2109272505903252,
										"dt": 0.26736516506531743
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instAcceleration.x",
							"keyMode": 1,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.4,
									"value": -0.0661892361111111,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.16666666666666666
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.16666666666666666
									}
								},
								{
									"time": 0.875,
									"value": -0.455078125,
									"mode": 1,
									"prevHandle": {
										"dv": -0.009368927878953099,
										"dt": -0.1582974054427935
									},
									"nextHandle": {
										"dv": 0.20833333333333337,
										"dt": 0.05999999999999994
									}
								},
								{
									"time": 1,
									"value": 0.0032552083333333335,
									"mode": 0,
									"prevHandle": {
										"dv": -0.1111111111111111,
										"dt": -0.09500000000000008
									},
									"nextHandle": {
										"dv": 0.1111111111111111,
										"dt": 0.09500000000000008
									}
								}
							]
						}
					],
					"enabled": false
				},
				{
					"type": "emitter",
					"name": "OrbitalDrones",
					"props": {
						"emitShape": "Cylinder",
						"instScale_rand": 0.8,
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instStretch_rand": [
							0,
							0,
							0
						],
						"emitRad2": 0.49,
						"lifeTime": 10000000,
						"instOrbitSpeed_rand": [
							0,
							0,
							0.4
						],
						"emitRad1": 1.3,
						"emitOrientation": "Speed",
						"emitRate": 25,
						"simulationSpace": "World",
						"alignAxis": [
							10,
							0,
							0
						],
						"instRotation": [
							0,
							0,
							180
						],
						"maxCount": 25,
						"instScale": 2,
						"speedFactor": 0.7
					},
					"z": 8.14,
					"scaleX": 25,
					"scaleY": 25,
					"scaleZ": 7.39,
					"children": [
						{
							"type": "model",
							"name": "SM_Drone01",
							"source": "Fx/Structure/Arrakeen/SM_Drone01.fbx",
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1
						}
					]
				},
				{
					"type": "emitter",
					"name": "OrbitalDrones",
					"props": {
						"emitShape": "Cylinder",
						"instScale_rand": 0.8,
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instStretch_rand": [
							0,
							0,
							0
						],
						"emitRad2": 0.49,
						"lifeTime": 10000000,
						"instOrbitSpeed_rand": [
							0,
							0,
							0.4
						],
						"emitRad1": 1.3,
						"emitOrientation": "Speed",
						"emitRate": 25,
						"simulationSpace": "World",
						"alignAxis": [
							10,
							0,
							0
						],
						"instRotation": [
							0,
							0,
							180
						],
						"maxCount": 25,
						"instScale": 2,
						"speedFactor": 0.7
					},
					"z": 8.14,
					"scaleX": 25,
					"scaleY": 25,
					"scaleZ": 7.39,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"x": 0.05,
							"scaleX": 0.3,
							"scaleY": 0.1,
							"scaleZ": 0.2,
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
											"parallax": 0,
											"emissive": 20
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
										"alpha": 0.15,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/circGrad3.jpg"
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
											0.403921568627451,
											0.7764705882352941,
											1
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
					"name": "WalkingXDir01",
					"props": {
						"emitShape": "Cylinder",
						"lifeTime": 15,
						"lifeTimeRand": 5,
						"emitRate": 0.7,
						"instScale": 0.21,
						"instSpeed": [
							0.1,
							0,
							0
						],
						"instSpeed_rand": [
							0.15,
							0.1,
							0
						],
						"instAcceleration_rand": [
							0.01,
							0.01,
							0
						],
						"instOffset_rand": [
							0.1,
							0.1,
							0
						],
						"instRotation_rand": [
							0,
							0,
							360
						],
						"maxCount": 100,
						"instScale_rand": 0.01,
						"instStretch_rand": [
							0,
							0,
							0.05
						]
					},
					"x": -2.47,
					"y": -12.45,
					"z": 0.24,
					"scaleX": 5,
					"scaleY": 5,
					"scaleZ": 0.01,
					"rotationZ": 67.1,
					"children": [
						{
							"type": "model",
							"name": "SM_Character01",
							"source": "Fx/Structure/Arrakeen/SM_Character01.fbx",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"specularMap": "Fx/Gradients/z_FillBlack.jpg"
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.21176470588235294,
											0.23137254901960785,
											0.24705882352941178
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instOffset.z",
							"keys": [
								{
									"time": 0,
									"value": -0.3,
									"mode": 2
								},
								{
									"time": 0.09481481481481527,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.912592592592597,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1,
									"value": -0.3,
									"mode": 2
								}
							]
						}
					],
					"enabled": false
				},
				{
					"type": "emitter",
					"name": "WalkingXDir02",
					"props": {
						"emitShape": "Cylinder",
						"lifeTime": 15,
						"lifeTimeRand": 1,
						"emitRate": 0.5,
						"instScale": 0.21,
						"instSpeed": [
							0.1,
							0,
							0
						],
						"instSpeed_rand": [
							0.07,
							0.07,
							0
						],
						"instAcceleration_rand": [
							0.01,
							0.01,
							0
						],
						"instOffset_rand": [
							0.1,
							0.1,
							0
						],
						"instRotation_rand": [
							0,
							0,
							360
						],
						"seedGroup": 1,
						"maxCount": 150,
						"instScale_rand": 0.01
					},
					"x": 2.35,
					"y": 10.28,
					"z": 0.24,
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.01,
					"rotationZ": -171.1,
					"children": [
						{
							"type": "model",
							"name": "SM_Character01",
							"source": "Fx/Structure/Arrakeen/SM_Character01.fbx",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"specularMap": "Fx/Gradients/z_FillBlack.jpg"
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.21176470588235294,
											0.23137254901960785,
											0.24705882352941178
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instOffset.z",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.912592592592597,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1,
									"value": -0.3,
									"mode": 2
								}
							]
						}
					],
					"enabled": false
				},
				{
					"type": "emitter",
					"name": "WalkingXDir03",
					"props": {
						"emitShape": "Cylinder",
						"lifeTime": 15,
						"lifeTimeRand": 1,
						"emitRate": 0.5,
						"instScale": 0.21,
						"instSpeed": [
							0.1,
							0,
							0
						],
						"instSpeed_rand": [
							0.07,
							0.02,
							0
						],
						"instAcceleration_rand": [
							0.01,
							0.01,
							0
						],
						"instOffset_rand": [
							0.1,
							0.2,
							0
						],
						"instRotation_rand": [
							0,
							0,
							360
						],
						"seedGroup": 1,
						"maxCount": 150,
						"instScale_rand": 0.02
					},
					"x": 5.8,
					"y": 11.37,
					"z": 0.24,
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.01,
					"rotationZ": -106.3,
					"children": [
						{
							"type": "model",
							"name": "SM_Character01",
							"source": "Fx/Structure/Arrakeen/SM_Character01.fbx",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"specularMap": "Fx/Gradients/z_FillBlack.jpg"
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.21176470588235294,
											0.23137254901960785,
											0.24705882352941178
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instOffset.z",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.912592592592597,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1,
									"value": -0.3,
									"mode": 2
								}
							]
						}
					],
					"enabled": false
				},
				{
					"type": "object",
					"name": "Drone01",
					"x": 7.82,
					"y": 9.71,
					"z": 4.61,
					"scaleX": 0.19,
					"scaleY": 0.19,
					"scaleZ": 0.19,
					"children": [
						{
							"type": "reference",
							"name": "LightBlue03_Sphere",
							"source": "Fx/Structure/Lights/LightBlue03_Sphere.fx",
							"x": -0.36,
							"y": -0.01,
							"z": 0.1,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8
						},
						{
							"type": "model",
							"name": "SM_Drone01",
							"source": "Fx/Structure/Arrakeen/SM_Drone01.fbx",
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
									"diffuseMap": "Fx/Structure/Arrakeen/T_Drone01.png",
									"specularMap": "Fx/Gradients/z_FillGrey50.jpg"
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
									"value": 0.4414,
									"mode": 2
								},
								{
									"time": 10.942824730392257,
									"value": 0.44138947830899544,
									"mode": 2
								},
								{
									"time": 15.390175957717451,
									"value": 0.7390707543778529,
									"mode": 2
								},
								{
									"time": 27.852656845789763,
									"value": 0.7391,
									"mode": 2
								},
								{
									"time": 30.963242552072725,
									"value": 0.8236031518471162,
									"mode": 2
								},
								{
									"time": 36,
									"value": 0.8236,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 1,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 15.302399288757085,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -5.100799762919029
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.4239326298014874
									}
								},
								{
									"time": 22.981867744901425,
									"value": -2.6,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -1.4239326298014874
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.4239326298014874
									}
								},
								{
									"time": 30.844933313655964,
									"value": -2.6,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -2.531974225006246
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.2809159263742202
									}
								},
								{
									"time": 34.420538199042824,
									"value": -1.4666666666666663,
									"mode": 2
								},
								{
									"time": 34.893175626421545,
									"value": -1.4666666666666663,
									"mode": 2
								},
								{
									"time": 36,
									"value": -1.467,
									"mode": 1
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"keyMode": 1,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 15.3,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -5.1000000000000005
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.4247323927205156
									}
								},
								{
									"time": 22.981807868761166,
									"value": -20.3,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -1.4247323927205156
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.4247323927205156
									}
								},
								{
									"time": 30.844933313655964,
									"value": -20.3,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -2.531994183719666
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.2809159263742202
									}
								},
								{
									"time": 34.420538199042824,
									"value": -22.376684276006117,
									"mode": 2
								},
								{
									"time": 34.893175626421545,
									"value": -22.376684276006117,
									"mode": 2
								},
								{
									"time": 36,
									"value": -22.38,
									"mode": 1
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"keyMode": 0,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": -3.233,
									"mode": 0
								},
								{
									"time": 1.9949999999999999,
									"value": -3.2333333333333334,
									"mode": 2
								},
								{
									"time": 2.985423583984376,
									"value": -2.85,
									"mode": 2
								},
								{
									"time": 3.970534667968751,
									"value": -2.899999999999999,
									"mode": 2
								},
								{
									"time": 5.0036999511718765,
									"value": -2.84,
									"mode": 2
								},
								{
									"time": 5.996820068359376,
									"value": -2.9,
									"mode": 2
								},
								{
									"time": 7.98090552866459,
									"value": -2.86,
									"mode": 2
								},
								{
									"time": 8.968732566535476,
									"value": -2.9,
									"mode": 2
								},
								{
									"time": 9.969388526976111,
									"value": -2.8662222222222216,
									"mode": 2
								},
								{
									"time": 10.953131357075767,
									"value": -2.87801266622022,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3279142766998853
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.3151650153147063
									}
								},
								{
									"time": 14.916892583788146,
									"value": 0.2,
									"mode": 2
								},
								{
									"time": 15.934808507523666,
									"value": 0,
									"mode": 0
								},
								{
									"time": 19.69123273677537,
									"value": 0,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.4133865730181843
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.7509781677720172
									}
								},
								{
									"time": 22.86961508320441,
									"value": -2.5,
									"mode": 0,
									"prevHandle": {
										"dv": -0.031982428898952975,
										"dt": -0.6473077809752077
									},
									"nextHandle": {
										"dv": 0.020177327152549822,
										"dt": 0.43331731905392235
									}
								},
								{
									"time": 24.094876240050336,
									"value": -2.3511319487892135,
									"mode": 0,
									"prevHandle": {
										"dv": 0.022650892158753655,
										"dt": -0.4864382576643852
									},
									"nextHandle": {
										"dv": -0.01507087334247803,
										"dt": 0.32365389048760207
									}
								},
								{
									"time": 30.984080480429327,
									"value": -4.023998889804304,
									"mode": 0,
									"prevHandle": {
										"dv": -0.004964279739588129,
										"dt": -1.0638725681665164
									},
									"nextHandle": {
										"dv": 0.0024987032990155837,
										"dt": 0.5113904218310901
									}
								},
								{
									"time": 32.518535405214195,
									"value": -3.929761422882886,
									"mode": 2
								},
								{
									"time": 36,
									"value": -3.929761422882886,
									"mode": 0
								}
							]
						},
						{
							"type": "curve",
							"name": "visibility",
							"keyMode": 3,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 3
								},
								{
									"time": 1.3932241116756874,
									"value": 1,
									"mode": 3
								},
								{
									"time": 34.66885357007107,
									"value": 0,
									"mode": 3
								},
								{
									"time": 36,
									"value": 3.3306690738754696e-16,
									"mode": 3
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Drone02",
					"x": -13.55,
					"y": 6.47,
					"z": 1.5,
					"scaleX": 0.16,
					"scaleY": 0.16,
					"scaleZ": 0.16,
					"children": [
						{
							"type": "reference",
							"name": "LightBlue03_Sphere",
							"source": "Fx/Structure/Lights/LightBlue03_Sphere.fx",
							"x": -0.36,
							"y": -0.01,
							"z": 0.1,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8
						},
						{
							"type": "model",
							"name": "SM_Drone01",
							"source": "Fx/Structure/Arrakeen/SM_Drone01.fbx",
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
									"diffuseMap": "Fx/Structure/Arrakeen/T_Drone01.png",
									"specularMap": "Fx/Gradients/z_FillGrey50.jpg"
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 5.987596974020672,
									"value": 0,
									"mode": 2
								},
								{
									"time": 9.450293249304709,
									"value": 4.983333333333333,
									"mode": 2
								},
								{
									"time": 17,
									"value": 4.983,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 5.988,
									"value": 0,
									"mode": 2
								},
								{
									"time": 9.51236442846088,
									"value": -1.5499397396027743,
									"mode": 2
								},
								{
									"time": 17,
									"value": -1.55,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"keyMode": 0,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": -0.3,
									"mode": 0
								},
								{
									"time": 6.143686600667875,
									"value": -0.3,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -2.1148715297062446
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.2374603499873779
									}
								},
								{
									"time": 8.121332259939157,
									"value": -0.1892870612927004,
									"mode": 0,
									"prevHandle": {
										"dv": 0.0031241746372430157,
										"dt": -0.6236561762444826
									},
									"nextHandle": {
										"dv": -0.004026740855679652,
										"dt": 0.6003524819800388
									}
								},
								{
									"time": 10.217024256239695,
									"value": -0.3,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3531392762696483
									},
									"nextHandle": {
										"dv": 0,
										"dt": 3.2609919145867683
									}
								},
								{
									"time": 17,
									"value": -0.3,
									"mode": 0
								}
							]
						},
						{
							"type": "curve",
							"name": "rotation.z",
							"keys": [
								{
									"time": 0,
									"value": -0.04274784150595787,
									"mode": 2
								},
								{
									"time": 17,
									"value": -0.04275,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "visibility",
							"keyMode": 3,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 3
								},
								{
									"time": 5.672107117598676,
									"value": 1,
									"mode": 3
								},
								{
									"time": 9.701312301225745,
									"value": 0,
									"mode": 3
								},
								{
									"time": 17,
									"value": 0,
									"mode": 3
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Drone02.5",
					"x": -9.78,
					"y": 10.49,
					"z": 1.56,
					"scaleX": 0.19,
					"scaleY": 0.19,
					"scaleZ": 0.19,
					"rotationZ": -122.9,
					"children": [
						{
							"type": "reference",
							"name": "LightBlue03_Sphere",
							"source": "Fx/Structure/Lights/LightBlue03_Sphere.fx",
							"x": -0.36,
							"y": -0.01,
							"z": 0.1,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8
						},
						{
							"type": "model",
							"name": "SM_Drone01",
							"source": "Fx/Structure/Arrakeen/SM_Drone01.fbx",
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
									"diffuseMap": "Fx/Structure/Arrakeen/T_Drone01.png",
									"specularMap": "Fx/Gradients/z_FillGrey50.jpg"
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
									"time": 14,
									"value": 0,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 1,
							"loop": true,
							"keys": [
								{
									"time": 1.3122783448381259,
									"value": -0.08306,
									"mode": 1
								},
								{
									"time": 0.9373416748843795,
									"value": -0.08305555555555277,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.6717615336671359
									}
								},
								{
									"time": 3.843100867025946,
									"value": -4.069722222222221,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.6717615336671359
									},
									"nextHandle": {
										"dv": 0,
										"dt": -0.5
									}
								},
								{
									"time": 14,
									"value": -4.07,
									"mode": 1
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"keyMode": 1,
							"loop": true,
							"keys": [
								{
									"time": 1.3122783448381259,
									"value": 0.2776,
									"mode": 1
								},
								{
									"time": 0.9373416748843795,
									"value": 0.2776377262210872,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.6717615336671359
									}
								},
								{
									"time": 3.843100867025946,
									"value": -7.685275452442177,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.6717615336671359
									},
									"nextHandle": {
										"dv": 0,
										"dt": -0.5
									}
								},
								{
									"time": 14,
									"value": -7.685,
									"mode": 1
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"keyMode": 0,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0
								},
								{
									"time": 1.3122783448381259,
									"value": 0,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.6561391724190629
									}
								},
								{
									"time": 2.530822522187814,
									"value": 0.135,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.6561391724190629
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.624860827580937
									}
								},
								{
									"time": 3.5150312808164084,
									"value": 0,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.624860827580937
									},
									"nextHandle": {
										"dv": 0,
										"dt": -0.5
									}
								},
								{
									"time": 14,
									"value": 0,
									"mode": 0
								}
							]
						},
						{
							"type": "curve",
							"name": "visibility",
							"keyMode": 3,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 3
								},
								{
									"time": 5.952119635515785,
									"value": 0,
									"mode": 3
								},
								{
									"time": 14,
									"value": 0,
									"mode": 3
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Drone02.6",
					"x": -13.66,
					"y": 2.88,
					"z": 1.25,
					"scaleX": 0.17,
					"scaleY": 0.17,
					"scaleZ": 0.17,
					"children": [
						{
							"type": "reference",
							"name": "LightBlue03_Sphere",
							"source": "Fx/Structure/Lights/LightBlue03_Sphere.fx",
							"x": -0.36,
							"y": -0.01,
							"z": 0.1,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8
						},
						{
							"type": "model",
							"name": "SM_Drone01",
							"source": "Fx/Structure/Arrakeen/SM_Drone01.fbx",
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
									"diffuseMap": "Fx/Structure/Arrakeen/T_Drone01.png",
									"specularMap": "Fx/Gradients/z_FillGrey50.jpg"
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 0,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 18.996960157780006,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -1.6924787619156778
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.020717228248542
									}
								},
								{
									"time": 22.05911184252563,
									"value": 3.6380925925925967,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -1.020717228248542
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.020717228248542
									}
								},
								{
									"time": 27.974495958222484,
									"value": 3.638,
									"mode": 0
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"keyMode": 0,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 18.996960157780006,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -1.6924787619156778
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.020717228248542
									}
								},
								{
									"time": 22.05911184252563,
									"value": 8.37326612452874,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -1.020717228248542
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.020717228248542
									}
								},
								{
									"time": 27.974495958222484,
									"value": 8.373,
									"mode": 0
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 27.9696828747075,
									"value": 0,
									"mode": 2
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
									"value": -0.818680732246281,
									"mode": 2
								},
								{
									"time": 27.974495958222484,
									"value": -0.8187,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "visibility",
							"keyMode": 3,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 3
								},
								{
									"time": 17.668890571570483,
									"value": 1,
									"mode": 3
								},
								{
									"time": 23.339807704620956,
									"value": 0,
									"mode": 3
								},
								{
									"time": 27.974495958222484,
									"value": 0,
									"mode": 3
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Drone03",
					"x": -10.05,
					"y": 10.73,
					"z": 1.5,
					"scaleX": 0.2,
					"scaleY": 0.2,
					"scaleZ": 0.2,
					"children": [
						{
							"type": "reference",
							"name": "LightBlue03_Sphere",
							"source": "Fx/Structure/Lights/LightBlue03_Sphere.fx",
							"x": -0.36,
							"y": -0.01,
							"z": 0.1,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8
						},
						{
							"type": "model",
							"name": "SM_Drone01",
							"source": "Fx/Structure/Arrakeen/SM_Drone01.fbx",
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
									"diffuseMap": "Fx/Structure/Arrakeen/T_Drone01.png",
									"specularMap": "Fx/Gradients/z_FillGrey50.jpg"
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 0,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 8.61606069687383,
									"value": 0,
									"mode": 2
								},
								{
									"time": 9.089231802988301,
									"value": -0.6057142857142856,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.15772370203815692
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.9676560198912163
									}
								},
								{
									"time": 14.99219986266195,
									"value": -0.4,
									"mode": 2
								},
								{
									"time": 60.20457510064557,
									"value": -0.4,
									"mode": 0
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 8.61606069687383,
									"value": 0,
									"mode": 2
								},
								{
									"time": 14.971650409297657,
									"value": -16.923809887303175,
									"mode": 0,
									"prevHandle": {
										"dv": 0.5308608785775526,
										"dt": -0.8014286812073994
									},
									"nextHandle": {
										"dv": -0.45284777466729137,
										"dt": 0.6836540598202958
									}
								},
								{
									"time": 17.118515329682285,
									"value": -19.68428645590644,
									"mode": 2
								},
								{
									"time": 60.20457510064557,
									"value": -19.68,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"keyMode": 0,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": -0.3,
									"mode": 2
								},
								{
									"time": 9.230205891430384,
									"value": -0.3,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -3.076735297143461
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.0918367047174005
									}
								},
								{
									"time": 12.505716005582585,
									"value": 2.8119992164869263,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -1.2019053351941948
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.7192308677502292
									}
								},
								{
									"time": 14.663408608833272,
									"value": 1.1215258177628722,
									"mode": 2
								},
								{
									"time": 60.20457510064557,
									"value": 1.122,
									"mode": 0
								}
							]
						},
						{
							"type": "curve",
							"name": "rotation.z",
							"keyMode": 0,
							"loop": true,
							"keys": [
								{
									"time": 7.013144338130957,
									"value": -0.352,
									"mode": 2
								},
								{
									"time": 8.780684781074532,
									"value": -0.35200276307025175,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5891801476478585
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.1596488142013547
									}
								},
								{
									"time": 9.259631223678596,
									"value": -0.2442868731186953,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.1596488142013547
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.38391738653183083
									}
								},
								{
									"time": 10.411383383274089,
									"value": -0.2443,
									"mode": 2
								},
								{
									"time": 60.20457510064557,
									"value": -0.2443,
									"mode": 0
								}
							]
						},
						{
							"type": "curve",
							"name": "visibility",
							"keyMode": 3,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 3
								},
								{
									"time": 8.11872622981551,
									"value": 1,
									"mode": 3
								},
								{
									"time": 17.82779242982164,
									"value": 0,
									"mode": 3
								},
								{
									"time": 60.202234171350156,
									"value": 0,
									"mode": 3
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Drone04",
					"x": -11.3,
					"y": -10.05,
					"z": 2.86,
					"scaleX": 0.22,
					"scaleY": 0.22,
					"scaleZ": 0.22,
					"children": [
						{
							"type": "reference",
							"name": "LightBlue03_Sphere",
							"source": "Fx/Structure/Lights/LightBlue03_Sphere.fx",
							"x": -0.36,
							"y": -0.01,
							"z": 0.1,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8
						},
						{
							"type": "model",
							"name": "SM_Drone01",
							"source": "Fx/Structure/Arrakeen/SM_Drone01.fbx",
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
									"diffuseMap": "Fx/Structure/Arrakeen/T_Drone01.png",
									"specularMap": "Fx/Gradients/z_FillGrey50.jpg"
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 0,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 2.9705611380277626,
									"value": -1.650903171594557,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.9901870460092542
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.6764796206574125
									}
								},
								{
									"time": 4.991766569912435,
									"value": -1.651,
									"mode": 2
								},
								{
									"time": 7.749984922409058,
									"value": -1.651,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.9194061174988745
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.6799328961968424
									}
								},
								{
									"time": 9.8924149915576,
									"value": -2.01985680094714,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.6799328961968424
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.6799328961968424
									}
								},
								{
									"time": 18.364672836345314,
									"value": -2.02,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -2.6625283361474668
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.42163663125692946
									}
								},
								{
									"time": 21.0434867335061,
									"value": 8.635267906925861,
									"mode": 0,
									"prevHandle": {
										"dv": -5.84492820791133,
										"dt": -0.7839062869929946
									},
									"nextHandle": {
										"dv": 4.276494725650009,
										"dt": 0.572173842112015
									}
								},
								{
									"time": 23.124118886640694,
									"value": 19.311089475108385,
									"mode": 1,
									"prevHandle": {
										"dv": -0.3555181579184712,
										"dt": -0.7959858661164709
									},
									"nextHandle": {
										"dv": 0.35551815791847474,
										"dt": 1.453634153606032
									}
								},
								{
									"time": 166.7,
									"value": 19.31,
									"mode": 0
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"keyMode": 1,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 2.9705611380277626,
									"value": 3.143676838120929,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.9901870460092542
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.6764796206574125
									}
								},
								{
									"time": 5,
									"value": 3.143676838120929,
									"mode": 2
								},
								{
									"time": 7.749566161453723,
									"value": 3.144,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.9165220538179076
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.680072483181954
									}
								},
								{
									"time": 9.8924149915576,
									"value": 4.034385275588526,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.680072483181954
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.680072483181954
									}
								},
								{
									"time": 18.364672836345314,
									"value": 4.034,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -2.6625283361474668
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.42163663125692946
									}
								},
								{
									"time": 21.0434867335061,
									"value": 14.880070367105736,
									"mode": 0,
									"prevHandle": {
										"dv": -1.6845863536461056,
										"dt": -0.7022133516829214
									},
									"nextHandle": {
										"dv": 1.6845863536461056,
										"dt": 0.7022133516829214
									}
								},
								{
									"time": 23.124118886640694,
									"value": 16.609092628072236,
									"mode": 1,
									"prevHandle": {
										"dv": -0.15298348166360043,
										"dt": -0.7543262361216101
									},
									"nextHandle": {
										"dv": 0.03881799674516628,
										"dt": 1.03703785365742
									}
								},
								{
									"time": 166.7,
									"value": 16.61,
									"mode": 1
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"keyMode": 1,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 2.9641333007812665,
									"value": 0,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -1.0120715332031305
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.5466165161132842
									}
								},
								{
									"time": 4.676064147949244,
									"value": -0.28776416419602824,
									"mode": 2
								},
								{
									"time": 6.1591985237598434,
									"value": -0.28776416419602824,
									"mode": 1
								},
								{
									"time": 7.955247683525086,
									"value": 0,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.598683053255081
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.598683053255081
									}
								},
								{
									"time": 11.43188569992781,
									"value": 0,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.6072356683015826
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.4019729071855546
									}
								},
								{
									"time": 12.637804421484473,
									"value": -0.2878,
									"mode": 2
								},
								{
									"time": 14.517128599165014,
									"value": -0.2878,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.6264413925601803
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.8388912649126722
									}
								},
								{
									"time": 17.87810586052482,
									"value": 1.4,
									"mode": 1,
									"prevHandle": {
										"dv": 0.17459763664096029,
										"dt": -0.8443034666217883
									},
									"nextHandle": {
										"dv": 0.017017604542957088,
										"dt": 1.3708356409026976
									}
								},
								{
									"time": 21.355581556476288,
									"value": 4.12534154754473,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.9510953500036976
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.031646775929237
									}
								},
								{
									"time": 23.124118886640694,
									"value": 2.5,
									"mode": 1,
									"prevHandle": {
										"dv": -0.12875427046160137,
										"dt": -0.5130610386037944
									},
									"nextHandle": {
										"dv": 0.016250983826921583,
										"dt": 0.8098605048461707
									}
								},
								{
									"time": 24.36087601195573,
									"value": 2.5,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.6124443910202615
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.7474287756476036
									}
								},
								{
									"time": 27.86403575096346,
									"value": -3.8702169899987906,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -1.167719913002576
									},
									"nextHandle": {
										"dv": 0,
										"dt": -0.5
									}
								},
								{
									"time": 166.6820810651137,
									"value": -3.87,
									"mode": 1
								}
							]
						},
						{
							"type": "curve",
							"name": "rotation.z",
							"keyMode": 1,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0.3281,
									"mode": 2
								},
								{
									"time": 3.134278147609475,
									"value": 0.3280554020367567,
									"mode": 2
								},
								{
									"time": 10.110506675243379,
									"value": 0.3281,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -2.325409509211301
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.1667759934067726
									}
								},
								{
									"time": 11.136820480823522,
									"value": 0.5747037416880733,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3378282943367961
									},
									"nextHandle": {
										"dv": 0,
										"dt": -0.5
									}
								},
								{
									"time": 15.3614320657868,
									"value": 0.5747,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -1.4623258787455662
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.530395767493174
									}
								},
								{
									"time": 17.896530601890028,
									"value": 0.14061565742567372,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.530395767493174
									},
									"nextHandle": {
										"dv": 0,
										"dt": -0.5
									}
								},
								{
									"time": 20.315265479908994,
									"value": 0.1406,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.8755993644441418
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.3120948229701905
									}
								},
								{
									"time": 21.459613164133025,
									"value": 0.01719845699812876,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3120948229701905
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.3120948229701905
									}
								},
								{
									"time": 24.411727585762353,
									"value": 0.0172,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -1.3486257833726967
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.5358079692022883
									}
								},
								{
									"time": 27.955366654804756,
									"value": -0.34879737875252165,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.7367359576531456
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.7367359576531456
									}
								},
								{
									"time": 166.7,
									"value": -0.3488,
									"mode": 1
								}
							]
						},
						{
							"type": "curve",
							"name": "visibility",
							"keyMode": 3,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 3
								},
								{
									"time": 69.03521435523425,
									"value": 0,
									"mode": 3
								},
								{
									"time": 166.7,
									"value": 0,
									"mode": 3
								}
							]
						}
					]
				}
			]
		}
	]
}