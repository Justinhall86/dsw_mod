{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.64,
			"scaleY": 0.64,
			"scaleZ": 0.64,
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"enabled": false,
					"scaleX": 1.0000000000000002,
					"scaleY": 1.0000000000000002,
					"rotationZ": -155.45,
					"children": [
						{
							"type": "model",
							"name": "Female01_AtreideRanger",
							"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
							"x": -0.00415,
							"y": -0.01523,
							"scaleX": 1.9999999999999996,
							"scaleY": 1.9999999999999996,
							"scaleZ": 2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Anim_Male01_Idle01.fbx"
								}
							]
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"scaleX": 13,
					"scaleY": 13,
					"scaleZ": 5,
					"albedoMap": "Fx/Gradients/circGrad01.png",
					"fadePower": 3,
					"emissive": 0.1,
					"renderMode": "BeforeTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"props": {
								"amount": 1,
								"color": [
									0.8666666666666667,
									1,
									0.5529411764705883
								]
							},
							"isInstance": true
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
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16960016257684296
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16960016257684296
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.1647924604989077
											}
										},
										{
											"time": 2,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.1647924604989077
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.1647924604989077
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
					"name": "advancedDecal",
					"scaleX": 6,
					"scaleY": 6,
					"albedoMap": "Fx/Alphas/T-InnerGradient.png",
					"fadePower": 3,
					"emissive": 0.1,
					"renderMode": "BeforeTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"props": {
								"amount": 1,
								"color": [
									0.8666666666666667,
									1,
									0.5529411764705883
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.4
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16960016257684296
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16960016257684296
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.1647924604989077
											}
										},
										{
											"time": 2,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.1647924604989077
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.1647924604989077
											}
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 2
								},
								{
									"time": 2,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "smoke",
					"props": {
						"alignMode": "Screen",
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0.2,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_02.png",
						"instScale": 5,
						"instSpeed": [
							0,
							0,
							1
						],
						"instAcceleration_rand": [
							0,
							0,
							0.5
						],
						"lifeTime": 3,
						"emitRate": 2,
						"instScale_rand": 1
					},
					"z": 0.44172,
					"scaleX": 2,
					"scaleY": 2,
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
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.7
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
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16960016257684296
													}
												},
												{
													"time": 0.5056226185032769,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16960016257684296
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.1647924604989077
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.1647924604989077
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.1647924604989077
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
											0.8784313725490196,
											1,
											0.8117647058823529
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
										"power": 1
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
										"progress": 0.27,
										"saturation": 0,
										"width": 0.76,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
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
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "sparks",
					"props": {
						"alignMode": "Screen",
						"frameCount": 1,
						"instScale": 7,
						"instSpeed": [
							0,
							0,
							0.5
						],
						"instAcceleration_rand": [
							0,
							0,
							0.5
						],
						"seedGroup": 1,
						"instRotation_rand": [
							0,
							0,
							60
						]
					},
					"z": 1.99047,
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
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 4
										}
									},
									"diffuseMap": "Fx/Alphas/T_circle2.png"
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
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16960016257684296
													}
												},
												{
													"time": 0.5056226185032769,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16960016257684296
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.1647924604989077
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.1647924604989077
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.1647924604989077
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
											0.9450980392156862,
											1,
											0.8117647058823529
										]
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 3,
										"power": 0.5
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
										"progress": 0.22,
										"saturation": 1,
										"width": 0.28,
										"uvScaleX": 0.75,
										"uvScaleY": 0.75,
										"texture": "Fx/noise/SandTrail_01_basecolor.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.1
										],
										"uvScaleSpeed": [
											0,
											0
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