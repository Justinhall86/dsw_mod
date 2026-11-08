{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"z": 0.02,
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
			"type": "object",
			"name": "FXRoot",
			"scaleX": 1.25,
			"scaleY": 1.25,
			"scaleZ": 1.25,
			"children": [
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"enabled": false,
					"z": 0.1,
					"scaleX": 200,
					"scaleY": 30,
					"scaleZ": 100,
					"rotationZ": 89.99999999999999,
					"albedoMap": "Fx/Alphas/T_Flare06_512.png",
					"fadePower": 2,
					"fadeEnd": 2,
					"emissive": 1,
					"renderMode": "AfterTonemapping",
					"blendMode": 2,
					"children": [
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.02457304813177874,
												"dt": -0.4999417385222912
											},
											"nextHandle": {
												"dv": -0.032194444444444525,
												"dt": 0.6549999999999999
											}
										},
										{
											"time": 0.8480245798826219,
											"value": -0.11268055555555556,
											"mode": 0,
											"prevHandle": {
												"dv": -0.42129447239079937,
												"dt": -0.03928170450720808
											},
											"nextHandle": {
												"dv": 1.1279106675889756,
												"dt": 0.10697542011737793
											}
										},
										{
											"time": 1.22,
											"value": 0.9658333333333333,
											"mode": 2
										},
										{
											"time": 3.572085266113282,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.042671786838107684,
												"dt": -0.6217012023925783
											},
											"nextHandle": {
												"dv": -0.042671786838107684,
												"dt": 0.6217012023925783
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
									1,
									0.17254901960784313,
									0.07450980392156863
								]
							}
						}
					]
				},
				{
					"type": "emitter",
					"name": "Stars",
					"props": {
						"lifeTime": 0.25,
						"emitType": "Burst",
						"instScale": 0.8,
						"instOffset": [
							0,
							0,
							2
						],
						"instStretch": [
							3,
							1,
							1
						],
						"instRotation": [
							0,
							0,
							90
						]
					},
					"scaleX": 0.01,
					"scaleY": 0.01,
					"scaleZ": 0.01,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 50,
							"scaleY": 49.999999999999986,
							"scaleZ": 50.00000000000001,
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
											"alphaKill": false,
											"enableStencil": false,
											"drawOrder": "100",
											"emissive": 10
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 0.8,
										"uScale": 1,
										"vScale": 0.9,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare07_512.png"
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
													"time": 0.71,
													"value": 0.9833333333333334,
													"mode": 0,
													"prevHandle": {
														"dv": 0.03144094491268983,
														"dt": -0.49991102411176125
													},
													"nextHandle": {
														"dv": -0.01666666666666672,
														"dt": 0.2649999999999999
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/NoisyWave_01.png",
										"uvShift": [
											0,
											0
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
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 0.7749999999999999,
													"value": 1,
													"mode": 2
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
											"name": "width",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"enabled": false,
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVSweep",
									"source": "shaders/UVSweep.hx",
									"enabled": false,
									"props": {
										"saturation": 0,
										"width": 0.48,
										"useU": false,
										"progress": 0.5
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9949999999999999,
													"value": 0.9666666666666667,
													"mode": 0,
													"prevHandle": {
														"dv": -0.2666666666666667,
														"dt": -1.79
													},
													"nextHandle": {
														"dv": 0.09929240604583035,
														"dt": 0.6665002755826369
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
											0,
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "color.h",
											"keys": [
												{
													"time": 0.12000000000000001,
													"value": 0.19661239164032507,
													"mode": 2
												},
												{
													"time": 0.33,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.47000000000000003,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6749999999999999,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.21448624542580919,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "color.s",
											"keys": [
												{
													"time": 0.12000000000000001,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.33,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.47000000000000003,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6749999999999999,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "color.l",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.12000000000000001,
													"value": 0.6745098039215687,
													"mode": 0,
													"prevHandle": {
														"dv": 1.177032890353281,
														"dt": -0.3531098671059842
													},
													"nextHandle": {
														"dv": -0.457843137254902,
														"dt": 0.135
													}
												},
												{
													"time": 0.33,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.47000000000000003,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6749999999999999,
													"value": 0,
													"mode": 0
												},
												{
													"time": 1,
													"value": 0.6745098039215687,
													"mode": 0
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 50,
										"power": 0.5
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"x": 30,
					"scaleX": 2000,
					"scaleY": 2000,
					"scaleZ": 100,
					"albedoMap": "Fx/Alphas/T_circle2.png",
					"fadePower": 2,
					"fadeEnd": 2,
					"renderMode": "AfterTonemapping",
					"children": [
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
									"keyMode": 1,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.7275734144792043,
												"dt": -0.25510578770642894
											},
											"nextHandle": {
												"dv": 0.3114050082736545,
												"dt": 0.04743608578223649
											}
										},
										{
											"time": 0.04743608578223649,
											"value": 0.9658333333333333,
											"mode": 2
										},
										{
											"time": 0.1000515721046442,
											"value": -0.03410913357204853,
											"mode": 1,
											"prevHandle": {
												"dv": 0.08637853546142576,
												"dt": -0.04482059945982879
											},
											"nextHandle": {
												"dv": -1.665191570802327,
												"dt": 0.6189459683833672
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
									1,
									0.8,
									0.6705882352941176
								]
							}
						}
					]
				}
			]
		}
	]
}