{
	"type": "fx",
	"cullingRadius": 10,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Smoke02",
					"scaleX": 0.2,
					"scaleY": 0.2,
					"scaleZ": 0.2,
					"children": [
						{
							"type": "emitter",
							"name": "emitter",
							"props": {
								"lifeTime": 3.3,
								"emitRate": 15,
								"alignMode": "Screen",
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instStartWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 0,
								"maxCount": 188,
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 0.2,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instSpeed_rand": [
									0.08,
									0.1,
									0
								],
								"simulationSpace": "World",
								"instWorldSpeed": [
									0,
									0,
									1
								],
								"instSpeed": [
									0.1,
									0.13,
									0
								],
								"instStretch_rand": [
									0.1,
									0.1,
									0.1
								],
								"seedGroup": 1,
								"instScale": 0.8
							},
							"y": -0.05,
							"z": 0.1,
							"scaleX": 0.10000000000000002,
							"scaleY": 0.10000000000000002,
							"scaleZ": 0.10000000000000002,
							"children": [
								{
									"type": "model",
									"name": "HemiIcosphere",
									"source": "Fx/Meshes_Common/HemiIcosphere.fbx",
									"scaleZ": 2,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "DecalPass",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"textureWrap": true,
													"alphaKill": false
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/noise/perlin06.png",
											"mainPassName": "decal"
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
												"texture": "Fx/Structure/Smoke/T_DustCloud01.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": false,
												"colorA": [
													0.27058823529411763,
													0.27058823529411763,
													0.27058823529411763
												],
												"pointA": 0,
												"colorB": [
													0.24705882352941178,
													0.24705882352941178,
													0.24705882352941178
												],
												"pointB": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.5,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
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
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.36,
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
											"name": "Dissolve",
											"source": "shaders/Dissolve.hx",
											"props": {
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"useAlpha": false
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
															"value": 0.20111111111111107,
															"mode": 2
														},
														{
															"time": 0.065,
															"value": 0.4,
															"mode": 2
														},
														{
															"time": 0.7,
															"value": 0.2577777777777778,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.2111111111111111,
																"dt": -0.19500000000000006
															},
															"nextHandle": {
																"dv": -0.16615829495135942,
																"dt": 0.151879066478977
															}
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
												"range": 0.3,
												"power": 1
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0,
											"value": 0.28,
											"mode": 2
										},
										{
											"time": 0.34500000000000003,
											"value": 0.4085,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.02666666666666667
											},
											"nextHandle": {
												"dv": -0.023166666666667113,
												"dt": 0.39499999999999996
											}
										},
										{
											"time": 1,
											"value": 1.2309166666666669,
											"mode": 1,
											"prevHandle": {
												"dv": -0.4054166666666667,
												"dt": -0.16999999999999993
											},
											"nextHandle": {
												"dv": 0,
												"dt": -0.5
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 5,
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