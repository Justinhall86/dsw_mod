{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 1,
			"rotationZ": 90,
			"children": [
				{
					"type": "object",
					"name": "Smoke",
					"scaleX": 0.8,
					"scaleY": 0.8,
					"scaleZ": 0.8,
					"children": [
						{
							"type": "emitter",
							"name": "Smoke",
							"props": {
								"instScale_rand": 1,
								"animationSpeed": 0.3,
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
								"emitRate": 2,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
								"instScale": 9,
								"burstDelay": 0.05,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"emitShape": "Cone",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 1,
								"alignMode": "Screen",
								"emitAngle": 38.18,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldAcceleration_rand": [
									0,
									0.05,
									0
								],
								"lifeTime": 10,
								"warmUpTime": 5,
								"instSpeed": [
									1,
									0,
									0
								],
								"instSpeed_rand": [
									0.2,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"speedFactor": 0.2,
								"instWorldAcceleration": [
									0,
									0.5,
									0
								],
								"enableSort": false
							},
							"scaleX": 2.9999999999999996,
							"scaleY": 2.9999999999999996,
							"scaleZ": 2.9999999999999996,
							"rotationY": -89.99999999999999,
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
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
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
													"keyMode": 0,
													"keys": [
														{
															"time": -0.0050000000000000044,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.10985714285714285,
															"value": 0.990909090909091,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0442025856483364,
																"dt": -0.03236681756882666
															},
															"nextHandle": {
																"dv": -0.7101515151515152,
																"dt": 0.5201428571428571
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.09909090909090912,
																"dt": -0.28
															},
															"nextHandle": {
																"dv": -0.10440845653217376,
																"dt": 0.29502573038449187
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": -0.002192311930100388,
															"value": 0.5546597199134521,
															"mode": 2
														},
														{
															"time": 0.1118079084351161,
															"value": 0.27959157920297506,
															"mode": 2
														},
														{
															"time": 0.2543081838916371,
															"value": 0.1282282715750936,
															"mode": 2
														},
														{
															"time": 0.31350060600434565,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keys": [
														{
															"time": -0.002192311930100388,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.1118079084351161,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2543081838916371,
															"value": 0.5268817204301075,
															"mode": 2
														},
														{
															"time": 0.31350060600434565,
															"value": 0.07692307692307693,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keys": [
														{
															"time": -0.002192311930100388,
															"value": 0.4627450980392157,
															"mode": 2
														},
														{
															"time": 0.1118079084351161,
															"value": 0.403921568627451,
															"mode": 2
														},
														{
															"time": 0.2543081838916371,
															"value": 0.1823529411764706,
															"mode": 2
														},
														{
															"time": 0.31350060600434565,
															"value": 0.10196078431372549,
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
												"range": 2.5,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"envBlend": 0.2,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.42,
												"saturation": 0,
												"width": 0.8,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.02,
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.7,
															"mode": 0,
															"prevHandle": {
																"dv": 1.6011294419737672e-16,
																"dt": -0.6537107038080433
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.7949999999999999
															}
														},
														{
															"time": 1,
															"value": 0.1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.009999999999999981,
																"dt": -0.39
															},
															"nextHandle": {
																"dv": -0.011182561444659758,
																"dt": 0.4361198963417483
															}
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.6011294419737672e-16,
																"dt": -0.6537107038080433
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.7949999999999999
															}
														},
														{
															"time": 1,
															"value": 0.1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.009999999999999981,
																"dt": -0.39
															},
															"nextHandle": {
																"dv": -0.011182561444659758,
																"dt": 0.4361198963417483
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
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.9,
											"mode": 0,
											"prevHandle": {
												"dv": 1.9871071861164984e-16,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.8809876543209877
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01282051282051282,
												"dt": -0.21777777777777785
											},
											"nextHandle": {
												"dv": 0.019664722888838422,
												"dt": 0.3332806368123195
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
											"value": 0.2,
											"mode": 0,
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
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10219946215442799,
												"dt": -0.79
											},
											"nextHandle": {
												"dv": 0.0338972586912773,
												"dt": 0.267255905650836
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
			"type": "polygon",
			"name": "Floor",
			"enabled": false,
			"editorOnly": true,
			"locked": true,
			"z": 1.5,
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
		}
	]
}